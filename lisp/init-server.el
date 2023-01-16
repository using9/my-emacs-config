(server-mode)
(setq server-auth-dir "~\\server")
(setq server-name "server_file")
(unless (server-running-p)
  (server-start))

(provide 'init-server)
;;
