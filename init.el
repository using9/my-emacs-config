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

(setq zone-timer 50)
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-complete)
(require 'init-editor)
(require 'init-org)
(require 'init-custom)
(require 'init-awesome-tray)
(require 'init-undo-tree)

(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(elfeed compat async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-search-date-face ((t :foreground "#f0f" :weight extra-bold :underline t))))
