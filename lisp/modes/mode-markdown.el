;;; mode-markdown -- Setup markdown mode

;;; Commentary:
;; install markdown mode and flymd

;;; Code:
(require 'use-package)

(use-package markdown-mode
  :ensure t
  )

(use-package flymd
  :ensure t
  )
(provide 'mode-markdown)
;;; mode-markdown.el ends here
