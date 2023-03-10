;;; init-stock.el
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/elpa/stock-tracker")
(add-to-list 'load-path "~/.emacs.d/elpa/dash")
(require 'stock-tracker-autoloads)
(add-hook 'atfer-init-hook 'stock-tracker-mode)
 (setq stock-tracker-list-of-stocks '("0000001" "1399001" "1399006" "0600999" "1300365" "1000776" "0600036")  )

 (provide 'init-stock)
;;; ends of init-stock.el
