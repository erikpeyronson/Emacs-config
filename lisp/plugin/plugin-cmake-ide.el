;;; plugin-cmake-ide.el --- Configuration for cmake-ide

;; Author: Erik Peyronson

;;; Commentary:
;; Installs and configures cmake-ide
;; Collection of packages with ide tools
;; cmake projects
;;
;; More info https://github.com/atilaneves/cmake-ide

;;; Code:

(require 'gen-package)

(use-package cmake-ide
  :ensure t
  :config
  (cmake-ide-setup))


(provide 'plugin-cmake-ide)
;;; plugin-cmake-ide.el ends here
