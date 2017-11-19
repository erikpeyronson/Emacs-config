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
  :bind (:map yas-minor-mode-map
              ("TAB" . nil)
              ("<tab>" . nil)
              ("<backtab>" . yas-expand))
  :config
  (when cfg-go-enable
    ;; Go snippets
    (use-package go-snippets
      :ensure t))
  (print "adding hook")
  (add-hook 'prog-mode-hook 'my-yas-setup))

  (provide 'plugin-yasnippet)
;;; plugin-yasnippet.el ends here



