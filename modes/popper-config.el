(setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$"
        "\\*Async Shell Command\\*"
        help-mode
        compilation-mode))
(global-set-key (kbd "C-`") 'popper-toggle)
(global-set-key (kbd "M-`") 'popper-cycle)
(global-set-key (kbd "C-M-`") 'popper-toggle-type)
(popper-mode +1)

;; For echo-area hints
;;(require 'popper-echo)
(popper-echo-mode +1)

(setq popper-reference-buffers
      '("\\*Messages\\*"
        "Output\\*$"
        help-mode
        compilation-mode))

(provide 'popper-config)
;; end; popper-config.el end here.
