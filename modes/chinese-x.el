;; chinese-x
(require 'cal-china-x)
(cal-china-x-setup)

(setq mark-holidays-in-calendar t
      cal-china-x-important-holidays cal-china-x-chinese-holidays
      cal-china-x-general-holidays '((holiday-lunar 1 15 "Ԫ����")
                                     (holiday-lunar 7 7 "��Ϧ��")
                                     (holiday-fixed 3 8 "��Ů��")
                                     (holiday-fixed 3 12 "ֲ����")
                                     (holiday-fixed 5 1 "�Ͷ���")
                                     (holiday-fixed 6 1 "��ͯ��")
                                     (holiday-fixed 9 10 "��ʦ��")
                                     (holiday-fixed 10 1 "�����")
                                     )
      holiday-other-holidays '((holiday-fixed 2 14 "���˽�")
                               (holiday-fixed 4 1 "���˽�")
                               (holiday-fixed 12 25 "ʥ����")
                               (holiday-float 5 0 2 "ĸ�׽�")
                               (holiday-float 6 0 3 "���׽�")
                               (holiday-float 11 4 4 "�ж���"))
      ;; calendar-holidays (append cal-china-x-important-holidays
      ;;                           cal-china-x-general-holidays
      ;;                           holiday-other-holidays)))
      )
;;calendar
(setq calendar-chinese-all-holidays-flag t
      calendar-chinese-time-zone t)

(provide 'chinese-x)
;; ends chinese-x
