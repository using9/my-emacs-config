(setq tab-always-indent 'complete)

;; vertico
(add-hook 'after-init-hook 'vertico-mode)
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; orderless
(setq completion-styles '(orderless basic substring partial-completion flex)
      completion-category-overrides '((file (styles orderless partial-completion )))
      completion-category-defaults nil
      completion-cycle-threshold 4
      completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
                   #'consult-completion-in-region
                 #'completion-in-region)
               args))
      orderless-component-separator #'orderless-escapable-split-on-space
      orderless-style-dispatchers (list #'orderless-affix-dispatch)
      orderless-matching-styles
      '(orderless-prefixes orderless-regexp)
      )

;; ;;cape:
(add-to-list 'completion-at-point-functions #'cape-keyword)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-abbrev)

(defun my-cape-dabbrev-accept-all()
  (cape-wrap-accept-all #'cape-dabbrev)
  )
(add-to-list 'completion-at-point-functions
             #'my-cape-dabbrev-accept-all)

;;   test cape
(setq-local completion-at-point-functions
            (list (cape-capf-prefix-length #'cape-dabbrev 2)))


;; consult
(add-hook 'completion-list-mode 'consult-preview-at-point-mode)
(setq xref-show-xrefs-function #'consult-xref
      xref-show-definitions-function #'consult-xref)
(setq consult-narrow-key "<") ;; "C-+"

;;; corfu
(add-hook 'after-init-hook 'global-corfu-mode)

(setq-default corfu-auto t
              corfu-auto-delay 0.8
              corfu-auto-prefix 2
              corfu-preselect 'prompt
              corfu-echo-documentation 0.25
              corfu-scroll-margin 1
              corfu-left-margin-width 0.5
              corfu-right-margin-width 0.5
              corfu-preview-current 'insert
              corfu-cycle t
              corfu-on-exact-match nil
              corfu-highlight t
              corfu-separator ?\s
              corfu-quit-no-match 'separator
              corfu-excluded-modes '(eshell-mode lisp-mode))


(with-eval-after-load 'eshell
  (add-hook 'eshell-mode-hook (lambda () (setq-local corfu-auto nil))))

(setq dabbrev-ignored-buffer-regexps
      '("\\.\\(?:pdf\\|jpe?g\\|png\\|bmp\\|info\\)\\'")
      )

;; embark
(with-eval-after-load 'embark
  (require 'embark-consult)
  (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode))
;;marginalia
;; (marginalia-mode)
;; (add-to-list 'marginalia-prompt-categories '("\\<face\\>" . face))
;; (add-to-list 'marginalia-prompt-categories '("tab by name" . tab))

;; abbrev

(setq hippie-expand-try-functions-list
  '(try-complete-file-name-partially try-complete-file-name
     try-expand-all-abbrevs try-expand-dabbrev
     try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill
     try-complete-lisp-symbol-partially try-complete-lisp-symbol))

(provide 'completes)
;;; completes.el ends here
