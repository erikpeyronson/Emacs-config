;;; init-irony -- 

;;; Commentary:
;; 

;;; Code:

(require 'use-package)
(use-package irony
  :config
  (use-package company-irony
    :config
    :ensure t)
  (use-package flycheck-irony
    :config
    :ensure t)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'iron-cdb-autosetup-compile-options)
  :ensure t 
  )

(provide 'init-irony)
;;; init-irony.el ends here
