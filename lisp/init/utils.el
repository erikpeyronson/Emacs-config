;;; utils.el --- handy functions

;;; Author: Various se individual functions

;;; Commentary:
;; defines a couple of good utility functions, some written by me
;; some copied from various forums

;;; Code:

;;; Toggle window-layout
;; Author: Erik Peyronson
;; toggles between your current window layout and a single window

(defun toggle-window-layout ()
  "Toggle between the selected window layout and single window."
  ;; (defvar window-layout-state)
  (interactive)
  (if (get 'toggle-window-layout 'state)
      (progn
	(jump-to-register 'W)
	(put 'toggle-window-layout 'state nil))
    (progn
      (window-configuration-to-register 'W)
      (delete-other-windows)
      (put 'toggle-window-layout 'state t))))

(defun toggle-window-layout ()
  "Toggle between the selected window layout and single window."
  ;; (defvar window-layout-state)
  (interactive)
  (if (get 'toggle-window-layout 'state)
      (progn
        (purpose-load-window-layout-file "~/.emcas.d/layouts/c++.window-layout")
	(put 'toggle-window-layout 'state nil))
    (progn
      (purpose-load-window-layout-file "~/.emcas.d/layouts/c++-big-compile.window-layout")
      (put 'toggle-window-layout 'state t))))

;;; Comment-or-uncomment-region-or-line
;; Author: Stack overflow user gerstmann
;; Source: https://sites.google.com/site/steveyegge2/my-dot-emacs-file

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;;; File and buffer management functions
;; Author: Steve Yegge
;; Source https://sites.google.com/site/steveyegge2/my-dot-emacs-file

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

(defun get-above-makefile ()
  "Compile with makefile in parent dir"
  (let ((dir (locate-dominating-file "." "Makefile")))
    (when dir
      (concat dir "Makefile"))))

(defun set-window-width (n)
  "Set the selected window's width to N columns."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 80))

(defun indent-buffer ()
  "Mark the whole buffer indent and return to the position started."
  (interactive)
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(global-set-key (kbd "C-c H") 'indent-buffer)

(global-set-key "\C-x~" 'set-80-columns)

;; bind compiling with get-above-makefile to f5
(global-set-key [f5] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s" (get-above-makefile)))))
(global-set-key [f6] (lambda () (interactive) (compile (format
							"make -j8 -f %s test" (get-above-makefile)))))
(global-set-key [f7] (lambda () (interactive) (compile (format
                                                        "make -f %s clean" (get-above-makefile)))))
(global-set-key [f8] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s bit-run" (get-above-makefile)))))
(global-set-key [f9] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s bit-memcheck" (get-above-makefile)))))
(provide 'utils)
;;; utils.el ends here
