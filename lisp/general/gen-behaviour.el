;;; gen-behaviour -- Configure general emacs behaviour

;;; Commentary:
;; Places backup-files and other temporary files in .emacs.d/tmp, use
;; tabs for indentation, autoscroll compilation output and allow for
;; consecutive mark pops with space after first C-u spc

;;; Code:

(setq-default indent-tabs-mode nil)
(setq set-mark-command-repeat-pop t)

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

(provide 'gen-behaviour)
;;; gen-behaviour.el ends here
