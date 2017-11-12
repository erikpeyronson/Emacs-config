;;; plugin-ido-mode.el --- Configure ido-mode

;;; Commentary:
;; Installs smex, flx and ido vertical and makes sure ido-mode is used
;; practically everywhere
;;
;; More info
;; - https://github.com/creichert/ido-vertical-mode.el
;; - https://github.com/nonsequitur/smex
;; - https://github.com/lewang/flx

;;; Code:
(require 'gen-package)
(require 'gen-key-bindings)

;; Enable ido
(ido-mode 1)
(ido-everywhere)
(setq ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))

;; Use C-c m i to toggle ido-mode
(define-key toggle-mode-map (kbd "i") 'ido-mode)

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("C-c C-c M-x" . execute-extended-command))
  :config
  (smex-initialize)
  ;; (global-set-key (kbd "M-x") 'smex)
  ;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  (setq smex-save-file (concat cfg-tmp-directory ".smex-items")))

(use-package flx
  :ensure t)
(use-package flx-ido
  :ensure t
  :config
  (setq ido-enable-flex-matching 1))

(provide 'plugin-ido-mode)
;;; plugin-ido-mode.el ends here
