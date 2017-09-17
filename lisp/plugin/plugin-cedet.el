;; init-ceded -- Configure cedet

;;; Commentary:
;; Configure cedet and semantic

;;; Code:

(require 'semantic)
(require 'semantic/ia)
(require 'semantic/sb)
(require 'ede)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(setq semantic-idle-scheduler-idle-time 20)
(setq semantic-idle-work-parse-neighboring-files-flag t)

(semanticdb-enable-gnu-global-databases 'c++-mode)
(semantic-mode 1)

(advice-add 'speedbar :after 'semantic-speedbar-analysis)

(global-ede-mode 1)
(provide 'plugin-cedet)
;;; init-cedet.el ends here
