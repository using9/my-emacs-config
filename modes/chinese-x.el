;; chinese-x
(require 'cal-china-x)

(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq cal-china-x-general-holidays '((holiday-lunar 1 15 "ÔªÏü½Ú")))
(setq calendar-holidays
      (append cal-china-x-important-holidays
              cal-china-x-general-holidays
              ))

;;calendar
(setq calendar-chinese-all-holidays-flag t
      calendar-chinese-time-zone t)

(provide 'chinese-x)
;; ends chinese-x
