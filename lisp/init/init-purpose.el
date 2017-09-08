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
  ;;  ( (kbd "p") 'purpose-mode)

  (define-prefix-command 'purpose-mode-map)
  (global-set-key (kbd "C-c l l") 'purpose-load-window-layout)
  (global-set-key (kbd "C-c l t") 'toggle-big-compile)
  (add-to-list 'purpose-user-mode-purposes '(eww-mode . terminal))
  (add-to-list 'purpose-user-mode-purposes '(org-mode . terminal))
  (add-to-list 'purpose-user-mode-purposes '(magit-mode . terminal))
  (add-to-list 'purpose-user-name-purposes '("*Ibuffer*" . terminal))
  
  (add-to-list 'purpose-user-name-purposes '("*Ido Completions*" . terminal))
  (add-to-list 'purpose-user-name-purposes '("*Messages*" . terminal))
  (add-to-list 'purpose-user-name-purposes '("*Ido Completions*" . terminal))
  (add-to-list 'purpose-user-name-purposes '("*compilation*" . terminal)) ;
  (add-to-list 'purpose-user-name-purposes '("*Apropos*" . terminal))
  (add-to-list 'purpose-user-name-purposes '("*Help*" . terminal))
  (add-to-list 'purpose-user-name-purposes '("*Async Shell Command*" . terminal))

  ;; (add-to-list 'purpose-user-regexp-purposes '(".*\\.cc" . src))
  ;; (add-to-list 'purpose-user-regexp-purposes '(".*\\.h" . header))
  (purpose-compile-user-configuration)
  (purpose-mode 1)
  :ensure t)

(defun toggle-big-compile ()
  "Toggle between the selected window layout and single window."
  ;; (defvar window-layout-state)
  (msg)
  (if (get 'toggle-window-layout 'state)
      (progn
        (purpose-load-window-layout 'big)
	(put 'toggle-window-layout 'state nil))
    (progn
      (purpose-load-window-layout 'small)
      (put 'toggle-window-layout 'state t))))


(provide 'init-purpose)
;;; init-purpose.el ends here
