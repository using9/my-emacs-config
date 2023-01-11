;;
;;
;;
;; -- server mode config.
;;(server-force-delete)
;; HKEY_CLASSES_ROOT\*\shell\Emacs\command
;;"d:\soft\emacs28\bin\emacsclientw.exe"  --no-wait --quiet
;;   --server-file="d:\home\server\server_file"
;;   --alternate-editor="d:\soft\emacs29\bin\runemacs.exe" "%0"

;;(add-hook 'after-init-mode 'server-mode)
(server-mode)
(setq server-auth-dir "~\\server")
(setq server-name "server_file")
(unless (server-running-p)
  (server-start))

(provide 'init-server)
;;
