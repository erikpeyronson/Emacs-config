;;; plugin-neotree -- Configure neotree

;;; Commentary:
;; Side bar file browser:
;; https://github.com/jaypei/emacs-neotree

;;; Code:
(require 'use-package)
(require 'gen-key-bindings)
(use-package neotree
  :ensure t
  :config
  (define-key toggle-mode-map (kbd "n") 'neotree-mode))



  (provide 'plugin-neotree)
;;; plugin-neotree.el ends here
