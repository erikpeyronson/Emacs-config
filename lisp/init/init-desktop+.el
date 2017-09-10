;;; init-desktop+ -- setup and configure desktop+

;;; Commentary:
;; more info: https://github.com/ffevotte/desktop-plus

;;; Code:

(require 'use-package)


(use-package desktop+
  :config
;;  (global-set-key (kbd "C-c d") 'desktop+-mode-map)
;;  (define-prefix-command 'desktop+-mode-map)
  (global-set-key (kbd "C-c d l") 'desktop+-load)
  (global-set-key (kbd "C-c d c") 'desktop+-create)

  :ensure t)

(defun desktop+-load-git-branch(&optional args)
  (interactive)
  (setq current-branch (shell-command-to-string "python ~/bin/git-info"))
  (if (not (file-exists-p (concat "~/.emacs.d/desktops/" current-branch)))
      (progn
        (desktop+-load "template")
        (desktop+-create current-branch))
    (desktop+-load current-branch)))

(provide 'init-desktop+)

;;; init-desktop+.el ends here
