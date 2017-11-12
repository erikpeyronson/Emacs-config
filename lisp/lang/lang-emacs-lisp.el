;;; lang-emacs-lisp -- Emacs lisp configuration

;;; Commentary:
;; Adds a hook to enable electric-pair mode for all buffers running
;; emacs-lisp-mode

;;; Code:

(defun my-emacs-lisp-mode-setup ()
  "Function that run configuration hooked to 'emacs-lisp-mode-hook'."
  (define-key emacs-lisp-mode-map (kbd "C-c RET") 'emacs-lisp-byte-compile)
  (electric-pair-local-mode))

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-setup)
;; (add-hook 'emacs-lisp-mode-hook #'(lambda () ()))

(provide 'lang-emacs-lisp)
;;; lang-emacs-lisp.el ends here
