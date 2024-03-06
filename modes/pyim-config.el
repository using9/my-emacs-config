(setq default-input-method "pyim")
(pyim-default-scheme 'quanpin)
(pyim-isearch-mode 1)

;; (setq-default pyim-english-input-switch-functions
;;               '(pyim-probe-dynamic-english
;;                 pyim-probe-isearch-mode
;;                 pyim-probe-program-mode
;;                 pyim-probe-org-structure-template))

;; (setq-default pyim-punctuation-half-width-functions
;;               '(pyim-probe-punctuation-line-beginning
;;                 pyim-probe-punctuation-after-punctuation))
(setq pyim-page-length 5)
(pyim-basedict-enable)
(setq pyim-page-tooltip 'minibuffer)
(setq pyim-page-style 'one-line)

(setq-default pyim-punctuation-translate-p '(auto))
(setq pyim-indicator-list (list #'pyim-indicator-with-cursor-color #'pyim-indicator-with-modeline))
(with-eval-after-load 'pyim
  (define-key pyim-mode-map "." 'pyim-page-next-page)
  (define-key pyim-mode-map "," 'pyim-page-previous-page)
  )

(defun my-orderless-regexp (orig_func component)
  (let ((result (funcall orig_func component)))
    (pyim-cregexp-build result)))

;;(setq debug-on-error t)
;;(pyim-isearch-mode 1)
(global-set-key (kbd "M-i") 'pyim-convert-string-at-point)

(setq pyim-cloudim nil)
(setq pyim-candidates-search-buffer-p nil)

(defun my-orderless-regexp (orig-func component)
  (let ((result (funcall orig-func component)))
    (pyim-cregexp-build result)))

(advice-add 'orderless-regexp :around #'my-orderless-regexp)


(provide 'pyim-config)
