;;; plugin-eval-replace -- Setup eval-replace-mode

;;; Commentary:
;; Small standalone plugin for inserting the output of inline lisp
;; expression

;;; Code:
(require 'eval-replace)
(require 'gen-key-bindings)

(define-key toggle-mode-map (kbd "r") 'eval-replace-mode)

(provide 'plugin-eval-replace)
;;; plugin-eval-replace.el ends here
