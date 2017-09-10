;;; init-key-bindings -- Configure key-binding behavior

;;; Commentary:
;; Adds some keybindings for inserting special characters using C-M-n,
;; with swedish keyboard.
;;
;; Rebinds C-h M-C-h to allow for bash C-h
;; behaviour.
;;
;; Introduces a prefix key C-c m to toggle minor modes and
;; sets up key bindings for some built in modes.
;;
;;

;;; Code:
;; Swap C-j and RET behavior
(global-set-key (kbd "C-j") 'newline)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Use ibuffer instead of bs show for C-x C-b
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; compile bound to C-c m
(global-set-key (kbd "C-c RET") 'compile)

(global-set-key (kbd "C-x 7") 'toggle-window-layout)

;; Insert some shift level 3 characters using C-M
(global-set-key (kbd "C-M-7") (lambda () (interactive) (insert "{")))
(global-set-key (kbd "C-M-8") (lambda () (interactive) (insert "[")))
(global-set-key (kbd "C-M-9") (lambda () (interactive) (insert "]")))
(global-set-key (kbd "C-M-0") (lambda () (interactive) (insert "}")))
(global-set-key (kbd "C-M-+") (lambda () (interactive) (insert "\\")))

;; remap help and backward-kill allow for bash C-h M-C-h behaviour
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-C-h") 'backward-kill-word)
(global-set-key (kbd "C-?") 'help-command)

;; Toggle minor modes with prefix C-c m
(global-set-key (kbd "C-c m") 'toggle-mode-map)
(define-prefix-command 'toggle-mode-map)

(global-set-key (kbd "C-c s") 'speedbar)

(define-key toggle-mode-map (kbd "w m") 'whitespace-mode)
(define-key toggle-mode-map (kbd "w c") 'whitespace-cleanup)
(define-key toggle-mode-map (kbd "C-t C-t") 'transient-mark-mode)
(define-key toggle-mode-map (kbd "C-t C-l") 'toggle-truncate-lines)
(define-key toggle-mode-map (kbd "C-m C-b") 'menu-bar-mode)



(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)
(provide 'init-key-bindings)
;;; init-key-bindings.el ends here
