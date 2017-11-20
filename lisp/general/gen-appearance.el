;;; gen-appearance -- Configure interface and appearance

;;; Commentary:
;; Sets up theme, modeline and other things related to the look and
;; feel of emacs

;;; Code:

;; Interface

;; Theme
;; (use-package atom-one-dark-theme
;;   :ensure t
;;   :config)
;; (load-theme 'atom-one-dark t)
;; Etc
(setq-default frame-title-format '("emacs: %f"))
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(require 'hl-line)
;; (set-face-background 'hl-line "gray25")
(global-hl-line-mode)
(transient-mark-mode 0)
(set-face-attribute 'default nil :height 100);

(provide 'gen-appearance)
;;; gen-appearance.el ends here
