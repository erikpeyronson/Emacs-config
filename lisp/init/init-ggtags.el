;;; init-ggtags -- Configure ggtags

;;; Commentary:
;; install and configure ggtags

;;; Code:
(require 'use-package)
(require 'init-key-bindings)
(use-package ggtags
  :config
  (define-key toggle-mode-map (kbd "g") 'ggtags-mode)
  (add-hook 'prog-mode-hook 'ggtags-mode)
  :ensure t)

(provide 'init-ggtags)
;;; init-ggtags.el ends here
