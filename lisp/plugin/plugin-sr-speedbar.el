;;; plugin-sr-speedbar -- Setup sr-speedbar plugin

;;; Commentary:
;; Puts speedbar in current frame
;;
;; More info: https://github.com/emacsorphanage/sr-speedbar

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings) ;; defines toggle-mode-map with C-c m prefix

(use-package sr-speedbar
  :config
  (define-key toggle-mode-map (kbd "s") 'sr-speedbar-toggle)
  (setq sr-speedbar-width 20)
  (setq sr-speedbar-right-side nil)
  :ensure t)

(provide 'plugin-sr-speedbar)
;;; plugin-sr-speedbar.el ends here
