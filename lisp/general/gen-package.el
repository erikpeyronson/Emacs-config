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

(provide 'gen-package)
;;; gen-package.el ends here
