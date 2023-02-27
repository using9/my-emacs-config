
;;; init-complete.el --- Config for minibuffer completion
;;; Commentary:
;;; Code:
;;; 
;; =============== other requires ===========================================
  ;;;; consult require it
(add-to-list 'load-path "~/.emacs.d/elpa/compat")
;;; ============== other require ends.=======================================

;;; =========================================================================
;; orderless start  无序
;;; address: git://github.com/oantolin/orderless
(add-to-list 'load-path "~/.emacs.d/elpa/orderless")
(require 'orderless)
(setq    completion-styles '(orderless)
		 completion-category-defaults nil
		 completion-category-overrides '((file (styles basic partial-completion))))
;;; orderless ends
;;; =========================================================================

;;; =========================================================================
;; vertico start  minibuffer 垂直显示补全
;;; address: git://github.com/minad/vertico
(add-to-list 'load-path "~/.emacs.d/elpa/vertico")
(add-to-list 'load-path "~/.emacs.d/elpa/vertico/extensions")
(require 'vertico)
(vertico-mode)
(with-eval-after-load 'vertico
  (define-key vertico-map "?" #'minibuffer-completion-help)
  (define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
  (define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)
  (setq completion-in-region-function
		(lambda (&rest args)
          (apply (if vertico-mode
					 #'consult-completion-in-region
                   #'completion--in-region)
				 args)))
  )
;;; vertico ends
;;; =========================================================================


;;; =========================================================================
;; marginalia  注释用 minibuffer
;;; address: git://github.com/minad/marginalia
(add-to-list 'load-path "~/.emacs.d/elpa/marginalia")
(require 'marginalia)
(marginalia-mode)
(with-eval-after-load 'marginalia
  (add-to-list 'marginalia-prompt-categories '("\\<face\\>" . face))
  (add-to-list 'marginalia-prompt-categories '("tab by name" . tab))
  )
;;; =========================================================================

;;; =========================================================================
;;;  cape
;;; address git://github.com/minad/cape
(add-to-list 'load-path "~/.emacs.d/elpa/cape")
(require 'cape)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-line)
(defalias 'cape-dabbrev+file
  (cape-super-capf #'cape-dabbrev #'cape-file))
(setq-local completion-at-point-functions (list #'cape-dabbrev+file))

;;===========================corfu =====================================
;;; address git://github.com/minad/corfu
(add-to-list 'load-path "~/.emacs.d/elpa/corfu")
(require 'corfu)
(global-corfu-mode)
(setq corfu-cycle t
      corfu-preview-current t
      corfu-preselect-first nil
      completion-cycle-threshold 4
      tab-always-indent 'complete
      ;;corfu-auto t
      corfu-auto-delay 0
      corfu-auto-prefix 0
      corfu-quit-no-match 'separator ;; or t
      corfu-excluded-modes '(eshell-mode lisp-mode))
(define-key corfu-map (kbd "TAB") 'corfu-next)
(define-key corfu-map (kbd "S-TAB") 'corfu-previous)
(define-key corfu-map (kbd "SPC")  'corfu-insert-separator)
(global-set-key (kbd "M-/") 'dabbrev-completion)
(global-set-key (kbd "C-M-/") 'dabbrev-expand)
(setq  dabbrev-ignored-buffer-regexps '("\\.\\(?:pdf\\|jpe?g\\|png\\)\\'"))

(defun corfu-enable-in-minibuffer ()
  "Enable Corfu in the minibuffer if `completion-at-point' is bound."
  (when (where-is-internal #'completion-at-point (list (current-local-map)))
    ;; (setq-local corfu-auto nil) Enable/disable auto completion
    (corfu-mode 1)))
(add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)

(defun corfu-enable-always-in-minibuffer ()
  "Enable Corfu in the minibuffer if Vertico/Mct are not active."
  (unless (or (bound-and-true-p mct--active)
			  (bound-and-true-p vertico--input))
    ;; (setq-local corfu-auto nil) Enable/disable auto completion
    (corfu-mode 1)))
(add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)

;; (add-hook 'eshell-mode-hook
;; 		  (lambda ()
;; 			(setq-local corfu-auto t)
;; 			(corfu-mode)))
;;; ============================ corfe end===================================

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)
;;============================ consult start =============================

;; consult
;;; address: git://github.com/minad/consult
(add-to-list 'load-path "~/.emacs.d/elpa/consult")
(require 'consult)

(global-set-key [f2] 'consult-recent-file)
(global-set-key [remap switch-to-buffer] 'consult-buffer)
(global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
(global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
(global-set-key [remap goto-line] 'consult-goto-line)
(global-set-key (kbd "C-x r b") 'consult-bookmark)
(global-set-key (kbd "M-y")  'consult-yank-pop)
(global-set-key (kbd "M-g g") 'consult-goto-line)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-e") 'consult-isearch-history)         ;; orig. isearch-edit-string
(global-set-key (kbd "M-s l") 'consult-line)                  ;; needed by consult-line to detect isearch
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window)
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)

(add-hook 'completion-list-mode 'consult-preview-at-point-mode)

;; Optionally configure the register formatting. This improves the register
;; preview for `consult-register', `consult-register-load',
;; `consult-register-store' and the Emacs built-ins.
(setq register-preview-delay 0.5
      register-preview-function #'consult-register-format)

;; Optionally tweak the register preview window.
;; This adds thin lines, sorting and hides the mode line of the window.
(advice-add #'register-preview :override #'consult-register-window)

;; Optionally replace `completing-read-multiple' with an enhanced version.
(advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)

;; Use Consult to select xref locations with preview
;; (setq xref-show-xrefs-function #'consult-xref
;;       xref-show-definitions-function #'consult-xref)

;; Configure other variables and modes in the :config section,
;; after lazily loading the package.


;; Optionally configure preview. The default value
;; is 'any, such that any key triggers the preview.
;; (setq consult-preview-key 'any)
;; (setq consult-preview-key (kbd "M-."))
;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
;; For some commands and buffer sources it is useful to configure the
;; :preview-key on a per-command basis using the `consult-customize' macro.
(consult-customize
 consult-theme :preview-key nil
 consult-buffer :preview-key (kbd "M-.")
 consult-ripgrep consult-git-grep consult-grep
 consult-bookmark consult-recent-file 
 consult--source-recent-file consult--source-project-recent-file consult--source-bookmark
 consult-line :prompt "Search: "
 :preview-key (list (kbd "<S-down>") (kbd "<S-up>"))
 ;; :preview-key '(:debounce 0.2 any)
 ;;:preview-key (kbd "M-."))
 )

(setq consult--source-bookmark
      (plist-put
       consult--source-bookmark :items
       (lambda ()
         (bookmark-maybe-load-default-file)
         (mapcar #'car
                 (seq-remove (lambda (x)
                               (eq #'bookmark-view-handler
                                   (alist-get 'handler (cdr x))))
                             bookmark-alist)))))

;; Optionally configure the narrowing key.
;; Both < and C-+ work reasonably well.
(setq consult-narrow-key "<"
      consult-line-numbers-widen t
      consult-async-min-input 2
      consult-async-refresh-delay  0.15
      consult-async-input-throttle 0.2
      consult-async-input-debounce 0.1
	  ) ;; (kbd "C-+")


(setq consult-project-root-function
      (lambda ()
        (when-let (project (project-current))
          (car (project-roots project)))))

(defun mode-buffer-exists-p (mode)
  (seq-some (lambda (buf)
              (provided-mode-derived-p
               (buffer-local-value 'major-mode buf)
               mode))
            (buffer-list)))

;;========================== consult ends ================================

(provide 'init-complete)
;;; init-complete.el ends here


