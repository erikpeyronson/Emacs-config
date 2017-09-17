;; plugin-god-mode -- Setup god-mode

;;; Commentary:
;; God mode provides semi-modal editing for emacs.
;; 
;; More info https://github.com/chrisdone/god-mode

;;; Code:
(require 'gen-package)
(require 'gen-utils)
(require 'gen-key-bindings)


(defun god-mode-toggle-cursor ()
  (setq cursor-type
        (if (or god-local-mode buffer-read-only)
            'box
          'bar)))


(use-package god-mode
  :config
  (require 'god-mode-isearch)
  (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
  (define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

  ;; (setq god-exempt-major-modes nil)
  ;; (setq god-exempt-predicates nil)

  (global-set-key (kbd "<escape>") 'god-mode-all)
  
  (define-key god-local-mode-map (kbd "i") 'god-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)
  (define-key god-local-mode-map (kbd "z") 'repeat)

  (define-key god-local-mode-map (kbd "C-x C-o") 'other-window)
  (define-key god-local-mode-map (kbd "C-x o") 'delete-blank-lines)
  
  (define-key god-local-mode-map (kbd "C-x C-1") 'delete-other-windows)
  (define-key god-local-mode-map (kbd "C-x C-2") 'split-window-below)
  (define-key god-local-mode-map (kbd "C-x C-3") 'split-window-right)
  (define-key god-local-mode-map (kbd "C-x C-0") 'delete-window)
  
  (define-key god-local-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

  (define-key god-local-mode-map (kbd "C-x C-x") 'exchange-point-and-mark)

  (define-key god-local-mode-map (kbd "C-c C-w C-m") 'whitespace-mode)
  (define-key god-local-mode-map (kbd "C-c C-w C-c") 'whitespace-cleanup)

  (define-key god-local-mode-map (kbd "C-c C-s") 'speedbar)
  (define-key god-local-mode-map (kbd "C-c C-a") 'semantic-speedbar-analysis)
  (add-hook 'god-mode-enabled-hook 'god-mode-toggle-cursor)
  (add-hook 'god-mode-disabled-hook 'god-mode-toggle-cursor)
  :ensure t)

(provide 'plugin-god-mode)
;;; plugin-god-mode.el ends here



