;;; plugin-projectile.el --- Configure projectile

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures projectile project management package
;;
;; More info https://github.com/bbatsov/projectile

;;; Code:

(require 'use-package)

(use-package projectile
  :config
  ;; Toggle key
  (define-key toggle-mode-map (kbd "C-p") 'projectile-mode)

  (projectile-mode 1)
  (setq projectile-enable-caching t)

  :ensure t)

(provide 'plugin-projectile)
;;; plugin-projectile.el ends here
