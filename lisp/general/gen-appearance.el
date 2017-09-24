;;; gen-appearance -- Configure interface and appearance

;;; Commentary:
;; Sets up theme, modeline and other things related to the look and
;; feel of emacs

;;; Code:

;; Interface
(require 'gen-package)

(setq-default frame-title-format '("emacs: %f"))
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode)
(transient-mark-mode 0)
(set-face-attribute 'default nil :height 100);

;; Theme and modeline
;; (use-package zenburn-theme
;;   :ensure t)
(load-theme 'wombat)
(set-cursor-color "#00FFFF")
(use-package powerline
  :ensure t)

(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (smart-mode-line-enable)
  (powerline-default-theme)
  :ensure t)

(use-package nlinum
  :config
  (global-nlinum-mode)
  :ensure t)

(provide 'gen-appearance)
;;; gen-appearance.el ends here
