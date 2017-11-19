;;; plugin-ggtags -- Configure ggtags

;;; Commentary:
;; Install and configure ggtags sets up hooks
;; according to flags set in init.el

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

(use-package ggtags
  :ensure t
  :config
  (define-key toggle-mode-map (kbd "g") 'ggtags-mode)
  ;; c++ configuration
  (when cfg-cpp-enable
    (when cfg-cpp-ggtags-hook
      (add-hook 'c++-mode-hook
                (lambda () (ggtags-mode 1)))))

  ;; python configuration
  (when cfg-python-enable
    (when cfg-python-ggtags-hook
      (add-hook 'python-mode-hook 'ggtags-mode)))

  ;; erlang configuration
  (when cfg-erlang-enable
    (when cfg-erlang-ggtags-hook
      (add-hook 'erlang-mode-hook 'ggtags-mode)))

  ;; Emacs lisp configuration
  (when cfg-emacs-lisp-enable
    (when cfg-emacs-lisp-ggtags-hook
      (add-hook 'emacs-lisp-mode-hook 'ggtags-mode)))

  ;; Go configuration
  (when cfg-go-enable
    (when cfg-go-ggtags-hook
      (add-hook 'go-mode-hook 'ggtags-mode))))

(provide 'plugin-ggtags)
;;; plugin-ggtags.el ends here
