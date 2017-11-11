;;; lang-emacs-lisp -- Emacs lisp configuration

;;; Commentary:
;; Adds a hook to enable electric-pair mode for all buffers running
;; emacs-lisp-mode

;;; Code:
(add-hook 'emacs-lisp-mode-hook #'(lambda () (electric-pair-local-mode)))

(provide 'lang-emacs-lisp)
;;; lang-emacs-lisp.el ends here
