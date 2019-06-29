;; init.el --- Emacs init-file

;; Code:
;; start by removing gui elements to make startup look nicer
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(package-initialize)
(require 'org)

(defvar my-config-file (expand-file-name "config.org"
					 user-emacs-directory)
  "path to org file expanded using babel and evaluated at startup")


(org-babel-load-file my-config-file)


(require 'find-file)

(let ((local-config (expand-file-name "init-local.el"
				      user-emacs-directory)))
  (when (file-exists-p local-config)
	(load-file local-config)))

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
