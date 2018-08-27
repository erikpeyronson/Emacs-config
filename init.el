;; init.el --- Emacs init-file

;; Code:
(package-initialize)
(require 'org)
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))
