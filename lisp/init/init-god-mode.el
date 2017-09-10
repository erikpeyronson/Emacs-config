;; init-god-mode -- Install and configure god mode

;;; Commentary:
;; 

;;; Code:
(require 'use-package)
(require 'utils)


(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

;; (require 'init-behavior)
;; (defun c/god-mode-update-cursor ()
;;   (let ((limited-colors-p (> 257 (length (defined-colors)))))
;;     (cond (god-local-mode (progn
;;                             (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
;;                             (set-face-foreground 'mode-line (if limited-colors-p "black" "#000000"))
;;                             (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))                            
;;                             (set-face-foreground 'mode-line-inactive (if limited-colors-p "black" "#000000"))))
;;           (t (progn
;;                (set-face-background 'mode-line (if limited-colors-p "gray" "#333333"))
;;                (set-face-foreground 'mode-line (if limited-colors-p "zenburn-green" "#5F7F5F"))
;;                (set-face-foreground 'mode-line-inactive (if limited-colors-p "zenburn-green" "#5F7F5F"))
;;                (set-face-background 'mode-line-inactive (if limited-colors-p "gray" "#333333")))))))
               ;; (load-theme "zenburn"))))))


(use-package god-mode
  :config
  (require 'god-mode-isearch)
  (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
  (define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

  ;; (setq god-exempt-major-modes nil)
  ;; (setq god-exempt-predicates nil)

  (global-set-key (kbd "<escape>") 'god-mode)
  (define-key god-local-mode-map (kbd "i") 'god-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)
  (define-key god-local-mode-map (kbd "z") 'repeat)

  (define-key god-local-mode-map (kbd "C-x C-o") 'other-window)
  (define-key god-local-mode-map (kbd "C-x o") 'delete-blank-lines)
  
  (define-key god-local-mode-map (kbd "C-x C-1") 'delete-other-windows)
  (define-key god-local-mode-map (kbd "C-x C-2") 'split-window-below)
  (define-key god-local-mode-map (kbd "C-x C-3") 'split-window-right)
  (define-key god-local-mode-map (kbd "C-x C-0") 'delete-window)
  
  ;; (define-key god-local-mode-map (kbd "C-x C-b") 'purpose-friendly-switch-buffer)
  ;; (define-key god-local-mode-map (kbd "C-u C-x C-b") 'switch-buffer-without-purpose)
  ;; (define-key god-local-mode-map (kbd "C-x b") 'ibuffer)
  (define-key god-local-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

  (define-key god-local-mode-map (kbd "C-x C-x") 'exchange-point-and-mark)

  (define-key god-local-mode-map (kbd "C-c C-w C-m") 'whitespace-mode)
  (define-key god-local-mode-map (kbd "C-c C-w C-c") 'whitespace-cleanup)

  (define-key god-local-mode-map (kbd "C-c C-s") 'speedbar)
  (define-key god-local-mode-map (kbd "C-c C-a") 'semantic-speedbar-analysis)
  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  ;; (add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)   
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)
  ;; (add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor
  :ensure t)

(provide 'init-god-mode)
;;; init-god-mode.el ends here



