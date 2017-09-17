;;; lang-python -- Setup Python configuration

;;; Commentary:
;; 

;;; Code:
(require 'gen-package)

(defun run-python-tests (root-dir test-subdir buffer-name)
  (interactive)
  (let ((default-directory root-dir)
        (buff (get-buffer-create buffer-name)))
    (display-buffer buff)
    (shell-command (concat "python -m unittest discover " test-subdir) buff)
    (with-current-buffer buff
      (compilation-mode))))

;;                                         ; This hook runs the tests after each save, a TDD-esque workflow.
;; (add-hook 'after-save-hook
;; 	  (lambda () (run-python-tests "~/projects/project_name/"
;; 				       "project_name/test"
;; 				       "*python-tests*")))
(defun pyton-unit-test ()
  (interactive)
  (setq module-name (buffer-name))
  (print module-name))

(provide 'lang-python)
;;; lang-python.el ends here
