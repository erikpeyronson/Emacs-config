;; init.el --- Emacs init-file

;; Author: Erik Peyronson

;;; Commentary:
;; Emacs configuration used for c++, arduio, elisp, python and erlang
;; development.
;;
;; Tested with Emacs 25.1.1
;;
;; Features:
;; - Automagically installs and configures useful plugins and modes
;;   using the use-package macro (https://github.com/jwiegley/use-package)
;; - Sets up google-c-style indentation and formatting.
;; - Moves auto-save files to ~/.emacs.d/tmp to avoid cluttering source
;;   folders
;; - Provides utility functions

;;; Code:
(setq gc-cons-threshold 100000000)

(package-initialize)
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Set to t to enable language configuration
(defvar cfg-enable-c++ t)
(defvar cfg-enable-python t)
(defvar cfg-enable-erlang t)
(defvar cfg-enable-emacs-lisp t)

;;; Mode set to t to enable autostostart of plugins
;; Mode Hooks
(defvar cfg-company-hooks nil)
(defvar cfg-flycheck-hooks nil)
(defvar cfg-ggtags-hooks t)

;; After init hooks
(defvar cfg-neotree-hook nil)

;; General configuration, provides dependencies to alot of the
;; plugin-initializers so dont remove
(require 'gen-package)
(require 'gen-utils)
(require 'gen-appearance)
(require 'gen-behaviour)
(require 'gen-key-bindings)
(require 'gen-org)

;; Programming language initialization
(when cfg-enable-c++ (require 'lang-c++))
(when cfg-enable-python (require 'lang-python))
(when cfg-enable-erlang (require 'lang-erlang))
(when cfg-enable-emacs-lisp (require 'lang-emacs-lisp))

;; Minor mode configurations
;; Melpa or built in
(require 'plugin-desktop+)
(require 'plugin-magit)
(require 'plugin-yasnippet)
(require 'plugin-ido-mode)
(require 'plugin-company)
(require 'plugin-flycheck)
(require 'plugin-projectile)
(require 'plugin-ggtags)
(require 'plugin-god-mode)
(require 'plugin-cedet)
(require 'plugin-neotree)
(require 'plugin-sr-speedbar)
(require 'plugin-cmake-ide)

;; machine independent configuration
(load "~/.emacs.d/init-local.el")

;; Standalone
(require 'plugin-eval-replace)

;; Custom variables in separate files
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
