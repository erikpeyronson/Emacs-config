;;; plugin-company.el --- Setup company mode 

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures company-mode auto-completion
;;
;; More info https://github.com/company-mode/company-mode

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package company
  :config
  
  (define-key toggle-mode-map (kbd "c") 'company-mode)
 
  (when cfg-enable-python
    (use-package jedi-core
      :ensure t)
    (use-package company-jedi
      :config
      (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
      :ensure t))
  
  (when cfg-enable-c++
    (use-package company-c-headers
      :config
      (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.4.4")
      (add-to-list 'company-backends 'company-c-headers)
      ;;    (remove 'company-backends 'Clang)
      :ensure t))
  
  (when cfg-enable-erlang
    (use-package company-erlang
      :config
      (add-hook 'erlang-mode-hook (lambda () (add-to-list 'company-backends 'company-erlang)))
      :ensure t))

  ;; Hooks
  (when cfg-company-hooks
    (when cfg-enable-emacs-lisp (add-hook 'emacs-lisp-mode-hook 'company-mode))
    (when cfg-enable-c++ (add-hook 'c++-mode-hook 'company-mode))
    (when cfg-enable-python (add-hook 'python-mode-hook 'company-mode))
    (when cfg-enable-erlang (add-hook 'erlang-mode-hook 'company-mode)))
  
  :ensure t)


(provide 'plugin-company)
;;; plugin-company.el ends here

