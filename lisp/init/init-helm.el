;;; init-helm -- Configure helm completion

;;; Commentary:
;; Fun stuff

;;; Code:
(require 'use-package)

(use-package helm
  :config
  (helm-mode)
  :ensure t)
(provide 'init-helm)
;;; init-helm.el ends here
