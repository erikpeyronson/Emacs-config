;;; init-appearence -- Configure general emacs behavior

;;; Commentary:
;; Place backup-files and other temporary files .emacs.d/tmp

;;; Code:

(use-package zenburn-theme
  :ensure t)

;;( use-package smart-mode-line
 ;;  :config
 ;;  (setq sml/no-confirm-load-theme t)
 ;;  (setq sml/theme 'respectful)
 ;;  (smart-mode-line-enable)
 ;;  :ensure t)

(use-package nlinum
  :config
  (global-nlinum-mode)
  :ensure t)

(setq-default frame-title-format '("emacs: %f"))
(setq-default cursor-type 'bar)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode)
(transient-mark-mode 0)
(set-face-attribute 'default nil :height 115);
(set-face-attribute 'default t :font "DejaVu Sans Mono" )

(provide 'init-appearence)
;;; init-appearence.el ends here
