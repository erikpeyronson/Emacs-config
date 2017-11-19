;;; plugin-projectile.el --- Configure projectile

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures projectile project management package
;;
;; More info https://github.com/bbatsov/projectile

;;; Code:

(require 'use-package)
(require 'gen-key-bindings)

(use-package projectile
  :ensure t
  :config
  (define-key toggle-mode-map (kbd "p") 'projectile-mode)
  (projectile-mode 1)
  (setq projectile-enable-caching t))

(provide 'plugin-projectile)
;;; plugin-projectile.el ends here
