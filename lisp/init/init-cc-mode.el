;;; init-cc-mode --- Configure cc-mode

;;; Commentary:
;; Use the google-c-style for indentation, Make h and tcc
;; files use c++-mode Set up a key-map to echange comment-region with
;; a better comment function defined in utils.el

(require 'use-package)
(require 'utils)

(use-package google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  :ensure t)

;;; Code:
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

;; Overwrite C-c C-c with better comment function
(defvar c++-extra-keys-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
    map)
  "Eval-replace-mode keymap." )

;; Minor mode to overwrite eval with eval-and replace
(define-minor-mode c++-extra-keys
  :init-value nil
  :lighter nil)

(add-hook 'c++-mode-hook 'c++-extra-keys)

(provide 'init-cc-mode)
;;; init-cc-mode.el ends here
