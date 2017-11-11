;;; plugin-yasnippet.el --- Configuration for yasnippet

;; Author: Erik Peyronson

;;; Commentary:
;; Install and configures yasnippet
;;
;; More info: https://github.com/joaotavora/yasnippet

;;; Code:
(require 'gen-package)

(use-package yasnippet
  :config
  (when cfg-go-enable

    ;; Go snippets
    (use-package go-snippets
      :ensure t))

  (add-hook 'prog-mode-hook 'yas-minor-mode)
  :ensure t)

  (provide 'plugin-yasnippet)
;;; plugin-yasnippet.el ends here



