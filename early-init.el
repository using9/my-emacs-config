(setq-default
 default-frame-alist
 '(
   ;; (fullscreen . maximized)             ;; Maximize the window by default
   (undecorated . t)                    ;; Remove extraneous X decorations
   (left-fringe . 5)                    ;; Thin left fringe;
   (right-fringe . 5)                   ;; Thin right fringe
   (right-divider-width . 1)            ;; Thin vertical window divider
   (width . 85)
   (height . 40)
   (top . 40)
   (left . 15)
   (horizontal-scroll-bars . nil)       ;; No horizontal scroll-bars
   (vertical-scroll-bars . nil)         ;; No vertical scroll-bars
   (tool-bar-lines . 0)                 ;; No tool bar
   (menu-bar-lines . 0)                 ;;  No menu bar
   )
 )
(setq byte-compile-warnings '( cl-functions))

(modify-frame-parameters nil '((sticky . t) (width . 100) (height . 40))) 
(provide 'early-init)
