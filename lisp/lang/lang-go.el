;;; lang-go -- Go configuration

;;; Commentary:
;; Install and configure Go major mode

;;; Code:

(require 'use-package)

(defun my-generate-go-compile-command()
  "Set the 'compile-command' variable for c++ mode if the buffer is visiting a file."
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")))

(defun my-go-mode-setup ()
  "Setup hooked to go mode."
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)
  (define-key go-mode-map (kbd "C-c RET") 'recompile)
  (define-key go-mode-map (kbd "C-c M-m") 'compile)
  (my-generate-go-compile-command))

(use-package go-mode
  :config
  (use-package go-eldoc
    :ensure t)
  (add-hook 'go-mode-hook 'my-go-mode-setup)
  :ensure t)

(provide 'lang-go)
;;; lang-go.el ends here
