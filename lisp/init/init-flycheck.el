;;; init-flycheck.el --- flycheck-configuration

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures flycheck syntax correction
;;
;; Basic usage:
;; C-x m f toggle flycheck-mode
;;
;; More info https://github.com/flycheck/flycheck

;;; Code:
(require 'use-package)
(require 'init-key-bindings)

(use-package flycheck
  :config
  (global-flycheck-mode)
  (define-key toggle-mode-map (kbd "f") 'flycheck-mode)
  :ensure t)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
