;;; gen-utils.el --- handy functions

;;; Commentary:
;; defines a couple of good utility functions, some written by me
;; some copied from various locations around the internet

;;; Code:

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

(defun toggle-window-layout ()
  "Toggle between the selected window layout and single window."
  ;; (defvar window-layout-state)
  (interactive)
  (if (get 'toggle-window-layout 'state)
      (progn
        (purpose-load-window-layout-file "~/.emcas.d/layouts/c++.window-layout")
	(put 'toggle-window-layout 'state nil))
    (progn
      (purpose-load-window-layout-file "~/.emcas.d/layouts/c++-big-compile.window-layout")
      (put 'toggle-window-layout 'state t))))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;;; File and buffer management functions
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

(defun set-window-width (n)
  "Set the selected window's width to N columns."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 80))

(defun indent-buffer ()
  "Mark the whole buffer indent and return to the position started."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

 (defun remove-trailing-whitespace ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match "" nil nil)))
  nil)
 (defun add-remove-trailing-whitespace-hook ()
  (add-hook 'local-write-file-hooks 'remove-trailing-whitespace))

 (add-hook 'awk-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'c++-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'c-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'emacs-lisp-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'erlang-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'java-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'makefile-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'python-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'shell-script-mode-hook 'add-remove-trailing-whitespace-hook)
 (add-hook 'text-mode-hook 'add-remove-trailing-whitespace-hook)

(provide 'gen-utils)
;;; gen-utils.el ends here
