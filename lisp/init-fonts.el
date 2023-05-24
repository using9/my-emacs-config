(set-face-attribute 'default nil :font  (font-spec :family "新宋体" :size 16 :powerline-scale 0.8))

(setq eww-mode-hook
      (lambda ()
    
			(set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :family "新宋体" :size 14 :powerline-scale 0.8))
		  
		(setq line-spacing 0.5)
		))


(setq org-mode-hook
      (lambda ()
    
			(set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :family "新宋体" :size 14 :powerline-scale 0.8))
		  
		(setq line-spacing 0.5)
		))

(setq org-mode-hook
      (lambda ()
		(set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :family "新宋体" :size 14 :powerline-scale 0.8))
		(setq line-spacing 0.5)
		))

(provide 'init-fonts)
;;; init-fonts.el ends here
