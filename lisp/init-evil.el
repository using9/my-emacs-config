(add-to-list 'load-path "~/.emacs.d/elpa/evil-master")
(add-to-list 'load-path "~/.emacs.d/elpa/goto-chg")
(require 'goto-chg)
(require 'evil)
(evil-mode 1)
(setq evil-shift-width 0)
(setq evil-move-cursor-back t)
(define-key evil-normal-state-map "\C-q" 'evil-visual-block)
(provide 'init-evil)


