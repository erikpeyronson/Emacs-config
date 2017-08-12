;;; init-global-keys -- init global keybindings

;;; Commentary:
;; Installs and configures sr-speedbar
;;
;; Basic usage:
;; C-c m s - toggle sr-speedbar
;;
;; More info: https://github.com/emacsorphanage/sr-speedbar

;;; Code:
(require 'use-package)
(require 'init-key-bindings) ;; defines toggle-mode-map with C-c m prefix

(use-package sr-speedbar
  :config
  (define-key toggle-mode-map (kbd "s") 'sr-speedbar-toggle)
  (setq sr-speedbar-width 20)
  (setq sr-speedbar-right-side nil)
  :ensure t
  )

(provide 'init-sr-speedbar)
;;; init-sr-speedbar.el ends here
