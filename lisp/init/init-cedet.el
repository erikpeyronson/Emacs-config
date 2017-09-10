;; intit-cedet -- Configure cedet

;;; Commentary:
;; 

;;; Code:

(require 'cc-mode)
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/sb)
(require 'ede)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
;; (global-semantic-idle-summary-mode 1)
;; (global-semantic-highlight-func-mode 1)
(setq semantic-idle-scheduler-idle-time 20)
(setq semantic-idle-work-parse-neighboring-files-flag t)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semantic-mode 1)

(advice-add 'speedbar :after 'semantic-speedbar-analysis)

;; (semantic-add-system-include "/proj/rbsNodeIfStorage/nodeif/SYS_SERVICE_CXA2010108_1/R1A192/include")
;; (semantic-add-system-include "/proj/lte_twh/tools/googletest/1.7.0-30/include")
;; (semantic-add-system-include "/usr/include/c++/4.4.7")
;; (semantic-add-system-include "")



(setq cedet-root-path
      (file-name-as-directory (expand-file-name
                               "/repo/eeripey/ebb")))

(ede-cpp-root-project "ebb"
                      :file "/repo/eeripey/ebb/dummy"
                      :include-path '("/rpc/"                                      
                                      ".")
                      ;; "../inc")
                      :system-include-path '("/.baseline/g2/data/SYS_SERVICE_CXA2010108_1/include"
                                             "~/.gtags"))
;; "/usr/include"
;; "/proj/rbsNodeIfStorage/nodeif/SYS_SERVICE_CXA2010108_1/R1A192/include"
;; "/proj/lte_twh/tools/googletest/1.7.0-30/include"





(global-ede-mode 1)
(provide 'init-cedet)
;;; intit-cedet.el ends here
