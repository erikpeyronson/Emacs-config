;;; plugin-purpose.el --- Setup purpose mode

;;; Commentary:
;; Installs and configures purpose mode and adds purpose for message buffers
;;
;; More info: https://github.com/bmag/emacs-purpose

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package window-purpose
  :config
  (define-key toggle-mode-map (kbd "p") 'purpose-mode)
  (define-key purpose-mode-map (kbd "C-c , l w") 'purpose-load-window-layout)
  (define-key purpose-mode-map (kbd "C-c , s w") 'purpose-save-window-layout)
  (define-key purpose-mode-map (kbd "C-c , l w") 'purpose-load-frame-layout)
  (define-key purpose-mode-map (kbd "C-c , s w") 'purpose-save-frame-layout)
  (require 'window-purpose-x)
  (purpose-x-kill-setup)

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

  (purpose-compile-user-configuration)
  (purpose-mode 1)
  :ensure t)

(defun toggle-big-compile ()
  "Toggle between the selected window layout and single window."
  (msg)
  (if (get 'toggle-window-layout 'state)
      (progn
        (purpose-load-window-layout 'big)
        (put 'toggle-window-layout 'state nil))
    (progn
      (purpose-load-window-layout 'small)
      (put 'toggle-window-layout 'state t))))


(provide 'plugin-purpose)
;;; plugin-purpose.el ends here
