;; init.el --- Emacs init-file

;; Author: Erik Peyronson

;;; Commentary:
;; Emacs configuration used for c++, arduio, elisp and erlang
;; development.
;;
;; Tested with Emacs 25.1.1
;;
;; Features:
;; - Automagically installs and configures useful plugins and modes
;;   using the use-package macro(https://github.com/jwiegley/use-package)
;; - Sets up google-c-style indentation and formatting.
;; - Moves auto-save files to ~/.emacs.d/tmp to avoid cluttering source
;;   folders
;; - Provides a couple of utility functions.
;; - Sets up good(?) key-bindings
;; - etc
;;
;; Usage:
;; * Clone the repository (link)
;; * Uncomment the (require 'init-'package') line for the plugins you
;;   wish to use
;;
;;; Code:

(package-initialize)
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Basic stup
;; Provides dependances DO NOT REMOVE THESE
(require 'init-package)
(require 'init-behavior)
(require 'init-key-bindings)
(require 'utils)

;; Extra mark features
(require 'init-mark-extras)

;; Major mode configuraitons
(require 'init-cc-mode)
(require 'init-erlang)
(require 'init-emacs-lisp-mode)

;; Minor mode configurations
;; Melpa or built in
(require 'init-yasnippet)
(require 'init-ido-mode)
(require 'init-company-mode)
;; (require 'init-flycheck)
(require 'init-projectile)
(require 'init-sr-speedbar)
;;(require 'init-purpose)
(require 'init-ggtags)
(require 'init-magit)
;;(require 'init-cedet)
(require 'init-desktop+)
(require 'init-neotree)
(require 'init-god-mode)

;; Standalone
(require 'init-eval-replace)
(require 'init-disabled-keys)
(require 'init-org)

(require 'setup-env)

;; Custom variables in separate files
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)
;;; init.el ends here

;; (put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
