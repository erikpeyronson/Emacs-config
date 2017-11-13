;;; cfg-custom-variables -- List of variables for local configuration

;;; Commentary:
;;

;;; Code:

(defvar cfg-native-only nil)
(defvar cfg-cpp-enable t)
(defvar cfg-cpp-company-hook t)
(defvar cfg-cpp-flycheck-hook t)
(defvar cfg-cpp-ggtags-hook t)

(defvar cfg-python-enable t)
(defvar cfg-python-company-hook nil)
(defvar cfg-python-flycheck-hook nil)

(defvar cfg-python-ggtags-hook t)
(defvar cfg-erlang-enable t)
(defvar cfg-erlang-company-hook t)
(defvar cfg-erlang-flycheck-hook t)
(defvar cfg-erlang-ggtags-hook t)

(defvar cfg-emacs-lisp-enable t)
(defvar cfg-emacs-lisp-company-hook t)
(defvar cfg-emacs-lisp-flycheck-hook t)
(defvar cfg-emacs-lisp-ggtags-hook t)

(defvar cfg-go-enable t)
(defvar cfg-go-company-hook t)
(defvar cfg-go-flycheck-hook t)
(defvar cfg-go-ggtags-hook t)

(defvar cfg-markdown-enable t)
(defvar cfg-yaml-enable t)
(defvar cfg-protobuf-enable t)

(defvar cfg-tmp-directory (concat user-emacs-directory "tmp/"))
(provide 'cfg-custom-variables)
;;; cfg-custom-variables.el ends here
