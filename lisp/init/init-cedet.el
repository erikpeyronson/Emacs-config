;;; intit-cedet -- Configure cedet

;;; Commentary:
;; 

;;; Code:

(require 'cc-mode)
(require 'semantic)
(require 'semantic/ia)
(require 'semantic/sb)
(require 'ede)

(global-ede-mode 1)

(global-semanticdb-minor-mode 1)

(semantic-mode 1)

(setq cedet-root-path
      (file-name-as-directory (expand-file-name
                               "/repo/eeripey/ebb")))

;; (ede-cpp-root-project "ebb"
;;                       :file "/repo/eeripey/ebb/ebb-dummy"
;;                       :include-path '("/rpc" "." "../inc" "/")
;;                       :system-include-path '("/usr/include/c++/4.4.7"
;;                                              "/proj/rbsNodeIfStorage/nodeif/SYS_SERVICE_CXA2010108_1/R1A192/include"
;;                                              "/proj/lte_twh/tools/googletest/1.7.0-30/include")
;;                       )
(provide 'init-cedet)
;;; intit-cedet.el ends here
