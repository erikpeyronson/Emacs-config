;; init.el --- Emacs init-file

;; Code:
(package-initialize)
(require 'org)

(defvar my-config-file (expand-file-name "config.org"
					 user-emacs-directory)
  "path to org file expanded using babel and evaluated at startup")

(org-babel-load-file my-config-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-src-fontify-natively t)
 '(package-selected-packages
   (quote
    (ivy-rtags flycheck-rtags company-rtags rtags ace-window ace-jump-mode ace-jump evil-avy avy expand-region org-evil solarized-theme bind-map use-package projectile ivy flycheck evil-surround evil-rsi evil-nerd-commenter evil-iedit-state evil-exchange evil-escape company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
