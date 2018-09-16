(defvar-local cp/compile-program "make"
  "Program used when when calling `my-compile'")

(defvar-local cp/compile-flags "-j8 test"
  "Flags passed to `cp/make-program' when calling `my-compile'")

(defvar-local cp/compile-command-func #'cp//create-make-command
  "Function used to set `compile-command' when calling `cp/compile'")

(defvar-local cp/compile-directory-func #'cp//dominating-makefile
  "Function used to set `default-directory' when calling `cp/compile'")

(defvar cp//compilation-queue nil
  "List of pending compilation commands")

(defvar cp/project-root-function #'projectile-project-root)

;; helpers
(defun cp//create-make-command()
  "Create as a string suitable for passing as command to `compile'
	Uses `cp/make-program' `cp/make-flags'"
  (concat cp/compile-program " " cp/compile-flags " "))

(defun cp//default-directory-function()
  default-directory)

(defun cp//dominating-makefile ()
  "Search up the directory and return path to closest above Makefile"
  (locate-dominating-file "." "Makefile"))

;; commands
(defun cp/compile (&optional prompt flags)
  "Run compile interactively with custom `compile-command' and `default-directory'
	command will be generated by `cp/compile-command-func'and default directory by
	`cp/compile-directory-func'.  with optional argument NO-PROMPT set to t run
	without prompting user to edit command use optional argument FLAGS to provide the
	compile command string with extra flags"
  (interactive)
  (let ((default-directory (funcall cp/compile-directory-func))
	(compile-command (funcall cp/compile-command-func))
	(compilation-read-command (not prompt)));; promt user before runnint
    (when flags
      (setq compile-command (concat compile-command flags " ")))
    (call-interactively #'compile)))

(cl-defstruct cp/compilation-entry
  directory
  program
  flags
  result)

(defvar cp/new-pending-compilations nil)
(defvar cp/curr-compilation nil)
(defun cp/new-compile ()
  (interactive)
  (let (entry)
    (setq entry
	  (make-cp/compilation-entry
	   :directory (funcall cp/compile-directory-func)
	   :program cp/compile-program
	   :flags cp/compile-flags
	   :result nil))
    (cp/new-queue-compilation entry)))

(defun cp/new-queue-compilation (entry)
  (push entry cp/new-pending-compilations)
  (cp/new-compile-next))

(defun cp/make-command (entry)
  (format "%s %s"
	  (cp/compilation-entry-program entry)
	  (cp/compilation-entry-flags entry)))

(defun cp/log-result (entry)
  (message "Logging compilation")
  (message (cp/compilation-entry-directory entry))
  (message (cp/compilation-entry-result entry)))


(defun cp/new-compile-next (&optional buffer result)
  (unless (get-buffer-process "*compilation*")
    (when result
      (cp//log-result cp/curr-compilation))
    (when buffer
      (with-current-buffer buffer
	(clone-buffer (generate-new-buffer-name
		       "*finished compilation*"))))
    (setq cp/curr-compilation (pop cp/new-pending-compilations))
    (let ((default-directory (cp/compilation-entry-directory cp/curr-compilation)))
      (compile (cp/make-command cp/curr-compilation)))))

(defun cp//log-result (result)
  (message result))


(defun cp/compile-in-project-with-read ()
  (interactive)
  (let ((default-directory
	  (file-name-directory (completing-read
	   "Select makefile: "
	   (directory-files-recursively
	    (funcall cp/project-root-function) "Makefile")))))
    (cp/compile)))

(defun cp/queue-compilation()
  (interactive)
  (push `(,(funcall cp/compile-directory-func)
	  ,(funcall cp/compile-command-func))
	cp//compilation-queue)
  (cp//compile-next))

(defun cp/compile-everything ()
  (interactive)
  (let ((makefiles (directory-files-recursively
		    (funcall cp/project-root-function) "Makefile")))
    (dolist (direc makefiles nil)
      (let ((default-directory direc))
	(cp/queue-compilation)))))

(defun cp//compile-next (&optional buffer result)
  (unless (get-buffer-process "*compilation*")
    (let* ((next (car cp//compilation-queue))
	   (directory (car next))
	   (command (cdr next)))
      (when result
	(cp//log-result result))
      (when buffer
	(with-current-buffer buffer
	  (clone-buffer (generate-new-buffer-name
			 "*finished compilation*"))))
      (setq cp//compilation-queue (cdr cp//compilation-queue))
      (let ((default-directory directory)
	    (compilation-read-command nil))
	(when directory
	  (compile command))))))

(defvar cp//last-report nil
  "path to file opened by `cp//open-last-report'
     see also `cp//compile-and-open'")

(defvar cp/open-log-function #'eww-open-file
  "Function used to open file in `cp//open-last-report'
     see also `cp//compile-and-open'")

(defun cp/compile-and-gcov()
  "Run tests and make covr report then open the gcov report using `cp//compile-and-open'"
  (interactive
   (cp//compile-and-open "test USE_GCOV=1 && make gcovr-html"
			 "gcov/index.html")))

(defun cp/browse-last-log ()
  (interactive)
  (let ((cp/open-log-function #'browse-url))
    (cp//open-last-report)))

(defun cp//compile-and-open (flags path)
  "Run `my-compile' with FLAGS as argument open browse PATH using
     `cp/open-log-function'"
  (when (not (member 'compilation-finish-functions #'cp//open-last-report))
    (add-hook 'compilation-finish-functions #'cp//open-last-report))
  (setq cp//last-report (concat (funcall cp/compile-directory-func)
				path))
  (cp/compile nil flags))

(defun cp//open-last-report (&optional buffer result)
  (when (member 'compilation-finish-functions #'cp//open-last-report)
    (remove-hook 'compilation-finish-functions #'cp//open-last-report))
  (when (string-match-p "finished" result)
    (with-selected-window (get-buffer-window buffer)
      (funcall cp/open-log-function cp//last-report))))

(require 'cc-cmds)
(require 'subr-x)
(defvar cp/gtest-header-regexp "^TEST\\(?:_F\\)?(\\(.*\\), \\(.*\\)) {$")
(defvar cp/test-filename-regexp "^.*test.cc")
(defvar cp/gtest-env-var-name "RUN_ARGS")
(defvar cp/test-list nil)

(defun cp//parse-file-old ()
  (save-excursion
    (goto-char (point-min))
    (let (test-list)
      (while (re-search-forward cp/gtest-header-regexp (point-max) t)
	(next-line)
	(let ((test (cp//parse-gtest-at-point)))
	  (push (format "%s.%s" (car test) (cdr test)) test-list)))
      test-list)))

(defun cp//read-lines(file)
  (with-temp-buffer
    (insert-file-contents file)
    (split-string (buffer-string) "\n" t)))

(defun cp//parse-line (line)
  (if (string-match cp/gtest-header-regexp line)
      `(,(match-string 1 line) . ,(match-string 2 line))))

(defun cp//parse-file (file)
  (remove nil (mapcar 'cp//parse-line (cp//read-lines file))))

(defun cp//parse-dir (dir)
  (let ((files (directory-files-recursively dir cp/test-filename-regexp))
	(tests))
    (dolist (file files tests)
      (setq tests (append tests (cp//parse-file file))))
    tests))

(defun cp//format-test-entry(entry)
  (format "%s.%s" (car entry) (cdr entry)))

(defun cp//format-test-list(list)
  (mapcar 'cp//format-test-entry list))

(defun cp//run-test-in-file ()
  (interactive)
  (cp/compile
   nil
   (format
    "RUN_ARGS=-gtest=filter=%s"
    (completing-read
     "select test:"
     (cp//format-test-list (cp//parse-file (buffer-file-name)))))))

(defun cp//run-test-in-dir ()
  (interactive)
  (cp/compile
   nil
   (format
    "RUN_ARGS=-gtest=filter=%s"
    (completing-read
     "select test:"
     (cp//format-test-list (cp//parse-dir default-directory))))))

(defun cp//run-test-in-project ()
  (interactive)
  (cp/compile
   nil
   (format
    "RUN_ARGS=-gtest=filter=%s"
    (completing-read
     "select test:"
     (cp//format-test-list (cp//parse-dir (funcall cp/project-root-function)))))))

(defun cp//parse-gtest-at-point ()
  "Attempt to parse information about gtest at point
     Returns a cons cell on the form (group . case) if found nil otherwhise"
  (interactive)
  (save-excursion
    (c-beginning-of-defun)
    (let ((line (string-trim-right (thing-at-point 'line t))))
      (if (string-match cp/gtest-header-regexp line)
	  `(,(match-string 1 line) . ,(match-string 2 line))
	(message "could not parse test")
	nil))))

(defun cp//gtest-repeat(num)
  "Return the string -gtest_repeat=NUM if num is greater than 1"
  (if (/= num 1)
      (format "--gtest_repeat=%d"
	      num)
    ""))

(defun cp//gtest-filter(group &optional case)
  "return the string -gtest_filter=GROUP.CASE
     if optional argument CASE is omitted return GRUOP.* instead"
  (format "--gtest_filter=%s.%s"
	  group (if case
		    case
		  "*")))

(defun cp//gtest-flags(num group &optional case)
  "Create gtest flags required to run test CASE in GROUP NUM times"
  (string-trim-right (format "%s %s"
			     (cp//gtest-filter group case)
			     (cp//gtest-repeat num))))

(defun cp/compile-gtest-test-at-point (&optional arg)
  "Compile and run google test and filter for test case at point
     If called interactively with prefix arg repeat ARG times"
  (interactive "p")
  (let* ((test (cp//parse-gtest-at-point))
	 (group (car test))
	 (case (cdr test)))
    (cp/compile t (format "%s=\"%s\" test"
			 cp/gtest-env-var-name
			  (cp//gtest-flags arg group case)))))

(defun cp/compile-gtest-suite-at-point (&optional arg)
  "Compile and run google test and filter for test group at point
     If called interactively with prefix arg repeat ARG times"
  (interactive "p")
  (let* ((test (cp//parse-gtest-at-point))
	 (group (car test)))
    (cp/compile t (format "RUN_ARGS=\"%s\" test"
			  (cp//gtest-flags arg group)))))

(provide 'compile-plus)