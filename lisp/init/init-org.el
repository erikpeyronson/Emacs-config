;;; init-org -- Configure general emacs org

;;; Commentary:
;; Place backup-files and other temporary files .emacs.d/tmp

;;; Code:
;; Move emacs and 
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "VERIFY" "|" "DONE")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("STARTED" . "yellow")
             ("VERIFY" . (:foreground "cyan" :weight bold))))
(provide 'init-org)
;;; init-org.el ends here
