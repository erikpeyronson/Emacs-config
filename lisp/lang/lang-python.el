;;; lang-python -- Python configuration

;;; Commentary:
;; Some utility functions for python currently not working

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

(defun pyton-unit-test ()
  (interactive)
  (setq module-name (buffer-name))
  (print module-name))

(provide 'lang-python)
;;; lang-python.el ends here
