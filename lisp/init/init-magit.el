;;; init-magit -- Configures magit

;;; Commentary:
;; Installs and sets up magit git version control integration

;;; Code:




(defun desktop+-load-git-branch(&optional args)
  ;;(interactive)
  (setq current-branch (shell-command-to-string "python ~/bin/git-info"))
  (if (not (file-exists-p (concat "~/.emacs.d/desktops/" current-branch)))
      (desktop+-create current-branch)
    (desktop+-load current-branch)))


(advice-add 'magit-checkout :after 'desktop+-load-git-branch)


(use-package magit
  :config
  (define-key toggle-mode-map (kbd "m g") 'magit-status)
  (add-hook 'after-init-hook 'desktop+-load-git-branch)
  :ensure t
  )


(provide 'init-magit)
;;; init-magit.el ends here
