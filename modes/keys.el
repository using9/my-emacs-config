;; define custom keys
(global-set-key [f3] 'ibuffer)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f5] 'revert-buffer)
(global-set-key [f7] 'delete-other-frames)
(global-set-key [f8] '(dired-jump  other-frame "/" ))
;;'(concat "d:\\" (format-time-string "%Y\\%m%d"))))
(global-set-key [f11] 'toggle-frame-fullscreen)
(global-set-key [f12] 'yank)
(global-set-key (kbd "C-x r v") 'list-registers)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)
(global-set-key (kbd "C-x u") 'vundo)


;; avy
  (setq avy-background t
        avy-style 'pre
        avy-all-windows nil
        avy-all-windows-alt t)
  (defun my-avy--regex-candidates (fun regex &optional beg end pred group)
    (let ((regex (pyim-cregexp-build regex)))
      (funcall fun regex beg end pred group)))
  (advice-add 'avy--regex-candidates :around #'my-avy--regex-candidates)
  (global-set-key (kbd "C-;") 'avy-goto-char-timer)
  (global-set-key (kbd "M-g l") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)

;
;;; dired keys
(with-eval-after-load 'dired
(define-key dired-mode-map "o" 'dired-open-files)
(define-key dired-mode-map "h" 'dired-up-directory)
(define-key dired-mode-map "j" 'dired-next-line)
(define-key dired-mode-map "k" 'dired-previous-line)
(define-key dired-mode-map "l" 'dired-single-buffer)
(define-key ctl-x-map "\C-j" 'dired-jump)
(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)
)

;; swith-window-keys
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)
(global-set-key (kbd "C-x 1") 'toggle-delete-other-windows)
(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer2))
(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer3))
(global-set-key (kbd "C-x 4 0") 'switch-window-then-kill-buffer)
(global-set-key (kbd "C-x 4 C-f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 C-o") 'switch-window-then-display-buffer)
(global-set-key (kbd "C-x 4 d") 'switch-window-then-dired)
(global-set-key (kbd "C-x 4 f") 'switch-window-then-find-file)
(global-set-key (kbd "C-x 4 m") 'switch-window-then-compose-mail)
(global-set-key (kbd "C-x 4 r") 'switch-window-then-find-file-read-only)
(global-set-key (kbd "C-x o") 'switch-window)

;;; esc always quits
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'keyboard-quit)
;;(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

;; corfu
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "SPC")  'corfu-insert-separator)
  (define-key corfu-map (kbd "TAB") 'corfu-next)
  (define-key corfu-map (kbd "S-TAB") 'corfu-previous)
  (define-key corfu-map (kbd "ESC") 'corfu-quit)
  )
;; consult
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-M-/") 'dabbrev-expand)
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window)
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)
(global-set-key (kbd "C-x r b") 'consult-bookmark)
(global-set-key (kbd "C-x t b") 'consult-buffer-other-tab)
(global-set-key (kbd "M-/") 'dabbrev-completion)
(global-set-key (kbd "M-e") 'consult-isearch-history) ;; isearch-edit-string
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s g") 'consult-grep)
;;(global-set-key (kbd "M-s l") 'consult-line)                  ;; needed by consult-line to detect isearch
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-y")  'consult-yank-pop)
(global-set-key (kbd "M-g f")  'consult-flymake)
(global-set-key (kbd "M-g i")  'consult-imenu)
(global-set-key (kbd "M-g I")  'consult-imenu-multi)
(global-set-key [f2] 'consult-recent-file)
;;(global-set-key [remap isearch-forward] 'consult-focus-lines)
(global-set-key [remap goto-line] 'consult-goto-line)
(global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
(global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
(global-set-key [remap switch-to-buffer] 'consult-buffer)

;; custom move-text keys
(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)

;; multi-cursor
(with-eval-after-load 'multiple-cursors
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-M-<") 'mc/skip-to-previous-like-this)
  (global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)
  (global-set-key (kbd "C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  )
;; evil
(with-eval-after-load 'evil
  (define-key evil-normal-state-map "\C-q" 'evil-visual-block)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  )

;; pyim
(global-set-key (kbd "C-\\") 'toggle-input-method)
(global-set-key (kbd "M-i") 'pyim-convert-string-at-point)

;; flymake
(global-set-key (kbd "M-n") #'flymake-goto-next-error)
(global-set-key (kbd "M-p") #'flymake-goto-prev-error)
(global-set-key (kbd "C-c f") #'flymake-show-buffer-diagnostics)
;;;

;; embark
(with-eval-after-load 'embark
  (global-set-key (kbd "C-.") 'embark-act)
  (global-set-key (kbd  "C-h b")  ' embark-bindings)
  (global-set-key (kbd   "C-h B")  ' embark-bindings-at-point)
  (global-set-key (kbd   "M-n")  ' embark-next-symbol)
  (global-set-key (kbd   "M-p")  ' embark-previous-symbol)
  )

(provide 'keys)
;;; keys ends
