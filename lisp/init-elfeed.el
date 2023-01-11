(require 'elfeed)
;;(global-set-key (kbd "C-x w") 'elfeed)
(setq-default elfeed-search-filter "@1-day-ago +unread ")
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "1 days ago"
                              :remove 'unread))

(setq elfeed-feeds
      '("https://xueqiu.com/hots/topic/rss" 
		"https://dig.chouti.com/feed.xml"
        "https://plink.anyfeeder.com/thepaper"
		"https://plink.anyfeeder.com/idaily/today"
		"https://plink.anyfeeder.com/bjnews"
		"https://plink.anyfeeder.com/jiemian/news"
		"https://plink.anyfeeder.com/netease/today"
		"https://plink.anyfeeder.com/infzm/news"
		"http://www.people.com.cn/rss/politics.xml"
		"http://www.people.com.cn/rss/world.xml"
		"https://www.chinanews.com.cn/rss/scroll-news.xml"
		"http://news.hexun.com/rss/"
		"http://app.xinhua08.com/rss.php"
		"https://www.zhihu.com/rss"
		))

(setq-local line-spacing 0.8) 

(with-eval-after-load 'elfeed
  (setq elfeed-show-entry-switch #'display-buffer
		elfeed-search-date-format '("%d" 5 :left)
		elfeed-search-title-max-width 100
        elfeed-search-trailing-width 2
		elfeed-show-entry-author 0
		url-queue-timeout 30
		shr-max-image-proportion 0.5
		elfeed-db-directory "~/.elfeed"
		elfeed-enclosure-default-dir (expand-file-name "~/DownLoads")
		
		)

  )


  ;; (defun hrs/custom-elfeed-sort (a b)
  ;;   (let* ((a-tags (format "%s" (elfeed-entry-tags a)))
  ;;          (b-tags (format "%s" (elfeed-entry-tags b)))
  ;;          (a-title (elfeed-feed-title (elfeed-entry-feed a)))
  ;;          (b-title (elfeed-feed-title (elfeed-entry-feed b))))
  ;;     (if (string= a-tags b-tags)
  ;;         (if (string= a-title b-title)
  ;;             (< (elfeed-entry-date b) (elfeed-entry-date a))
  ;;           (string< b-title a-title))
  ;;       (string< a-tags b-tags))))
  ;; (setf elfeed-search-sort-function #'hrs/custom-elfeed-sort)

(elfeed-set-max-connections 32)



;; (with-elfeed-db-visit (entry _)
;;   (setf (elfeed-entry-content entry) nil))

;; (elfeed-db-gc)  ;; garbage collect everything

;; (add-hook 'elfeed-new-entry-hook
;;           (lambda (entry) (setf (elfeed-entry-content entry) nil)))



(custom-set-faces
 '(elfeed-search-date-face
   ((t :foreground "#f0f"
       :weight extra-bold
       :underline t))))


(provide 'init-elfeed)
