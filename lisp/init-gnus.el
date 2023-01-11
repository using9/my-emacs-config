

	
;;(setq gnus-secondary-select-methods '((nnmbox "126")))

;; (setq user-mail-address "jiuzh@126.com"
;;       user-full-name "using")

(setq
 gnus-secondary-select-methods '((nnml ""))
 mail-sources '((pop :server "imap.126.com"
					 :user "jiuzh@126.com")))

;; (setq gnus-select-method
;;       '(nnimap "126"
;;                (nnimap-address "imap.126.com")
;;                (nnimap-inbox "INBOX")
;;                (nnimap-expunge t)
;;                (nnimap-server-port 993)
;;                (nnimap-stream ssl)))

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.126.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (setq read-mail-command (quote gnus))
;; (setq gnus-home-directory "~/.emacs.d/gnus")
;; (setq gnus-directory gnus-home-directory)
;; (setq message-directory (concat gnus-directory "Mails/"))

;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; (add-function
;;  :override (symbol-function 'nnimap-get-groups)
;;  (lambda ()
;;    (erase-buffer)
;;    (let ((sequence (nnimap-send-command "LIST \"\" \"*\""))
;;          groups)
;;      (nnimap-wait-for-response sequence)
;;      (subst-char-in-region (point-min) (point-max)
;;                            ?\\ ?% t)
;;      (goto-char (point-min))
;;      (nnimap-unfold-quoted-lines)
;;      (goto-char (point-min))
;;      (while (search-forward "* LIST " nil t)
;;        (let ((flags (mapcar (lambda (x) (intern (downcase (symbol-name x))))
;;                             (read (current-buffer))))
;;              (_separator (read (current-buffer)))
;;              (group (buffer-substring-no-properties
;;                      (progn (skip-chars-forward " \"")
;;                             (point))
;;                      (progn (end-of-line)
;;                             (skip-chars-backward " \r\"")
;;                             (point)))))
;;          (unless (member '%noselect flags)
;;            (push (utf7-decode (if (stringp group)
;;                                   group
;;                                 (format "%s" group))
;;                               t)
;;                  groups))))
;;      (nreverse groups))))

(provide 'init-gnus)
