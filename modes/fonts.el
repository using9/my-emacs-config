;;;
(if (eq system-type 'windows-nt)
    (progn
      ;;  (set-face-attribute 'default nil :font  (font-spec :family "mononoki" :size 16))
      (set-face-attribute 'default nil :font (font-spec :family "DM Mono" :size 14 ))
      ;; Chinese Font
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family "ÐÂËÎÌå"  :size 14)))
      )
  )



(provide 'fonts)
;;; fonts.el ends here
