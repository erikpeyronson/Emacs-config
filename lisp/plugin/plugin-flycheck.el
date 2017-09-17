;;; plugin-flycheck.el --- Setup flycheck

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures flycheck syntax correction
;;
;; More info https://github.com/flycheck/flycheck

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package flycheck
  :config
  ;; Toggle key
  (define-key toggle-mode-map (kbd "f") 'flycheck-mode)

  ;; Hooks
  (when cfg-flycheck-hooks
    (when cfg-enable-c++ (add-hook 'c++-mode-hook 'flycheck-mode))
    (when cfg-enable-python (add-hook 'python-mode-hook 'flycheck-mode))
    (when cfg-enable-erlang (add-hook 'erlang-mode-hook 'flycheck-mode))
    (when cfg-enable-emacs-lisp (add-hook 'emacs-lisp-mode-hook 'flycheck-mode)))
                          
  :ensure t)

(provide 'plugin-flycheck)
;;; plugin-flycheck.el ends here
