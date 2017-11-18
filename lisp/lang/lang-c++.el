;;; lang-c++ --- Configuration for C++

;;; Commentary:
;; Use the google-c-style for indentation, Make h and tcc files use
;; c++-mode Set up a key-map to override some built in key-bindings
;; while in c++-mode

;;; Code:
(require 'gen-package)
(require 'cfg-custom-variables)
(use-package google-c-style
  :config
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

(defvar my-cxx-flags "-Wall -Wextra"
  "Flags passed to 'compile command' for c++-mode buffers visiting a file with no Makefile.")
(defvar my-make-flags "-j16"
    "Flags passed to 'compile command' for c++-mode buffers visiting a file with Makefile.")
(defvar my-make-target ""
  "Target passed to compile-command'.")

(defvar my-cxx-standard "-std=c++14"
  "C++ standard passed to various plugins and 'compile-command'.")

(defun my-get-above-makefile ()
  "Get path to the closest above Makefile."
  (let ((dir (locate-dominating-file "." "Makefile")))
    (when dir
      (concat dir "Makefile"))))

(defun my-generate-c++-compile-command ()
  "Set the 'compile-command' variable for c++ mode if the buffer is visiting a file."
  (interactive)
     (when (buffer-file-name)
       (if (setq makefile-path (my-get-above-makefile))
           (set (make-local-variable 'compile-command)
                (format "make %s -f %s%s " my-make-flags makefile-path my-make-target))
         (set
          (make-local-variable 'compile-command)
          (format "g++ %s -o %s %s "
                  my-cxx-standard my-cxx-flags
                  (file-name-base buffer-file-name)
                  (buffer-name))))))

(defun my-c++-mode-setup ()
  "Configuration hooked to 'c++-mode-hook' keybindings, indentation style, 'compile-command' etc."
  (define-key c++-mode-map (kbd "C-c RET") 'recompile)
  (define-key c++-mode-map (kbd "C-c M-m") 'compile)
  (google-set-c-style)
  (my-generate-c++-compile-command))

(add-hook 'c++-mode-hook 'my-c++-mode-setup)

(provide 'lang-c++)
;;; lang-c++.el ends here
