;;; plugin-flycheck.el --- Configure flycheck

;;; Commentary:
;; Installs and configures flycheck syntax correction sets upp hooks
;; according to flags set in init.el

;; More info https://github.com/flycheck/flycheck

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package flycheck
  :config
  ;; Toggle key
  (define-key toggle-mode-map (kbd "f") 'flycheck-mode)

  ;; c++ configuration
  (when cfg-cpp-enable
    (when cfg-cpp-flycheck-hook
      (add-hook 'c++-mode-hook 'flycheck-mode)))

  ;; Python configuration
  (when cfg-python-enable
    (when cfg-python-flycheck-hook
      (add-hook 'python-mode-hook 'flycheck-mode)))

  ;; Erlang configuration
  (when cfg-erlang-enable
    (when cfg-erlang-flycheck-hook
      (add-hook 'erlang-mode-hook 'flycheck-mode)))

  ;; Emacs lisp configuration
  (when cfg-emacs-lisp-enable
    (when cfg-emacs-lisp-flycheck-hook
      (add-hook 'emacs-lisp-mode-hook 'flycheck-mode)))

  ;; Go configuration
  (when cfg-go-enable
    (use-package flycheck-gometalinter
      :config
      (when cfg-go-flycheck-hook
        (add-hook 'go-mode-hook 'flycheck-mode)
        :ensure t)))

  :ensure t)

(provide 'plugin-flycheck)
;;; plugin-flycheck.el ends here
