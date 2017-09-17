;;; plugin-desktop+ -- setup and configure desktop+

;;; Commentary:
;; more info: https://github.com/ffevotte/desktop-plus

;;; Code:

(require 'use-package)


(use-package desktop+
  :config
  (defvar desktop+-map (make-sparse-keymap))
  (define-key desktop+-map (kbd "C-c d l") 'desktop+-load)
  (define-key desktop+-map (kbd "C-c d c") 'desktop+-create)


  :ensure t)

(defun desktop+-load-git-branch(&optional args)
  (interactive)
  (setq current-branch (shell-command-to-string "python ~/bin/git-info"))
  (if (not (file-exists-p (concat "~/.emacs.d/desktops/" current-branch)))
      (progn
        (desktop+-load "template")
        (desktop+-create current-branch))
    (desktop+-load current-branch)))

(provide 'plugin-desktop+)

;;; plugin-desktop+.el ends here
