;;; plugin-cmake-ide.el --- Setup cmake-ide

;; Author: Erik Peyronson

;;; Commentary:
;; Collection of  package with ide tools based on
;; cmake projects
;;
;; More info https://github.com/atilaneves/cmake-ide

;;; Code:

(require 'gen-package)

(use-package cmake-ide
  :config
  (cmake-ide-setup)
  :ensure t)

(provide 'plugin-cmake-ide)
;;; plugin-cmake-ide.el ends here
