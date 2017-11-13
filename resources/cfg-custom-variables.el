;;; cfg-custom-variables -- List of variables for local configuration

;;; Commentary:
;;

;;; Code:

(defvar cfg-native-only nil)
(defvar cfg-cpp-enable nil)
(defvar cfg-cpp-company-hook nil)
(defvar cfg-cpp-flycheck-hook nil)
(defvar cfg-cpp-ggtags-hook nil)

(defvar cfg-python-enable nil)
(defvar cfg-python-company-hook nil)
(defvar cfg-python-flycheck-hook nil)

(defvar cfg-python-ggtags-hook nil)
(defvar cfg-erlang-enable nil)
(defvar cfg-erlang-company-hook nil)
(defvar cfg-erlang-flycheck-hook nil)
(defvar cfg-erlang-ggtags-hook nil)

(defvar cfg-emacs-lisp-enable nil)
(defvar cfg-emacs-lisp-company-hook nil)
(defvar cfg-emacs-lisp-flycheck-hook nil)
(defvar cfg-emacs-lisp-ggtags-hook nil)

(defvar cfg-go-enable nil)
(defvar cfg-go-company-hook nil)
(defvar cfg-go-flycheck-hook nil)
(defvar cfg-go-ggtags-hook nil)

(defvar cfg-markdown-enable nil)
(defvar cfg-yaml-enable nil)
(defvar cfg-protobuf-enable nil)

(defvar cfg-tmp-directory (concat user-emacs-directory "tmp/"))
(provide 'cfg-custom-variables)
;;; cfg-custom-variables.el ends here
