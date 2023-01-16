;;; other-config.el
;;; Commentary:
;;; Code:
;;;


(set-face-attribute 'default nil :font  (font-spec :family "新宋体" :size 16 :powerline-scale 0.8))
;;(if (eq system-type 'windows-nt)
;;	(set-face-attribute 'default nil :font  (font-spec :family "ÐÂËÎÌå" :size 16 :powerline-scale 0.8))
;;  (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;	(set-fontset-font (frame-parameter nil 'font) charset
;;                      (font-spec :family "ººÒÇÌÆÃÀÈË 55W" :size 18 :powerline-scale 0.8))) 

  (setenv "PATH" (concat "~/.emacs.d/bin" ";"  (getenv "PATH"))  )

  

  (if (file-directory-p "d:/")
	  (unless (file-directory-p (concat "d:/" (format-time-string "%Y/")))
		(make-directory (concat "d:/" (format-time-string "%Y/")))
	    )
	)
  ;; (make-today-dir)
  )

(defun explorer_it()
  "open file manager open current dired."
  (interactive)
  (if (eq system-type 'windows-nt)
      (shell-command (concat "explorer ."))))

(provide 'init-windows-nt)

