;;; package --- Summary
;;; Commentary:
;;; Code:

;;(setq insert-directory-program "ls" dired-use-ls-dired t)
;;(setq dired-listing-switches "-al --group-directories-first")
;;(setq dired-listing-switches "-al")
;;(setq temporaty-file-directory (expand-file-name "Temp" user-emacs-directory))
(let ((emacs-git (expand-file-name "git/" user-emacs-directory)))
  (mapc (lambda (x)
          (add-to-list 'load-path (expand-file-name x emacs-git)))
        (delete ".." (directory-files emacs-git))))

(setq atf  "fautoloads.el")

(defun local/prepare-local-lisp (dir)
  "Prepare (compile + autoload) all packages in directory DIR."
  (require 'autoload)
  (let  (
         (make-backup-files nil)
         (generated-autoload-file (expand-file-name atf  dir)))
    (dolist (dir (directory-files dir t "^[^.]"))
      (when (file-directory-p dir)
        (with-current-buffer (find-file-noselect generated-autoload-file)
          (insert ";;") ;; create the file with non-zero size to appease autoload
          (save-buffer))

        (byte-recompile-directory dir 0)
        (update-directory-autoloads dir)))
    (add-to-list 'load-path dir)
    (load generated-autoload-file nil t))
  )


(let (
      (latf  (concat "git/" atf)) )
      (if (file-exists-p
           (expand-file-name latf user-emacs-directory)
           )
      (load-file (expand-file-name latf  user-emacs-directory) )
      (local/prepare-local-lisp
       (locate-user-emacs-file
        (concat user-emacs-directory "git")
        )
       )
      )
      )


  ;;(setq custom-file (expand-file-name "custom.el" "~/.emacs.d/modes"))

(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))
(require 'editor)
(require 'customs)
;;(require 'work-path)
(require 'completes)
(require 'org-config)
(require 'window-config)
(require 'elfeed-config)
(require 'yasnippet-config)
(require 'pyim-config)
(require 'markdown-config)
(require 'keys)
(require 'fonts)
;;(require 'which-key_conf)
(require 'chinese-x)
(require 'popper-config)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:family "Special Elite" :foundry "AOEF" :slant normal :weight regular :height 140 :width normal))))
 '(elfeed-search-date-face ((t :foreground "#f0f" :weight extra-bold :underline t)))
 '(line-number-current-line ((t (:inherit line-number :foreground "red")))))

(provide 'init)
;;; init.el ends here
