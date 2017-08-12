;;; init-mark-extras.el --- Making mark great configuration

;; Author: Erik Peyronson

;;; Commentary:
;; Sets up some mark packages and options

;;; Code:

(require 'use-package)

(transient-mark-mode 0)              ; dont highlight region
(setq set-mark-command-repeat-pop t) ; use C-spc to pop consecutive marks after C-u C-spc
(use-package visible-mark
  :config
  (setq visible-mark-max 1)
  (define-key toggle-mode-map (kbd "v") 'visible-mark-mode)
  :ensure t)
(visible-mark-mode 1)

(provide 'init-mark-extras)
;;; init-mark-extras.el ends here

