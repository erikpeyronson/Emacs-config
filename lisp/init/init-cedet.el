;;; intit-cedet -- Configure cedet

;;; Commentary:
;; 

;;; Code:

(require 'cc-mode)
(require 'semantic)
(require 'semantic/ia)
(require 'ede)

(global-ede-mode 1)

(global-semanticdb-minor-mode 1)

(semantic-mode 1)

(provide 'init-cedet)
;;; intit-cedet.el ends here
