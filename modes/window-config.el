;;; init-windows.el --- Working with windows within frames -*- lexical-binding: t -*-
;;; Commentary:

;; This is not about the "Windows" OS, but rather Emacs's "windows"
;; concept: these are the panels within an Emacs frame which contain
;; buffers.

;;; Code:

;; Navigate window layouts with "C-c <left>" and "C-c <right>"

;;(add-hook 'after-init-hook 'winner-mode)


;; Make "C-x o" prompt for a target window when there are more than 2
;;(add-to-list 'load-path "~/.emacs.d/elpa/switch-window-20210331.911/")
;;(add-to-list 'load-path "~/.emacs.d/elpa/windswap-20200722.411/")
;;(require 'switch-window)
;;(setq-default switch-window-shortcut-style 'alphabet)
;;(setq-default switch-window-timeout nil)
;;(global-set-key (kbd "C-x o") 'switch-window)



;; When splitting window, show (other-buffer) in the new window


;;(add-to-list 'load-path "~/.emacs.d/elpa/switch-window/")
;;(require 'switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)
(setq switch-window-threshold 2)

(setq switch-window-auto-resize-window t)
(setq switch-window-default-window-size 0.6) ;80% of frame size
;;(switch-window-mouse-mode) ;auto resize when switch window with mouse


(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
;; (global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
;; (global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)

(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)

(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)

(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)





(defun split-h ()
    "Split this window and switch to the new window unless ARG is provided."
    (interactive)
    (funcall 'split-window-horizontally)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      )
    )

(defun split-v ()
    "Split this window and switch to the new window unless ARG is provided."
    (interactive)
    (funcall 'split-window-vertically)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      ))

;;(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer 'split-window-vertically))
;;(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer 'split-window-horizontally))

(defun sanityinc/toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

;;(global-set-key (kbd "C-x 1") 'sanityinc/toggle-delete-other-windows)


;; Rearrange split windows

(defun split-window-horizontally-instead ()
  "Kill any other windows and re-split such that the current window is on the top half of the frame."
  (interactive)
  (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
    (delete-other-windows)
    (split-window-horizontally)
    (when other-buffer
      (set-window-buffer (next-window) other-buffer))))

(defun split-window-vertically-instead ()
  "Kill any other windows and re-split such that the current window is on the left half of the frame."
  (interactive)
  (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
    (delete-other-windows)
    (split-window-vertically)
    (when other-buffer
      (set-window-buffer (next-window) other-buffer))))

;(global-set-key (kbd "C-x |") 'split-window-horizontally-instead)
;(global-set-key (kbd "C-x _") 'split-window-vertically-instead)


;; Borrowed from http://postmomentum.ch/blog/201304/blog-on-emacs

(defun sanityinc/split-window()
  "Split the window to see the most recent buffer in the other window.
Call a second time to restore the original window configuration."
  (interactive)
  (if (eq last-command 'sanityinc/split-window)
      (progn
        (jump-to-register :sanityinc/split-window)
        (setq this-command 'sanityinc/unsplit-window))
    (window-configuration-to-register :sanityinc/split-window)
    (switch-to-buffer-other-window nil)))

;;(global-set-key (kbd "<f7>") 'sanityinc/split-window)




(defun sanityinc/toggle-current-window-dedication ()
  "Toggle whether the current window is dedicated to its current buffer."
  (interactive)
  (let* ((window (selected-window))
         (was-dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not was-dedicated))
    (message "Window %sdedicated to %s"
             (if was-dedicated "no longer " "")
             (buffer-name))))

;;(global-set-key (kbd "C-c <down>") 'sanityinc/toggle-current-window-dedication)



(provide 'window-config)
;;; init-windows.el ends here
