;;; lang-markdown -- Configure markdown

;;; Commentary:
;; Install and configure markdown mode and flymd

;;; Code:
(require 'gen-package)

(use-package markdown-mode
  :config
  (use-package flymd
    :ensure t)
  :ensure t)

(provide 'lang-markdown)
;;; lang-markdown.el ends here
