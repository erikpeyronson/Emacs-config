;;; plugin-eval-replace -- Configuration for eval-replace-mode

;;; Commentary:
;; Small standalone plugin for inserting the output of inline lisp
;; expressions

;;; Code:
(require 'eval-replace)
(require 'gen-key-bindings)

(define-key toggle-mode-map (kbd "r") 'eval-replace-mode)

(provide 'plugin-eval-replace)
;;; plugin-eval-replace.el ends here
