;;; init-god-mode -- Install and configure god mode

;;; Commentary:
;; 

;;; Code:
(require 'use-package)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))
(use-package god-mode
  :config
  (require 'god-mode-isearch)
  (define-key isearch-mode-map (kbd "<escape>") 'god-mode-isearch-activate)
  (define-key god-mode-isearch-map (kbd "<escape>") 'god-mode-isearch-disable)

  (global-set-key (kbd "<escape>") 'god-local-mode)
  (define-key god-local-mode-map (kbd "i") 'god-local-mode)
  (define-key god-local-mode-map (kbd ".") 'repeat)
  (define-key god-local-mode-map (kbd "z") 'repeat)
  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)
  (god-mode)
  :ensure t)

(provide 'init-god-mode)
;;; init-god-mode.el ends here
