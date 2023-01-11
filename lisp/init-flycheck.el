;;; init-flycheck.el
;;; Commentary:
;;; Code:
;;;
(add-to-list 'load-path "~/.emacs.d/elpa/flycheck")

(add-to-list 'load-path "~/.emacs.d/elpa/dash")
(require 'flycheck)
(require 'flycheck-color-mode-line)
(add-hook 'after-init-hook 'flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(setq flycheck-global-modes
      '(not text-mode outline-mode fundamental-mode 
	    org-mode diff-mode shell-mode eshell-mode term-mode vterm-mode)
      flycheck-emacs-lisp-load-path 'inherit
      flycheck-indication-mode (if (display-graphic-p)
				   'right-fringe
				 'right-margin)
      flycheck-check-syntax-automatically '(save mode-enabled)
      flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)

(setq my-flycheck-mode-line
      '(:eval
        (pcase flycheck-last-status-change
          (`not-checked nil)
          (`no-checker (propertize " -" 'face 'warning))
          (`running (propertize " *" 'face 'success))
          (`errored (propertize " !" 'face 'error))
          (`finished
           (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
                  (no-errors (cdr (assq 'error error-counts)))
                  (no-warnings (cdr (assq 'warning error-counts)))
                  (face (cond (no-errors 'error)
                              (no-warnings 'warning)
                              (t 'success))))
             (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
                         'face face)))
          (`interrupted " -")
          (`suspicious '(propertize " ?" 'face 'warning)))))





(provide 'init-flycheck)
;;; init-flycheck.el ends here
