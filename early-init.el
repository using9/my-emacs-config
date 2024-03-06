;;; package --- Summary
;;; Commentary:
;;;
(setq-default
 default-frame-alist
 '(
;; (fullscreen . maximized)             ;; Maximize the window by default
;; (undecorated . t)                    ;; Remove extraneous X decorations
   (left-fringe . 5)                    ;; Thin left fringe;
   (right-fringe . 5)                   ;; Thin right fringe
   (right-divider-width . 1)            ;; Thin vertical window divider
   (width . 85)
   (height . 40)
   (top . 40)
   (left . 15)
   (horizontal-scroll-bars . nil)       ;; No horizontal scroll-bars
   (vertical-scroll-bars . nil)         ;; No vertical scroll-bars
   (tool-bar-lines . 0)                 ;; No tool bar
   (menu-bar-lines . 0)                 ;;  No menu bar
;;   (alpha-background . 80)
   )
 )

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.5)

(defvar prot-emacs--file-name-handler-alist file-name-handler-alist)
(defvar prot-emacs--vc-handled-backends vc-handled-backends)

(setq file-name-handler-alist nil
      vc-handled-backends nil
      create-lockfiles nil
      inhibit-startup-screen t               ; Disable start-up screen
      initial-scratch-message nil             ; Empty the initial *scratch* buffer
      initial-major-mode 'text-mode
      )

(add-hook 'emacs-startup-hook
          (lambda ()

          (message "start in %s with %d garbage"
               (format "%.2f seconds."
                   (float-time
                    (time-subtract after-init-time before-init-time)))
               gcs-done)))




(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-file-dialog nil
      use-short-answers t
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      )
(setq byte-compile-warnings '( cl-functions))


;;(modify-frame-parameters nil '((sticky . t) (width . 100) (height . 40)))
(provide 'early-init)
