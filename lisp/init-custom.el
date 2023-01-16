;;; init-custom.el
;;; Commentary:
;;; Code:
;;;


(defun dired-open-files()
  "dired open file just type \"o\""
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if(file-exists-p file-name)
        (call-process-shell-command (format "\"%s\"" file-name) nil 0))
    (if(file-directory-p file-name)
        (call-process-shell-command (browse-url-of-dired-file) nil 0))))


(defun open-config-file ()
  "open init.el file."
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(defun insert-full-date()
  "insert full data string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %T\n")))

(defun insert-date()
  "just insert date no year."
  (interactive)
  (insert (format-time-string " %m%d "))
  )

(defun today-dir()
  "open today dir."
  (interactive)
  (setq todaystr (concat "d:\\" (format-time-string "%Y\\%m%d")))
    (unless (file-exists-p todaystr)
    (make-directory todaystr))
    (call-process-shell-command (concat "explorer " todaystr))  
	)


(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)

(provide 'init-custom)
;;; init-custom.el ends here
