;;; init-editor.el
;;; Commentary:
;;; Code:
;;;
(setq abn-cache-dir "~/.emacs.d/")

(load-theme 'misterioso)
(cd "~")
(set-face-background 'show-paren-match "#262b36")
(set-face-bold 'show-paren-match t)
(set-face-foreground 'show-paren-match "#ffffff")
(set-frame-parameter (selected-frame) 'alpha (list 90 65))

;; define custom keys
(global-set-key [f3] 'ibuffer)
(global-set-key [f4] 'kill-this-buffer)
;;(global-set-key [f8] '(dired-jump other-frame  '(concat "d:\\" (format-time-string "%Y\\%m%d"))))
(global-set-key [f11] 'toggle-frame-fullscreen)
(global-set-key [f12] 'yank)
(global-set-key (kbd "C-x r v") 'list-registers)
										;(global-set-key [f6] '(find-file "~/.emacs.d/lisp/init-editor.el"))
;;; encoding
(defun enforce-coding-system-priority ()
  (let ((pref (car (coding-system-priority-list)))
        (list (find-coding-systems-region (point-min) (point-max))))
    (when (or (memq 'undecided list) (memq pref list))
      (setq buffer-file-coding-system pref))))

(add-hook 'before-save-hook 'enforce-coding-system-priority)
(prefer-coding-system 'chinese-gbk)

(setq save-place-file (concat abn-cache-dir "/places"))
(setq save-place-forget-unreadable-files nil)
(setq save-place-version-control t)

(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 case-fold-search t
 cursor-in-non-selected-windows nil     ; Hide the cursor in inactive windows
 custom-unlispify-tag-names nil         ; Prefer kebab-case for symbols
 delete-by-moving-to-trash t            ; Delete files to trash
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 fill-column 80                         ; Set width for automatic line breaks
 find-file-suppress-same-file-warning t
 gnus-inhibit-startup-message t		   ;;
 highlight-nonselected-windows nil	   ;;
 indent-tabs-mode t
 inhibit-startup-screen t               ; Disable start-up screen
 initial-scratch-message ""             ; Empty the initial *scratch* buffer
 load-prefer-newer t
 make-pointer-invisible t
 mouse-autoselect-window t
 mouse-yank-at-point t
 pixel-scroll-precision-mode 1
 read-buffer-completion-ignore-case t
 recenter-positions '(5 top bottom)     ; Set re-centering positions
 require-final-newline t
 save-interprogram-paste-before-kill t
 select-enable-clipboard t              ; Merge system's and Emacs' clipboard
 sentence-end-double-space nil          ; Use a single space after dots
 set-mark-command-repeat-pop t
 size-indication-mode t
 tab-width 4                          ; Smaller width for tab characters
 tramp-default-method "ssh"
 text-quoting-style 'grave
 truncate-lines nil  ;;;;;;;;;
 truncate-partial-width-windows nil
 uniquify-buffer-name-style 'post-forward-angle-brackets
 window-combination-resize t           ; Resize windows proportionally
;; confirm-kill-emacs 'y-or-n-p
 )                                      ; Stretch cursor to the glyph width

(blink-cursor-mode 0)                   ; Prefer a still cursor
(delete-selection-mode 1)               ; Replace region when inserting text
(fset 'yes-or-no-p 'y-or-n-p)           ; Replace yes/no prompts with y/n
(mouse-avoidance-mode 'animate)           ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)    ; Enable downcase-region
(put 'upcase-region 'disabled nil)     ; Enable upcase-region



(set-cursor-color "red")
     ;;; Uodo
(setq   undo-limit (* 16 1024 1024))
(setq undo-outer-limit (* 64 1024 1024))
(setq undo-strong-limit (* 24 1024 1024))


;; backup
(let* ((backup-dir (expand-file-name "~/.backups")))
  (unless (file-exists-p backup-dir) (make-directory backup-dir)))
(setq-default
;; make-backup-files t
 backup-by-copying t
 backup-directory-alist `(("." . "~/backups/"))
 delete-old-versions t
 version-control t
 delete-by-moving-to-trash t
 kept-new-versions 8
 kept-old-versions 4
 create-lockfiles nil)

(setq vc-make-backup-files nil)



(set-face-attribute 'default nil :font  (font-spec :family "新宋体" :size 16 :powerline-scale 0.8))
;;(if (eq system-type 'windows-nt)
;;	(set-face-attribute 'default nil :font  (font-spec :family "ÐÂËÎÌå" :size 16 :powerline-scale 0.8))
;;  (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;	(set-fontset-font (frame-parameter nil 'font) charset
;;                      (font-spec :family "ººÒÇÌÆÃÀÈË 55W" :size 18 :powerline-scale 0.8))) 

  (setenv "PATH" (concat "~/.emacs.d/bin" ";"  (getenv "PATH"))  )

(defun explorer_it()
  "open file manager open current dired."
  (interactive)
  (if (eq system-type 'windows-nt)
      (shell-command (concat "explorer ."))))

;; -- server mode config for Windows OS.
;; HKEY_CLASSES_ROOT\*\shell\Emacs\command
;;"emacs-path\bin\emacsclientw.exe"  --no-wait --quiet
;;   --server-file="d:\home\server\server_file"
;;   --alternate-editor="emacs-path\bin\runemacs.exe" "%0"
(setq server-auth-dir (concat abn-cache-dir "/server")
	  server-name "server_file")
(add-hook 'after-init-hook 'server-mode)
(with-eval-after-load 'server-mode
  (unless (server-running-p)
    (server-start))	  
  )

(add-hook 'after-init-hook #'auto-save-visited-mode)
(with-eval-after-load 'auto-save-visited-mode
  (auto-save-visited-mode t)
  )


(require 'dired)
;;(with-eval-after-load 'dired
(setq dired-auto-revert-buffer t
      dired-dwim-target t
      dired-hide-details-hide-symlink-targets t
      dired-listing-switches "-alh --group-directoy"
      dired-ls-F-marks-symlinks nil
      dired-recursive-copies 'always
	  )
 ;; (dired-hide-details-mode 1)
 ;; (diredfl-mode)
(define-key dired-mode-map "o" 'dired-open-files)
(define-key dired-mode-map "h" 'dired-up-directory)
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-previous-line)
(define-key dired-mode-map "l" 'dired-single-buffer)
(define-key ctl-x-map "\C-j" 'dired-jump)
(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))
;;)

(setq set-mark-command-repeat-pop t
	  y-or-n-p-use-read-key t
	  use-short-answers t
	  )

(add-hook 'buffer-list-update-hook 'recentf-track-opened-file)
(setq recentf-save-file (concat abn-cache-dir "/recentf"))
(setq-default
 recentf-max-saved-items 200
 recentf-exclude `("/tmp/" "/ssh:"  "/rum"))

(setq revert-buffer-quick-short-answers t)


(setq enable-recursive-minibuffers t ; Allow commands in minibuffers
      history-length 100
      savehist-save-minibuffer-history t
      savehist-additional-variables '(kill-ring
                                      register-alist
                                      mark-ring
                                      global-mark-ring
                                      search-ring
                                      regexp-search-ring
                                      extended-command-history)
      savehist-autosave-interval 300)

(setq epa-file-select-keys 0)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;;tramp
(setq remote-file-name-inhibit-cache 60
      tramp-completion-reread-directory-timeout 60
      tramp-verbose 1
      vc-ignore-dir-regexp (format "%s\\|%s\\|%s"
                                   vc-ignore-dir-regexp
                                   tramp-file-name-regexp
                                   "[/\\\\]node_modules"))

(setq require-final-newline t)
(setq kill-do-not-save-duplicates t)

     ;;; eww inhibi
(setq shr-inhibit-images t)



(defun sanityinc/toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

(defun split-window-func-with-other-buffer2 ()
  (lambda (&optional arg)
    "Split this window and switch to the new window unless ARG is provided."
    (interactive )
    (funcall 'split-window-vertically)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      (unless arg
        (select-window target-window)))))

(defun split-window-func-with-other-buffer3 ()
  (lambda (&optional arg)
    "Split this window and switch to the new window unless ARG is provided."
    (interactive )
    (funcall 'split-window-horizontally)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      (unless arg
        (select-window target-window)))))



(global-set-key (kbd "C-x 1") 'sanityinc/toggle-delete-other-windows)
(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer2))
(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer3))


(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'after-init-hook 'winner-mode)
(add-hook 'after-init-hook 'recentf-mode)
(add-hook 'after-init-hook 'savehist-mode)
(add-hook 'after-init-hook 'save-place-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)
;;(add-hook 'after-init-hook 'global-highlight-changes-mode)
(add-hook 'after-init-hook 'global-hl-line-mode)
(add-hook 'after-init-hook 'global-subword-mode)

(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil
      auto-revert-use-notify nil
      auto-revert-stop-on-user-input nil)
(with-eval-after-load 'autorevert
  (add-hook 'after-init-hook 'auto-revert-mode))

(add-hook 'after-init-hook 'transient-mark-mode)
(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'show-paren-mode)
(when (fboundp 'so-long-enable)
  (add-hook 'after-init-hook 'so-long-enable))



(defun undo-all ()
  "Undo all edits."
  (interactive)
  (when (listp pending-undo-list)
    (undo))
  (while (listp pending-undo-list)
    (undo-more 1))
  (message "Buffer was completely undone"))


(setq-default
 mode-line-format
 (list
  ;; the buffer name; the file name as a tool tip
  '(:eval (propertize " %+ " 'face 'font-lock-keyword-face
                      ))
  " "
  '(:eval (propertize " %b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name)))
  ;; line and column
  "(" ;; '%02' to set to 2 chars at least; prevents flickering
  (propertize "L%02l" 'face 'font-lock-type-face) ","
  (propertize "%01c" 'face 'font-lock-type-face)
  ") "
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] "
  " ["
  (propertize "%m" 'face 'font-lock-constant-face)
  "] "
    ;;; flycheck number
  ;; " <"
  ;; "%1 "
  ;;  my-flycheck-mode-line
  ;; "> "
  " { "
  '(:eval (propertize (format-time-string "%H:%M %b%dÈÕ %a") 'face 'font-lock-keyword-face
                      'help-echo
                      (concat (format-time-string "%c; ")
                              (emacs-uptime "Uptime:%hh"))))
  " } "

  ))


(setq-local macros_f "~/.emacs.d/macros") 
(if (file-exists-p macros_f)
	(load-file macros_f)
  )
;;; esc always quits
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'keyboard-quit)

;;(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

(provide 'init-editor)
;;; init-editor.el ends here
