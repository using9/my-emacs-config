(setq org-adapt-indentation t
      org-hide-emphasis-markers t
      org-fontify-done-headline t
      org-pretty-entities t
      org-startup-indented t
      org-src-tab-acts-natively t
      org-hide-leading-stars t
      org-modules-loaded t
      org-odd-levels-only t
      org-startup-indented t)


(setq org-list-demote-modify-bullet
      (quote (("+" . "-")
              ("-" . "+")
              ("*" . "-")
              ("1." . "-")
              ("1)" . "-")
              ("A)" . "-")
              ("B)" . "-")
              ("a)" . "-")
              ("b)" . "-")
              ("A." . "-")
              ("B." . "-")
              ("a." . "-")
              ("b." . "-"))))

;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\([-]\) "
;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\([+]\) "
;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))


(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
                                       ("#+END_SRC" . "†")
                                       ("#+begin_src" . "†")
                                       ("#+end_src" . "†")
                                       (">=" . "≥")
                                       ("=>" . "⇨")))
(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'org-mode-hook 'prettify-symbols-mode)
(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (variable-pitch-mode 1)
                           visual-line-mode))



(let ((org-time-stamp-custom-formats
       '("<%A, %B %d, %Y>" . "<%A, %B %d, %Y %H:%M>"))
      (org-display-custom-times 't)))
(setq org-export-backends (quote (ascii html icalendar latex md)))
(add-hook 'org-mode-hook 'valign-mode)

  (defun set-xls-local-variables ()
    "Set local variables for using xls"
     (if(file-exists-p file-name)
         (call-process-shell-command (format "\"%s\"" file-name) nil 0))
     )
(defun set-myl-local-variables ()
    "Set local variables for using myl"
     (if(file-exists-p file-name)
         (call-process-shell-command (format "\"%s\"" file-name) nil 0))
     )

;; link file open type
;; (setq org-file-apps
;;       '((aotu-mode . system)
;;          ("\\.xls\\" . excel.exe)
;;       (\\.org\\ . emacs)
;;       ("\\.txt\\" . emacs)
;; )
;;       )
;; ("\\.doc\\" . system)
;;


(provide 'org-config)
