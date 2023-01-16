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
(require 'init-complete)
(require 'init-editor)
(require 'init-org)
(require 'init-custom)
(require 'init-undo-tree)

(if (eq system-type 'windows-nt)
(require 'init-windows-nt)
)

(defun flycheck()
  "Start flycheck-mode"
  (interactive)
  (require 'init-flycheck)
  )

(defun vlf()
  "Start vlf-mode"
  (interactive)
  (require 'init-vlf)
  (vlf-mode)
  )

(defun news()
  "Start elfeed"
  (interactive)
  (require 'init-elfeed)
  (elfeed)
  )

(defun gushi()
  "Start stock-tracker"
  (interactive)
  (require 'init-stock)
  (stock-tracker-start)
  )


 (if (file-exists-p "~/.emacs.d/lisp/work-path.el") 
     ;;"work-path is personal file."
   (require 'work-path)
   )

(defun py()
  "Start pyim"
  (interactive)
  (require 'init-pyim)
  (pyim-activate)
  )
(defun esu()
  "Start esup"
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/elpa/esup")
  (require 'esup)
  (esup)
  )

(setq-local macros_f "~/.emacs.d/macros") 
(if (file-exists-p macros_f)
	(load-file macros_f)
  )

 (setq tramp-default-method "ssh")

(defun vi()
  "Start evil-mode"
  (interactive)
(require 'init-evil)
)


(provide 'init)

;;; init.el ends here


