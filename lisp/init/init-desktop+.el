;;; init-desktop+ -- setup and configure desktop+

;;; Commentary:
;; more info: https://github.com/ffevotte/desktop-plus

;;; Code:

(provide 'init-desktop+)

(require 'use-package)

(use-package desktop+
  :config
;;  (global-set-key (kbd "C-c d") 'desktop+-mode-map)
;;  (define-prefix-command 'desktop+-mode-map)
  (global-set-key (kbd "C-c d l") 'desktop+-load)
  (global-set-key (kbd "C-c d c") 'desktop+-create)

  :ensure t)
;;; init-desktop+.el ends here
