;;; spacemacs-functions.el --- Library of selected functions taken from spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; our own implementation of kill-this-buffer from menu-bar.el
(defun spacemacs/kill-this-buffer (&optional arg)
  "Kill the current buffer.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (if (window-minibuffer-p)
      (abort-recursive-edit)
    (if (equal '(4) arg)
        (kill-buffer-and-window)
      (kill-buffer))))

(defun spacemacs/ace-kill-this-buffer (&optional arg)
  "Ace kill visible buffer in a window.
If the universal prefix argument is used then kill also the window."
  (interactive "P")
  (require 'ace-window)
  (let (golden-ratio-mode)
    (aw-select
     " Ace - Kill buffer in Window"
     (lambda (window)
       (with-selected-window window
         (spacemacs/kill-this-buffer arg))))))

;; found at http://emacswiki.org/emacs/KillingBuffers
(defun spacemacs/kill-other-buffers (&optional arg)
  "Kill all other buffers.
If the universal prefix argument is used then will the windows too."
  (interactive "P")
  (when (yes-or-no-p (format "Killing all buffers except \"%s\"? "
                             (buffer-name)))
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    (when (equal '(4) arg) (delete-other-windows))
    (message "Buffers deleted!")))


;; http://camdez.com/blog/2013/11/14/emacs-show-buffer-file-name/
(defun spacemacs/show-and-copy-buffer-filename ()
  "Show and copy the full path to the current file in the minibuffer."
  (interactive)
  ;; list-buffers-directory is the variable set in dired buffers
  (let ((file-name (or (buffer-file-name) list-buffers-directory)))
    (if file-name
        (message (kill-new file-name))
      (error "Buffer not visiting a file"))))

(defun spacemacs/new-empty-buffer ()
  "Create a new buffer called untitled(<n>)"
  (interactive)
  (let ((newbuf (generate-new-buffer-name "untitled")))
    (switch-to-buffer newbuf)))

(defun spacemacs/safe-revert-buffer ()
  "Prompt before reverting the file."
  (interactive)
  (revert-buffer nil nil))

(defun spacemacs/safe-erase-buffer ()
  "Prompt before erasing the content of the file."
  (interactive)
  (if (y-or-n-p (format "Erase content of buffer %s ? " (current-buffer)))
      (erase-buffer)))


;; http://stackoverflow.com/a/10216338/4869
(defun spacemacs/copy-whole-buffer-to-clipboard ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun spacemacs/copy-clipboard-to-whole-buffer ()
  "Copy clipboard and replace buffer"
  (interactive)
  (delete-region (point-min) (point-max))
  (clipboard-yank)
  (deactivate-mark))

(defun spacemacs/switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer. Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*scratch*")))
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (when (and (not exists)
               (not (eq major-mode dotspacemacs-scratch-mode))
               (fboundp dotspacemacs-scratch-mode))
      (funcall dotspacemacs-scratch-mode))))

(defun spacemacs/move-buffer-to-window (windownum follow-focus-p)
  "Moves a buffer to a window, using the spacemacs numbering. follow-focus-p
   controls whether focus moves to new window (with buffer), or stays on
   current"
  (interactive)
  (let ((b (current-buffer))
        (w1 (selected-window))
        (w2 (winum-get-window-by-number windownum)))
    (unless (eq w1 w2)
      (set-window-buffer w2 b)
      (switch-to-prev-buffer)
      (unrecord-window-buffer w1 b)))
  (when follow-focus-p (select-window (winum-get-window-by-number windownum))))

(defun spacemacs/swap-buffers-to-window (windownum follow-focus-p)
  "Swaps visible buffers between active window and selected window.
   follow-focus-p controls whether focus moves to new window (with buffer), or
   stays on current"
  (interactive)
  (let* ((b1 (current-buffer))
         (w1 (selected-window))
         (w2 (winum-get-window-by-number windownum))
         (b2 (window-buffer w2)))
    (unless (eq w1 w2)
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (unrecord-window-buffer w1 b1)
      (unrecord-window-buffer w2 b2)))
  (when follow-focus-p (select-window-by-number windownum)))

(dotimes (i 9)
  (let ((n (+ i 1)))
    (eval `(defun ,(intern (format "buffer-to-window-%s" n)) (&optional arg)
             ,(format "Move buffer to the window with number %i." n)
             (interactive "P")
             (if arg
                 (spacemacs/swap-buffers-to-window ,n t)
               (spacemacs/move-buffer-to-window ,n t))))
    (eval `(defun ,(intern (format "move-buffer-window-no-follow-%s" n)) ()
             (interactive)
             (spacemacs/move-buffer-to-window ,n nil)))
    (eval `(defun ,(intern (format "swap-buffer-window-no-follow-%s" n)) ()
             (interactive)
             (spacemacs/swap-buffers-to-window ,n nil)))
    ))

(defun spacemacs/rotate-windows-backward (count)
  "Rotate each window backwards.
Dedicated (locked) windows are left untouched."
  (interactive "p")
  (spacemacs/rotate-windows-forward (* -1 count)))

(defun spacemacs/move-buffer-to-window (windownum follow-focus-p)
  "Moves a buffer to a window, using the spacemacs numbering. follow-focus-p
   controls whether focus moves to new window (with buffer), or stays on
   current"
  (interactive)
  (let ((b (current-buffer))
        (w1 (selected-window))
        (w2 (winum-get-window-by-number windownum)))
    (unless (eq w1 w2)
      (set-window-buffer w2 b)
      (switch-to-prev-buffer)
      (unrecord-window-buffer w1 b)))
  (when follow-focus-p (select-window (winum-get-window-by-number windownum))))

(defun spacemacs/swap-buffers-to-window (windownum follow-focus-p)
  "Swaps visible buffers between active window and selected window.
   follow-focus-p controls whether focus moves to new window (with buffer), or
   stays on current"
  (interactive)
  (let* ((b1 (current-buffer))
         (w1 (selected-window))
         (w2 (winum-get-window-by-number windownum))
         (b2 (window-buffer w2)))
    (unless (eq w1 w2)
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (unrecord-window-buffer w1 b1)
      (unrecord-window-buffer w2 b2)))
  (when follow-focus-p (select-window-by-number windownum)))

(dotimes (i 9)
  (let ((n (+ i 1)))
    (eval `(defun ,(intern (format "buffer-to-window-%s" n)) (&optional arg)
             ,(format "Move buffer to the window with number %i." n)
             (interactive "P")
             (if arg
                 (spacemacs/swap-buffers-to-window ,n t)
               (spacemacs/move-buffer-to-window ,n t))))
    (eval `(defun ,(intern (format "move-buffer-window-no-follow-%s" n)) ()
             (interactive)
             (spacemacs/move-buffer-to-window ,n nil)))
    (eval `(defun ,(intern (format "swap-buffer-window-no-follow-%s" n)) ()
             (interactive)
             (spacemacs/swap-buffers-to-window ,n nil)))
    ))

(defun spacemacs/delete-window (&optional arg)
  "Delete the current window.
If the universal prefix argument is used then kill the buffer too."
  (interactive "P")
  (if (equal '(4) arg)
      (kill-buffer-and-window)
    (delete-window)))

;; from http://dfan.org/blog/2009/02/19/emacs-dedicated-windows/
(defun spacemacs/toggle-current-window-dedication ()
  "Toggle dedication state of a window."
  (interactive)
  (let* ((window    (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

;; from https://gist.github.com/timcharper/493269
(defun spacemacs/split-window-vertically-and-switch ()
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun spacemacs/split-window-horizontally-and-switch ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(defun spacemacs/layout-triple-columns ()
  " Set the layout to triple columns. "
  (interactive)
  (delete-other-windows)
  (dotimes (i 2) (split-window-right))
  (balance-windows))

(defun spacemacs/layout-double-columns ()
  " Set the layout to double columns. "
  (interactive)
  (delete-other-windows)
  (split-window-right))

(defun spacemacs/toggle-frame-fullscreen ()
  "Respect the `dotspacemacs-fullscreen-use-non-native' variable when
toggling fullscreen."
  (interactive)
  (if dotspacemacs-fullscreen-use-non-native
      (spacemacs/toggle-frame-fullscreen-non-native)
    (toggle-frame-fullscreen)))

(defun spacemacs/toggle-fullscreen ()
  "Toggle full screen on X11 and Carbon"
  (interactive)
  (cond
   ((eq window-system 'x)
    (set-frame-parameter nil 'fullscreen
                         (when (not (frame-parameter nil 'fullscreen))
                           'fullboth)))
   ((eq window-system 'mac)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullscreen)))))

(defun spacemacs/toggle-frame-fullscreen-non-native ()
  "Toggle full screen non-natively. Uses the `fullboth' frame paramerter
   rather than `fullscreen'. Useful to fullscreen on OSX w/o animations."
  (interactive)
  (modify-frame-parameters
   nil
   `((maximized
      . ,(unless (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
	   (frame-parameter nil 'fullscreen)))
     (fullscreen
      . ,(if (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
	     (if (eq (frame-parameter nil 'maximized) 'maximized)
		 'maximized)
	   'fullboth)))))

(defun spacemacs/switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

(defun spacemacs/alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (let ((current-buffer (window-buffer window)))
    ;; if no window is found in the windows history, `switch-to-buffer' will
    ;; default to calling `other-buffer'.
    (switch-to-buffer
     (cl-find-if (lambda (buffer)
                   (not (eq buffer current-buffer)))
                 (mapcar #'car (window-prev-buffers window))))))

;; from https://gist.github.com/3402786
(defun spacemacs/toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

(provide 'spacemacs-functions)
