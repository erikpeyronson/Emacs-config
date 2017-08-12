;;; init-cmake-ide.el --- configure cmake-ide

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configure cmake-ide package with ide tools based on
;; cmake projects
;;
;; More info https://github.com/atilaneves/cmake-ide

;;; Code:

(require 'use-package)

(use-package cmake-ide
  :config
  (cmake-ide-setup)
  :ensure t)

(provide 'init-cmake-ide)
;;; init-cmake-ide.el ends here
