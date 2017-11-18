;;; plugin-magit -- Configuration for magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(provide 'plugin-magit)
;;; plugin-magit.el ends here
