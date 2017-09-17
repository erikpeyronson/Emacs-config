;;; plugin-ggtags -- Setup ggtags

;;; Commentary:
;; install and configure ggtags

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package ggtags
  :config
  (define-key toggle-mode-map (kbd "g") 'ggtags-mode)

  ;; Hooks
  (when cfg-ggtags-hooks
    (when cfg-enable-c++ (add-hook 'c++-mode-hook 'ggtags-mode)))
  :ensure t)

(provide 'plugin-ggtags)
;;; plugin-ggtags.el ends here
