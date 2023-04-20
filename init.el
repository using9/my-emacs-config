;;; init.el --- Config for minibuffer completion
;;; Commentary:
;;; Code:
;;;

(add-hook 'after-init-hook (lambda()
							 (let ((gc-cons-percentage .5)
								   (gc-cons-threshold most-positive-fixnum)
								   (read-process-output-max (* 1024 1024)))
							   )))

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
(require 'init-awesome-tray)
(require 'init-undo-tree)
(require 'init-windows)
(require 'init-elfeed)
(require 'init-yasnippet)
(provide 'init)

