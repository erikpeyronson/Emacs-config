;;; plugin-highlight-indent-guides.el --- Configure highlight-indent-guides

;;; Commentary:
;; Installs and configures highlight-indent-guides

;;; Code:
(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(provide 'plugin-highlight-indent-guides)
;;; plugin-highlight-indent-guides.el ends here
