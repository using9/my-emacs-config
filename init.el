;;; package --- Summary
;;; Commentary:
;;; Code:

(setq temporaty-file-directory (expand-file-name "Temp" user-emacs-directory))
(let ((emacs-git (expand-file-name "git/" user-emacs-directory)))
  (mapc (lambda (x)
          (add-to-list 'load-path (expand-file-name x emacs-git)))
        (delete ".." (directory-files emacs-git))))

(defun local/prepare-local-lisp (dir)
  "Prepare (compile + autoload) all packages in directory DIR."
  (require 'autoload)
  (let ((generated-autoload-file (expand-file-name "fautoloads.el" dir)))
    (dolist (dir (directory-files dir t "^[^.]"))
      (when (file-directory-p dir)
        (with-current-buffer (find-file-noselect generated-autoload-file)
          (insert ";;") ;; create the file with non-zero size to appease autoload
          (save-buffer))
        (byte-recompile-directory dir 0)
        (update-directory-autoloads dir)))
    (add-to-list 'load-path dir)
    (load generated-autoload-file nil t)))


(if (file-exists-p (expand-file-name "git/fautoloads.el" user-emacs-directory))
     (load-file (expand-file-name "git/fautoloads.el" user-emacs-directory))
  (local/prepare-local-lisp (locate-user-emacs-file "~/.emacs.d/git")))

;;(setq custom-file (expand-file-name "custom.el" "~/.emacs.d/modes"))

(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))
(require 'editor)
(require 'customs)
(require 'work-path)
(require 'completes)
(require 'org-config)
(require 'window-config)
(require 'elfeed-config)
(require 'yasnippet-config)
(require 'pyim-config)
(require 'auto-mark-config)
(require 'markdown-config)
(require 'keys)
(require 'fonts)
(require 'which-key_conf)
(require 'chinese-x)


(add-hook 'after-init-hook
          (lambda()
            (let ((gc-cons-percentage .5)
                  (gc-cons-threshold most-positive-fixnum)
                  (read-process-output-max (* 1024 1024)))
              )))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values '((git-commit-major-mode . git-commit-elisp-text-mode)))
 '(send-mail-function 'mailclient-send-it)
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-search-date-face ((t :foreground "#f0f" :weight extra-bold :underline t))))
