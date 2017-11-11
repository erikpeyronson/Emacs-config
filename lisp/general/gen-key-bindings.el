;;; gen-key-bindings -- Setup basic key-bindings

;;; Commentary:
;; Adds some keybindings for inserting special characters using C-M-n,
;; (good for international keyboard layouts)
;;
;; Rebinds C-h M-C-h to allow for bash C-h
;; behaviour.
;;
;; Introduces a prefix key C-c m to toggle minor modes and
;; sets up key bindings for some built in modes.
;;
;; Adds keybinds for running make with different targets using the
;; closest makefile relative to working directory.
;;
;; Disables some annoying keybindings.

;;; Code:
(require 'gen-utils)

;; Swap C-j and RET behavior
(global-set-key (kbd "C-j") 'newline)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Use ibuffer instead of bs show for C-x C-b
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; compile bound to C-c m
(global-set-key (kbd "C-c RET") 'recompile)
(global-set-key (kbd "C-c M-m") 'compile)

;; Insert some shift level 3 characters using C-M
(global-set-key (kbd "C-M-7") (lambda () (interactive) (insert "{")))
(global-set-key (kbd "C-M-8") (lambda () (interactive) (insert "[")))
(global-set-key (kbd "C-M-9") (lambda () (interactive) (insert "]")))
(global-set-key (kbd "C-M-0") (lambda () (interactive) (insert "}")))
(global-set-key (kbd "C-M-+") (lambda () (interactive) (insert "\\")))

;; remap help and backward-kill allow for bash C-h behaviour
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)

;; Create keymap used to toggle minor-modes.
(global-set-key (kbd "C-c m") 'toggle-mode-map)
(define-prefix-command 'toggle-mode-map)

;; Keybindings for built in minor modes using said keymap.
(define-key toggle-mode-map (kbd "w m") 'whitespace-mode)
(define-key toggle-mode-map (kbd "w c") 'whitespace-cleanup)
(define-key toggle-mode-map (kbd "C-t C-t") 'transient-mark-mode)
(define-key toggle-mode-map (kbd "C-t C-l") 'toggle-truncate-lines)
(define-key toggle-mode-map (kbd "C-m C-b") 'menu-bar-mode)

;; Some different Make commands using the closest availiable makefile
(global-set-key [f5] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s" (get-above-makefile)))))
(global-set-key [f6] (lambda () (interactive) (compile (format
							"make -j8 -f %s test" (get-above-makefile)))))
(global-set-key [f7] (lambda () (interactive) (compile (format
                                                        "make -f %s clean" (get-above-makefile)))))
(global-set-key [f8] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s bit-run" (get-above-makefile)))))
(global-set-key [f9] (lambda () (interactive) (compile (format
                                                        "make -j8 -f %s bit-memcheck" (get-above-makefile)))))

;; Indent whole buffer
(global-set-key (kbd "C-c H") 'indent-buffer)

;; Set window width to 80-columns.
(global-set-key "\C-x~" 'set-80-columns)

(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)

(provide 'gen-key-bindings)
;;; gen-key-bindings.el ends here
