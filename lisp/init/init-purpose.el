;;; init-purpose.el --- configure purpose mode

;;; Commentary:
;; Installs and configures purpose mode and adds purpose for message buffers
;; Currently only binds all * * to specific window
;;
;; Basic usage:
;; C-c m p - toggles purpose mode
;; 
;; More info: https://github.com/bmag/emacs-purpose 

;;; Code:
(require 'use-package)

(use-package window-purpose
  :config
  (require 'window-purpose-x)
  (purpose-x-kill-setup)
  (define-key toggle-mode-map (kbd "p") 'purpose-mode)
  (add-to-list 'purpose-user-mode-purposes '(eww-mode . doc))
  (add-to-list 'purpose-user-mode-purposes '(org-mode . doc))
  (add-to-list 'purpose-user-mode-purposes '(magit-mode . msg))
  (add-to-list 'purpose-user-name-purposes '("*Messages*" . msg))
  (add-to-list 'purpose-user-name-purposes '("*Ido Completions*" . msg))
  (add-to-list 'purpose-user-name-purposes '("*compilation*" . msg))
  (add-to-list 'purpose-user-name-purposes '("*Apropos*" . msg))
  (add-to-list 'purpose-user-name-purposes '("*Help*" . msg))
  (add-to-list 'purpose-user-name-purposes '("*Async Shell Command*" . msg))
  ;; (add-to-list 'purpose-user-regexp-purposes '(".*\\.cc" . src))
  ;; (add-to-list 'purpose-user-regexp-purposes '(".*\\.h" . header))
  (purpose-compile-user-configuration)
  (purpose-mode 1)
  :ensure t)

(provide 'init-purpose)
;;; init-purpose.el ends here
