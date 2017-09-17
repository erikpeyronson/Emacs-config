;;; plugin-neotree -- Setup neotree

;;; Commentary:
;; Side bar file browser:
;; https://github.com/jaypei/emacs-neotree

;;; Code:
(require 'use-package)
(require 'gen-key-bindings)
(use-package neotree
  :config
  (define-key toggle-mode-map (kbd "n") 'neotree-toggle)
  (when cfg-neotree-hook (add-hook 'after-init-hook #'neotree-toggle))
  :ensure t)

(provide 'plugin-neotree)
;;; plugin-neotree.el ends here
