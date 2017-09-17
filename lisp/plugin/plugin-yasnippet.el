;;; plugin-yasnippet.el --- yassnippet configuaration

;; Author: Erik Peyronson

;;; Commentary:
;; Install and globally enable yasnippet
;;
;; More info: https://github.com/joaotavora/yasnippet

;;; Code:
(require 'gen-package)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  :ensure t)

(provide 'plugin-yasnippet)
;;; plugin-yasnippet.el ends here



