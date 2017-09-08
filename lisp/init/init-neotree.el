;;; init-neotree -- initialize neotree

;;; Commentary:
;; Side bar file browser:
;; https://github.com/jaypei/emacs-neotree

;;; Code:
(require 'use-package)
(require 'init-key-bindings)
(use-package neotree
  :config
;l  (setq neo-window-width 30)
  (define-key toggle-mode-map (kbd "n") 'neotree-toggle)
  :ensure t)

(provide 'init-neotree)
;;; init-neotree.el ends here
