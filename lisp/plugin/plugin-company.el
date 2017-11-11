;;; plugin-company.el --- Configuration for company mode

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures company-mode auto-completion and extra
;; backends for enabled languages, sets up hooks according to flags
;; set in init.el
;;
;; More info https://github.com/company-mode/company-mode

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package company
  :config
  ;; Toggle key
  (define-key toggle-mode-map (kbd "c") 'company-mode)

  ;; c++ configuration
  (when cfg-cpp-enable
    (when cfg-cpp-company-hook
      (add-hook 'c++-mode-hook 'company-mode))

    (use-package company-c-headers
      :config
      (add-to-list 'company-backends 'company-c-headers)
      :ensure t))

  ;; Python configuration
  (when cfg-python-enable
    (when cfg-python-company-hook
      (add-hook 'python-mode-hook 'company-mode))
    (use-package jedi-core
      :ensure t)
    (use-package company-jedi
      :config
      (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
      :ensure t))

  ;; Erlang configuration
  (when cfg-erlang-enable
    (use-package company-erlang
      :config
      (add-hook 'erlang-mode-hook (lambda () (add-to-list 'company-backends 'company-erlang)))

      (when cfg-erlang-company-hook
        (add-hook 'erlang-mode-hook 'company-mode))
      :ensure t))

  ;; Emacs lisp configuration
  (when cfg-emacs-lisp-enable
    (when cfg-emacs-lisp-company-hook
      (add-hook 'emacs-lisp-mode-hook 'company-mode)))

  ;; Go configuration
  (when cfg-go-enable
    (use-package company-go
      :config
      (add-hook 'go-mode-hook (lambda () (add-to-list 'company-backends 'company-go)))
      (when cfg-go-company-hook
        (add-hook 'go-mode-hook 'company-mode))
      :ensure t))

  :ensure t)

(provide 'plugin-company)
;;; plugin-company.el ends here

