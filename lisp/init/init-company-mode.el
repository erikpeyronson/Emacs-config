;;; init-company-mode.el --- company-mode configuration

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures company-mode with c/c++-headers
;; Sets up backends for arduino- and erlang-mode when avaliable
;;
;; More info https://github.com/company-mode/company-mode

;;; Code:

(require 'use-package)
(require 'init-key-bindings)

(use-package company
  :config
;;  (setq company-backends (delete 'company-clang company-backends))
  (use-package company-c-headers
    :config
    (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.4.4")
    (add-to-list 'company-backends 'company-c-headers)
;;    (remove 'company-backends 'Clang)
    :ensure t)
  
  (when (package-installed-p 'erlang-mode)  
    (use-package company-erlang
      :config
      (add-hook 'erlang-mode-hook (lambda () (add-to-list 'company-backends 'company-erlang)))
      :ensure t))
  
  (when (package-installed-p 'arduino-mode)  
    (use-package company-arduino
      :config
      (add-hook 'arduino-mode-hook (lambda () (add-to-list 'company-backends 'company-erlang)))
      :ensure t))
  
  (add-hook 'c++-mode-hook 'company-mode)
  (define-key toggle-mode-map (kbd "c") 'company-mode)
  :ensure t)


(provide 'init-company-mode)
;;; init-company-mode.el ends here

