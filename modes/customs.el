;;; customs.el
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

(defun date-string-full()
  "insert full data string."
  (interactive)
  (insert (format-time-string "%Y_%m_%d_%H_%M_%S" )))

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

(defun gushi()
  "start achive"
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/elpa/achive")
  (require 'achive)
  (achive)
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


(defun vba()
  "vba mode"
  (interactive)
  ;; (add-to-list 'load-path "~/.emacs.d/elpa/vba/auto-complete")
  ;; (add-to-list 'load-path "~/.emacs.d/elpa/vba/emacs-vbasense")
  ;; (add-to-list 'load-path "~/.emacs.d/elpa/vba/log4e")
  ;; (add-to-list 'load-path "~/.emacs.d/elpa/vba/yaxception")
  ;; (require 'init-vba)

   (add-to-list 'load-path "~/.emacs.d/elpa/vba-mode/")

   (autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
  (push '("\\.\\(?:frm\\|\\(?:ba\\|cl\\|vb\\)s\\)\\'" . visual-basic-mode)
       auto-mode-alist)

  )

(defun only()
  "Delete other frames"
  (interactive)
  (delete-other-frames)
  )

(defun org-export-docx ()
  (interactive)
  (let ((docx-file (concat (file-name-sans-extension (buffer-file-name)) ".docx"))
           (template-file "template.docx"))
    (shell-command (format "pandoc %s -o %s --reference-doc=%s" (buffer-file-name) docx-file template-file))
    (message "Convert finish: %s" docx-file)))

(provide 'customs)
;; ends customs
