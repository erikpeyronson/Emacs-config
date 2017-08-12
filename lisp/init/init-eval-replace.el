;;; init-eval-replace -- Configures eval-replace-mode

;;; Commentary:
;; Toggle eval-replace-mode using C-c m e

;;; Code:

(provide 'init-eval-replace)
(require 'eval-replace)
(define-key toggle-mode-map (kbd "r") 'eval-replace-mode)
;;; init-eval-replace.el ends here
