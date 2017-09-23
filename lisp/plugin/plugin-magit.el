;;; plugin-magit -- Setup magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:

(require 'plugin-desktop+)

;; (advice-add 'magit-checkout :after 'desktop+-load-git-branch)

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  :defer 5
  :ensure t)

(provide 'plugin-magit)
;;; plugin-magit.el ends here
