;;; init.el --- Config for minibuffer completion
;;; Commentary:
;;; Code:
;;;


(let ((default-directory user-emacs-directory)
      (file-name-handler-alist nil)
	  (gc-cons-percentage .5)
	  (gc-cons-threshold most-positive-fixnum)
	  (read-process-output-max (* 1024 1024)))

  )
(cd "~/")

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "start in %s with %d garbage"
                     (format "%.2f seconds."
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; ;; encoding
;; (prefer-coding-system 'utf-8)
;; (setq coding-system-for-read 'utf-8)
;; (setq coding-system-for-write 'utf-8)

(add-to-list 'load-path "~/.emacs.d/lisp")
;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;;(add-to-list 'load-path (expand-file-name "elpa" ))
(require 'init-complete)
(require 'init-editor)
(require 'init-org)
;;(require 'init-run)
(if (eq system-type 'windows-nt)

(require 'init-windows-nt)
)

(defun flycheck()
  ""
  (interactive)
  (require 'init-flycheck)
  )


(defun vlf()
  ""
  (interactive)
  (require 'init-vlf)
  (vlf-mode)
  )

(defun news()
  ""
  (interactive)
  (require 'init-elfeed)
  (elfeed)
  )

(defun gushi()
  ""
  (interactive)
  (require 'init-stock)
  (stock-tracker-start)
  )
(require 'init-custom)
(require 'work-path)
(defun py()
  ""
  (interactive)
  (require 'init-pyim)
  (pyim-activate)
  )
(defun esu()
  ""
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/elpa/esup")
  (require 'esup)
  (esup)
  )

;; (add-hook 'after-init-hook
;;           (lambda ()
;; 			;;(require 'init-consult)
;; 			(require 'init-complete)
;; 			(require 'init-vlf)
;; 			(require 'init-pyim)
;; 			(require 'init-elfeed)
;; 			(require 'init-flycheck)
;; 			(require 'init-stock)
;; 			(require 'init-org)

;; 			 ))

(run-at-time "16:55" nil #'switch-to-buffer-other-frame "It's time to write Report. ")

(setq-local macros_f "~/.emacs.d/macros") 
(if (file-exists-p macros_f)
	(load-file macros_f)
  )


    (setq tramp-default-method "ssh")
;;(add-hook 'after-init-hook 'init-yasnippets))


;;(require 'init-gnus)

(defun vi()
  ""
  (interactive)
(require 'init-evil)
)

(require 'init-undo-tree)
(provide 'init)

;;; init.el ends here


