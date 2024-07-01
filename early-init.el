;;; package --- Summary
;;; Commentary:
;;;

(if (eq system-type 'windows-nt)
(setq-default
 default-frame-alist
 '(
;; (undecorated . t)                    ;; Remove extraneous X decorations
   (left-fringe . 5)                    ;; Thin left fringe;
   (right-fringe . 5)                   ;; Thin right fringe
   (right-divider-width . 1)            ;; Thin vertical window divider
   (width . 85)
   (height . 40)
   (top . 40)
   (left . 15)
   ))
)

(setq-default
 default-frame-alist
 '(
   (horizontal-scroll-bars . nil)       ;; No horizontal scroll-bars
   (vertical-scroll-bars . nil)         ;; No vertical scroll-bars
   (tool-bar-lines . 0)                 ;; No tool bar
   (menu-bar-lines . 0)                 ;;  No menu bar
  (alpha-background . 80)
   )
 )

(setq gc-cons-threshold (* 128 1024 1024)
       frame-resize-pixelwise t
      byte-compile-warnings '( cl-functions)
      create-lockfiles nil
      file-name-handler-alist nil
      frame-inhibit-implied-resize t
      gc-cons-percentage 0.5
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      initial-major-mode 'text-mode
      initial-scratch-message nil
      jit-lock-defer-time 0
      process-adaptive-read-buffering nil
      read-process-output-max (* 4 1024 1024)
      use-file-dialog nil
      use-dialog-box nil
      use-short-answers t
      vc-handled-backends nil
      )



(defvar prot-emacs--file-name-handler-alist file-name-handler-alist)
(defvar prot-emacs--vc-handled-backends vc-handled-backends)


(add-hook 'emacs-startup-hook
          (lambda ()
          (message "start in %s with %d garbage"
               (format "%.2f seconds."
                   (float-time
                    (time-subtract after-init-time before-init-time)))
               gcs-done)))



(provide 'early-init)
;;; early-init.el ends here
