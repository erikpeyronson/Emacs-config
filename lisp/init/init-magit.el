;;; init-magit -- Configures magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:



(require 'init-desktop+)

;; (advice-add 'magit-checkout :after 'desktop+-load-git-branch)


(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  :ensure t
  )


(provide 'init-magit)
;;; init-magit.el ends here
