;;; plugin-idle-highlight-mode.el --- Configure idle-highlight-mode

;;; Commentary:
;; Installs and configures idle-highlight-mode

;;; Code:
(use-package idle-highlight-mode
  :ensure t
  :config
  (setq idle-highlight-idle-time 2.0)
  (add-hook 'prog-mode-hook 'idle-highlight-mode))

(provide 'plugin-idle-highlight-mode)
;;; plugin-idle-highlight-mode.el ends here
