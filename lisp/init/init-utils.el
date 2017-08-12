;;; init-utils.el --- handy functions

;;; Commentary:
;; defines a couple of good utility functions

;;; Code:
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

(defun toggle-window-layout ()
  "Toggle between the selected window layout and single window."
  ;; (defvar window-layout-state)
  (interactive)
  (if (get 'toggle-window-layout 'state)
      (progn
	(jump-to-register 'W)
	(put 'toggle-window-layout 'state nil))
    (progn
      (window-configuration-to-register 'W)
      (delete-other-windows)
      (put 'toggle-window-layout 'state t))))

(require 'use-package)
(use-package google-translate
  :ensure t)

(provide 'init-utils)
;;; init-utils.el ends here
