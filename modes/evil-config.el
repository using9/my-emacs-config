(with-eval-after-load 'evil
  (setq evil-move-cursor-back t
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-want-keybinding nil
        evil-shift-width 0
        evil-emacs-state-cursor '("#649bce" box)
        evil-normal-state-cursor '("#ebcb8b" box)
        evil-operator-state-cursor '("#ebcb8b" hollow)
        evil-visual-state-cursor '("#677691" box)
        evil-insert-state-cursor '("#eb998b" (bar . 2))
        evil-replace-state-cursor '("#eb998b" hbar)
        evil-motion-state-cursor '("#ad8bed" box)
        )
  (customize-set-variable 'evil-undo-system 'vundo)
  (customize-set-variable 'evil-want-C-i-jump t)
  (customize-set-variable 'evil-want-Y-yank-to-eol t)
  (customize-set-variable 'evil-want-fine-undo t)

)

      )





(provide 'evil-config)
