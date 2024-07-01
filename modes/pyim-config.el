(setq default-input-method "pyim")
(with-eval-after-load 'pyim
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

  (define-key pyim-mode-map "." 'pyim-page-next-page)
  (define-key pyim-mode-map "," 'pyim-page-previous-page)

  (pyim-default-scheme 'quanpin)
  (pyim-isearch-mode 1)



  (defun my-orderless-regexp (orig_func component)
    (let ((result (funcall orig_func component)))
      (pyim-cregexp-build result)))

  ;;(setq debug-on-error t)
  ;;(pyim-isearch-mode 1)


  (setq pyim-cloudim nil)
  (setq pyim-candidates-search-buffer-p nil)

  (defun my-orderless-regexp (orig-func component)
    (let ((result (funcall orig-func component)))
      (pyim-cregexp-build result)))

  (advice-add 'orderless-regexp :around #'my-orderless-regexp)

  )
(provide 'pyim-config)
