;;; plugin-magit -- Configuration for magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(provide 'plugin-magit)
;;; plugin-magit.el ends here
