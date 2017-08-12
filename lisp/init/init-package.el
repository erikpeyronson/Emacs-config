;;; init-package.el --- Configure package management

;;; Commentary:
;; Adds the melpa repository and install use-package from melpa and
;; initializes package

;;; Code:
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-package)
;;; init-package.el ends here
