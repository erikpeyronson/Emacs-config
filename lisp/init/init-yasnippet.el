;;; init-yasnippet.el --- yassnippet configuaration

;; Author: Erik Peyronson

;;; Commentary:
;; Load and enable yasnippet set folder for custom snippets
;;
;; More info: https://github.com/joaotavora/yasnippet

;;; Code:
(require 'use-package)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (define-key toggle-mode-map (kbd "y") 'menu-bar-mode)
  :ensure t)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here



