;;; init-extra-modes.el --- Installs extra modes

;;; Commentary:
;; Install packages and modes that require little or no configuration
;; and wont disturb the rest of the config

;;; Code:
(require 'use-package)
(use-package cmake-mode
  :ensure t)
(use-package arduino-mode
  :ensure t)
(use-package yaml-mode
  :ensure t)
(provide 'init-extra-modes)
;;; init-extra-modes.el ends here
