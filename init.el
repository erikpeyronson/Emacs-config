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

;;; Configuration flags use to toggle functionality
(unless (file-exists-p (concat user-emacs-directory "lisp/local/cfg-custom-variables.el"))
	(copy-file (concat user-emacs-directory "resources/cfg-custom-variables.el")
		   (concat user-emacs-directory "lisp/local/cfg-custom-variables.el")))

(require 'cfg-custom-variables)

;;; General configuration, provides dependencies to alot of the
(require 'gen-package)
(require 'gen-utils)
(require 'gen-appearance)
(require 'gen-behaviour)
(require 'gen-key-bindings)
(require 'gen-org)

;; Language initialization
(when cfg-cpp-enable (require 'lang-c++))
(when cfg-python-enable (require 'lang-python))
(when cfg-erlang-enable (require 'lang-erlang))
(when cfg-emacs-lisp-enable (require 'lang-emacs-lisp))
(when cfg-go-enable (require 'lang-go))
(when cfg-markdown-enable(require 'lang-markdown))
(when cfg-yaml-enable(require 'lang-yaml))
(when cfg-protobuf-enable(require 'lang-protobuf))

;; Plugin configurations
(require 'plugin-desktop+)
(require 'plugin-magit)
(require 'plugin-yasnippet)
(require 'plugin-ido-mode)
(require 'plugin-company)
(require 'plugin-flycheck)
(require 'plugin-projectile)
(require 'plugin-ggtags)
(require 'plugin-god-mode)
(require 'plugin-neotree)
(require 'plugin-cmake-ide)

;; Standalone
(require 'plugin-eval-replace)

;; Custom variables in separate files
(setq custom-file "~/.emacs.d/emacs-custom.el")
(unless (file-exists-p custom-file) (write-region "" nil custom-file))
(load custom-file)
;;; init.el ends here
(put 'upcase-region 'disabled nil)
