;;; gen-package.el --- Sets up package management

;;; Commentary:
;; Adds the melpa repository and install use-package from said
;; repository.

;;; Code:
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package atom-one-dark-theme
     :ensure t)
(unless (package-installed-p 'atom-one-dark-theme)
  (package-refresh-contents)
  (package-install 'atom-one-dark-theme))

(provide 'gen-package)
;;; gen-package.el ends here
