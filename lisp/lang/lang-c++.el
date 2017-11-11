;;; lang-c++ --- Configuration for C++

;;; Commentary:
;; Use the google-c-style for indentation, Make h and tcc files use
;; c++-mode Set up a key-map to override some built in key-bindings
;; while in c++-mode


(require 'gen-package)
(require 'gen-utils)

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

(define-minor-mode c++-extra-keys
  :init-value nil
  :lighter nil)

(add-hook
 'c++-mode-hook
 (lambda ()
   (if (setq makefile-path (get-above-makefile))
       (set (make-local-variable 'compile-command) (format "make -j12 -f %s " makefile-path))
     (set (make-local-variable 'compile-command)
          (format "g++ -std=c++14 -o %s %s " (file-name-base buffer-file-name) (buffer-name))))))


(provide 'lang-c++)
;;; lang-c++.el ends here
