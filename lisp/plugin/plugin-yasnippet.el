;;; plugin-yasnippet.el --- Configuration for yasnippet

;; Author: Erik Peyronson

;;; Commentary:
;; Install and configures yasnippet
;;
;; More info: https://github.com/joaotavora/yasnippet

;;; Code:
(require 'gen-package)

(use-package yasnippet
  :ensure t
  :defer 10
  :config
  (when cfg-go-enable

    ;; Go snippets
    (use-package go-snippets
      :ensure t))

  (add-hook 'prog-mode-hook 'yas-minor-mode))

  (provide 'plugin-yasnippet)
;;; plugin-yasnippet.el ends here



