;;; init-erlang -- Erlang configuration

;;; Commentary:
;; install and configure Erlang major mode

;;; Code:

(require 'use-package)

(use-package erlang
  :config
  (add-hook 'erlang-mode-hook '(lambda() (setq indent-tabs-mode nil)))
  (define-key erlang-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
  :ensure t)

(provide 'init-erlang)
;;; init-erlang.el ends here
