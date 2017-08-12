;;; init-ido-mode.el --- Installs and sets up ido-mode

;;; Commentary:
;; Installs ido-mode, smex and flx and makes sure ido-mode is used
;; whenever possible
;;
;; Basic usage:
;; C-c m i - toggle ido mode
;; C-c C-c - use native M-x
;;
;; More info
;; - https://github.com/creichert/ido-vertical-mode.el
;; - https://github.com/nonsequitur/smex
;; - https://github.com/lewang/flx

;;; Code:
(require 'use-package)
(require 'init-key-bindings)

;; Enable ido
(ido-mode 1)
(ido-everywhere)
(setq ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))

;; Use C-c m i to toggle ido-mode
(define-key toggle-mode-map (kbd "i") 'ido-mode)

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1)
  :ensure t)

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1)
  :ensure t)

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  :ensure t)

(use-package flx
  :ensure t)
(use-package flx-ido
  :config
  (setq ido-enable-flex-matching 1)
  :ensure t)

(provide 'init-ido-mode)
;;; init-ido-mode.el ends here
