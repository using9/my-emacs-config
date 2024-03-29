(add-hook 'after-init-hook 'which-key-mode)
(with-eval-after-load 'which-key
  (setq which-key-add-column-padding 1
        which-key-allow-imprecise-window-fit nil
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-separator " -> "
        which-key-show-early-on-C-h t
        which-key-side-window-location 'bottom
        which-key-side-window-max-height 0.25
        which-key-side-window-slot -10
        which-key-sort-order #'which-key-key-order
        which-key-sort-uppercase-first nil
        )
  )
(provide 'which-key_conf)
