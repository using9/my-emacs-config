;;; package --- Summary
;;; Commentary:
;;; Code:
;;;
;;(load-theme 'misterioso)
(load-theme 'leuven-dark)
(cd "~")
;;	;(set-face-background 'show-paren-match "#262b36")
;;	;(set-face-foreground 'show-paren-match "#ffffff")
(set-face-bold 'show-paren-match t)
(set-frame-parameter (selected-frame) 'alpha (list 97 100))
(add-to-list 'default-frame-alist '(alpha . (98 . 98)))

;; desktop save
(let ((desktopd  "~/.emacs.d/desktop-dir"))
  (when (not (file-directory-p desktopd))
    (make-directory desktopd))
  (setq desktop-dirname desktopd)
  )


(setq create-lockfiles nil)
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent) ; Emacs 28 with native compilation
  (setq native-compile-prune-cache t)
  ) ; Emacs 29

(setq save-place-file (expand-file-name  "places" user-emacs-directory))
(setq save-place-forget-unreadable-files nil)
(setq save-place-version-control t)

(mapc
 (lambda (command)
   (put command 'disabled nil))
 '(list-timers narrow-to-region narrow-to-page upcase-region downcase-region))

;;; encoding
(defun enforce-coding-system-priority ()
  "enforce coding"
  (let ((pref (car (coding-system-priority-list)))
        (list (find-coding-systems-region (point-min) (point-max))))
    (when (or (memq 'undecided list) (memq pref list))
      (setq buffer-file-coding-system pref))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode t)
(add-hook 'prog-mode-hook 'electric-indent-mode t)
(add-hook 'prog-mode-hook 'prettify-symbols-mode)

(add-hook 'before-save-hook 'enforce-coding-system-priority)
(prefer-coding-system 'chinese-gbk)

(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)



;;** minibuffer interaction
(minibuffer-depth-indicate-mode 1)

(remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default
 ad-redefinition-action 'accept
 auto-revert-verbose nil
 blink-cursor-interval 0.6
 case-fold-search t
 column-number-mode 1
 cursor-in-non-selected-windows nil     ; Hide the cursor in inactive windows
 custom-unlispify-tag-names nil         ; Prefer kebab-case for symbols
 delete-by-moving-to-trash t            ; Delete files to trash
 display-time-24hr-format t
 display-time-default-load-average nil
 display-time-format "%b%e %a %H:%M    "
 display-time-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 fill-column 80                         ; Set width for automatic line breaks
 find-file-suppress-same-file-warning t
 frame-resize-pixelwise t
 global-auto-revert-mode 1
 gnus-inhibit-startup-message t		   ;;
 highlight-nonselected-windows nil	   ;;
 indent-tabs-mode nil
 kill-buffer-query-functions nil
 load-prefer-newer t
 make-backup-files nil
 make-pointer-invisible t
 mouse-autoselect-window t
 mouse-yank-at-point t
 native-comp-async-report-warnings-errors nil
 native-comp-deferred-compilation t
 next-screen-context-lines 5
 pixel-scroll-precision-mode 1
 read-buffer-completion-ignore-case t
 read-file-name-completion-ignore-case t
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
 truncate-lines t  ;;;;;;;;;
 truncate-partial-width-windows nil
 uniquify-buffer-name-style 'post-forward-angle-brackets
 vc-follow-symlinks t
 window-resize-pixelwise nil
 window-combination-resize t           ; Resize windows proportionally
 )                                      ; Stretch cursor to the glyph width

(blink-cursor-mode 0)                   ; Prefer a still cursor
(delete-selection-mode 1)               ; Replace region when inserting text
(fset 'yes-or-no-p 'y-or-n-p)           ; Replace yes/no prompts with y/n
(mouse-avoidance-mode 'animate)           ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)    ; Enable downcase-region
(put 'upcase-region 'disabled nil)     ; Enable upcase-region

(setq mode-line-position-column-line-format '(" %l:%c"))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(set-cursor-color "red")
;;; Uodo
(setq   undo-limit (* 16 1024 1024))
(setq undo-outer-limit (* 64 1024 1024))
(setq undo-strong-limit (* 24 1024 1024))

;;  make  backup dir
(let ((backup-dir  "~/backups"))
  (when (not (file-directory-p backup-dir))
    (make-directory backup-dir))
  (setq-default
   backup-by-copying t
   backup-directory-alist `((".*"  . ,backup-dir))
   delete-by-moving-to-trash t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 5
   make-backup-files t
   vc-make-backup-files t
   version-control t
   )
  )

(display-time)
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
(setq server-auth-dir (expand-file-name "server" user-emacs-directory)
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
(with-eval-after-load 'dired
  (setq dired-auto-revert-buffer t
        dired-dwim-target t
        dired-hide-details-hide-symlink-targets t
        dired-listing-switches "-alh --group-directoy"
        dired-ls-F-marks-symlinks nil
        dired-recursive-copies 'always
        diredfl-mode t
        )
  (add-hook 'dired-mode-hook  #'dired-hide-details-mode)
  )

(setq set-mark-command-repeat-pop t
      y-or-n-p-use-read-key t
      use-short-answers t
      )

(setq enable-recursive-minibuffers t ; Allow commands in minibuffers
      minibuffer-message-timeout 1
      history-length 10000
      history-delete-duplicates t
      savehist-save-minibuffer-history t
      savehist-additional-variables '(extended-command-history
                                      global-mark-ring
                                      kill-ring
                                      mark-ring
                                      regexp-search-ring
                                      register-alist
                                      search-ring
                                      )
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
;;(setq shr-inhibit-images t)

(defun toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))
;; winner config
(with-eval-after-load 'winner-mode
  (setq winner-boring-buffers '("*Completions*"
                                "*Compile-Log*"
                                "*inferior-lisp*"
                                "*Fuzzy Completions*"
                                "*Apropos*"
                                "*Help*"
                                "*cvs*"
                                "*Buffer List*"
                                "*Ibuffer*"
                                "*esh command on file*"))
  )

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

;;** bookmarks
(require 'bookmark)
(setq bookmark-completion-ignore-case nil)
(bookmark-maybe-load-default-file)


;; (when (fboundp 'electric-pair-mode)
;;   (add-hook 'after-init-hook 'electric-pair-mode))
;;(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'after-init-hook 'winner-mode)
(add-hook 'after-init-hook 'recentf-mode)
(add-hook 'after-init-hook 'savehist-mode)
(add-hook 'after-init-hook 'save-place-mode)
(add-hook 'after-init-hook 'global-auto-revert-mode)
(add-hook 'after-init-hook 'global-highlight-changes-mode)
(add-hook 'after-init-hook 'global-hl-line-mode)
(add-hook 'after-init-hook 'global-subword-mode)
(add-hook 'after-init-hook 'auto-revert-mode)
(add-hook 'after-init-hook 'transient-mark-mode)
(add-hook 'after-init-hook 'delete-selection-mode)
(add-hook 'after-init-hook 'show-paren-mode)

(setq blink-matching-paren nil)
(setq show-paren-style 'expression
      show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)


(add-hook 'before-save-hook 'whitespace-cleanup)

(with-eval-after-load 'auto-revert-mode
  (setq global-auto-revert-non-file-buffers t
        auto-revert-verbose nil
        auto-revert-use-notify nil
        auto-revert-stop-on-user-input nil
        revert-buffer-quick-short-answers t))

(when (fboundp 'so-long-enable)
  (add-hook 'after-init-hook 'so-long-enable))


(with-eval-after-load 'recentf-mode
  (add-hook 'buffer-list-update-hook 'recentf-track-opened-file)
  (setq recentf-save-file (expand-file-name "recentf" user-emacs-directory))
  (setq-default
   recentf-max-saved-items 200
   recentf-exclude
              '("\\.?cache" ".cask" "url" "COMMIT_EDITMSG\\'" "bookmarks"
                "\\.\\(?:gz\\|gif\\|svg\\|png\\|jpe?g\\|bmp\\|xpm\\)$"
                "\\.?ido\\.last$" "\\.revive$" "/G?TAGS$" "/.elfeed/"
                "^/tmp/" "^/var/folders/.+$" "^/ssh:" "/persp-confs/"
                (lambda (file) (file-in-directory-p file package-user-dir))))
  )

(defun undo-all ()
  "Undo all edits."
  (interactive)
  (when (listp pending-undo-list)
    (undo))
  (while (listp pending-undo-list)
    (undo-more 1))
  (message "Buffer was completely undone"))


(let ((macros_f "~/.emacs.d/macros"))
  (if (file-exists-p macros_f)
      (load-file macros_f)
    )
  )


(defun dired-open-files()
  "dired open file just type \"o\""
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if(file-exists-p file-name)
        (call-process-shell-command (format "\"%s\"" file-name) nil 0))
    (if(file-directory-p file-name)
        (call-process-shell-command (browse-url-of-dired-file) nil 0))))


(when (autoloadp (symbol-function 'glasses-mode))
  (cl-pushnew 'glasses-mode minor-mode-list))

;; vundo config
(with-eval-after-load 'vundo
  (set-face-attribute 'vundo-highlight nil :family "Symbola")
  (setq vundo-glyph-alist vundo-unicode-symbols)
  )
;; mini-modeline-mode

(minions-mode t)
(add-hook 'prog-mode-hook 'flymake-mode)
(setq flymake-no-changes-timeout nil
      flymake-fringe-indicator-position 'right-fringe)


;; better long line show ?
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
;; (prefer-coding-system 'utf-8)
;; (setq locale-coding-system 'utf-8)


;;(set-language-environment "UTF-8")

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(provide 'editor)
;;; editor.el ends here
