;;; eval-replace.el --- replace elisp expression with output

;; Autor: Erik Peyronson

;;; Commentary:
;; overwrites C-x C-e keybinding to insert evaluated expressions
;; output.
;;
;;
;; Basic Usage:
;; C-x C-e - replace-last-sexp

;;; code:
(require 'init-key-bindings)
(defun replace-last-sexp ()
  "Replace the last evalueted lisp-expression with the returned value."
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert ( format "%S" value))))

(defvar eval-replace-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-x C-e") 'replace-last-sexp)
    map)
  "Eval-replace-mode keymap." )

;; Minor mode to overwrite eval with eval-and replace
(define-minor-mode eval-replace-mode
  :init-value nil
  :lighter " eval-replace-mode")

(provide 'eval-replace)
;;; eval-replace.el ends here
