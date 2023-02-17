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

(font-lock-add-keywords 'org-mode
                        '(("^ *\([-]\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(font-lock-add-keywords 'org-mode
                        '(("^ *\([+]\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "◦"))))))

(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
                                       ("#+END_SRC" . "†")
                                       ("#+begin_src" . "†")
                                       ("#+end_src" . "†")
                                       (">=" . "≥")
                                       ("=>" . "⇨")))
(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'org-mode-hook 'prettify-symbols-mode)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))



(let ((org-time-stamp-custom-formats
       '("<%A, %B %d, %Y>" . "<%A, %B %d, %Y %H:%M>"))
      (org-display-custom-times 't)))
(setq org-export-backends (quote (ascii html icalendar latex md)))
(provide 'init-org)
