;;; init-pyim.el
;;; Commentary:
;;; Code:
;;;

;; address https://github.com/tumashu/pyim
;; https://github.com/tumashu/pyim-basedict
;; address https://github.com/mattiase/xr
;; address https://github.com/jwiegley/emacs-async

(add-to-list 'load-path "~/.emacs.d/elpa/pyim")
(add-to-list 'load-path "~/.emacs.d/elpa/pyim-basedict")
(add-to-list 'load-path "~/.emacs.d/elpa/async")
(add-to-list 'load-path "~/.emacs.d/elpa/xr")
(require 'pyim)
(require 'pyim-basedict)
(require 'pyim-cregexp-utils)

(setq default-input-method "pyim")
(pyim-default-scheme 'quanpin)
(pyim-isearch-mode 1)
(setq pyim-page-length 5)
(pyim-basedict-enable)

(setq pyim-page-tooltip 'minibuffer)
(setq pyim-page-style 'one-line)

(global-set-key (kbd "C-\\") 'toggle-input-method)

(setq-default pyim-punctuation-translate-p '(auto))   
(setq pyim-indicator-list (list #'pyim-indicator-with-cursor-color #'pyim-indicator-with-modeline))
(define-key pyim-mode-map "." 'pyim-page-next-page)
(define-key pyim-mode-map "," 'pyim-page-previous-page)

(defun my-orderless-regexp (orig_func component)
  (let ((result (funcall orig_func component)))
    (pyim-cregexp-build result)))

(setq debug-on-error t)
;;(pyim-isearch-mode 1)
(global-set-key (kbd "M-i") 'pyim-convert-string-at-point)

(defun my-orderless-regexp (orig-func component)
  (let ((result (funcall orig-func component)))
    (pyim-cregexp-build result)))

(advice-add 'orderless-regexp :around #'my-orderless-regexp)

(provide 'init-pyim)
