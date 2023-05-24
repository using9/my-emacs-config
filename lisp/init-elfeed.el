;;(require 'elfeed)
(require 'elfeed-autoloads)
(setq-default elfeed-search-filter "@1-day-ago +unread ")
(setq elfeed-show-mode-hook
      (lambda ()	

		(setq elfeed-show-entry-switch #'switch-to-buffer)))


(setq elfeed-feeds
      '("https://xueqiu.com/hots/topic/rss" 
		"https://dig.chouti.com/feed.xml"
                "https://plink.anyfeeder.com/thepaper"
		"https://plink.anyfeeder.com/idaily/today"
		"https://plink.anyfeeder.com/bjnews"
		"https://plink.anyfeeder.com/jiemian/news"
		"https://plink.anyfeeder.com/netease/today"
		"https://plink.anyfeeder.com/infzm/news"
		"http://www.people.com.cn/rss/world.xml"
		"http://news.hexun.com/rss/"
	;;	"http://app.xinhua08.com/rss.php"
		"https://www.zhihu.com/rss"
;;		"https://feedx.best/rss/jiemian.xml"
		))

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

;;(setq-local line-spacing 0.8) 
;;(elfeed-set-max-connections 32)

(custom-set-faces
 '(elfeed-search-date-face
   ((t :foreground "#f0f"
       :weight extra-bold
       :underline t))))

(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 70                                ; Fold text to 70 columns
 eww-search-prefix "https://www.baidu.com/?q=")    

(provide 'init-elfeed)
