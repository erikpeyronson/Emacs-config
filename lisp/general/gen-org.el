;;; gen-org -- General org-mode configuration

;;; Commentary:
;; Basic org-mode configuration

;;; Code:
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "VERIFY" "|" "DONE")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning) ("STARTED" . "yellow")
             ("VERIFY" . (:foreground "cyan" :weight bold))))
(provide 'gen-org)
;;; gen-org.el ends here
