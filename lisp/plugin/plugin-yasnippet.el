;;; plugin-yasnippet.el --- Configuration for yasnippet

;; Author: Erik Peyronson

;;; Commentary:
;; Install and configures yasnippet
;;
;; More info: https://github.com/joaotavora/yasnippet

;;; Code:
(require 'gen-package)

(defun my-yas-setup()
     (yas-reload-all)
     (yas-minor-mode))

(use-package yasnippet
  :ensure t
  :config
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
  (when cfg-go-enable
    ;; Go snippets
    (use-package go-snippets
      :ensure t))
  (yas-global-mode))

  (provide 'plugin-yasnippet)
;;; plugin-yasnippet.el ends here



