;;; init-behavior -- Configure general emacs behavior

;;; Commentary:
;; Place backup-files and other temporary files .emacs.d/tmp

;;; Code:
(require 'init-key-bindings)
;; Keep backups and auto-saves out of source directory
(defvar tramp-backup-directory-alist)
(defvar tramp-auto-save-directory)
(let ((backup-dir "~/.emacs.d/backups")
      (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
	auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
	auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
	tramp-backup-directory-alist `((".*" . ,backup-dir))
	tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

(setq-default indent-tabs-mode nil)

(use-package zenburn-theme
  :ensure t)

(use-package nlinum
  :config
  (global-nlinum-mode)
  :ensure t)

(setq-default frame-title-format '("emacs: %f"))
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq compilation-scroll-output t)

(use-package neotree
  :config
  (define-key toggle-mode-map (kbd "C-n") 'neotree-toggle))

(transient-mark-mode 0)

(set-face-attribute 'default nil :height 115);
(set-face-attribute 'default t :font "DejaVu Sans Mono" )
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen t)

(global-hl-line-mode)

(provide 'init-behavior)
;;; init-behavior.el ends here
