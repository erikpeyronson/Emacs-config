;;; init-projectile.el --- configure projectile

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures projectile project management package
;;
;; Basic usage:
;; C-x m p toggle projectile-mode
;;
;; More info https://github.com/bbatsov/projectile

;;; Code:

(require 'use-package)

(use-package projectile
  :config
  (define-key toggle-mode-map (kbd "p") 'projectile-mode)
  (projectile-mode 1)
  (setq projectile-enable-caching t)
  :ensure t)
(provide 'init-projectile)
;;; init-projectile.el ends here
