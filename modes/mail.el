(require 'auth-source);; probably not necessary
(setq auth-sources '("~/.authinfo" "~/.authinfo.gpg"))


(setq message-send-mail-function 'smtpmail-send-it)
(setq user-mail-address "our0@qq.com")
(setq user-full-name "our0")

(setq smtpmail-smtp-user "our0@qq.com"
      smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type 'ssl)

;;Debug
(setq smtpmail-debug-info t)
(setq smtpmail-debug-verb t)
