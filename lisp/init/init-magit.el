;;; init-magit -- Configures magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:
(require 'use-package)

(use-package magit
  :config
  (define-key toggle-mode-map (kbd "m g") 'magit-status)
  :ensure t
  )

(provide 'init-magit)
;;; init-magit.el ends here
