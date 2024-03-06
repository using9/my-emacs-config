;;(add-auto-mode 'markdown-mode "\\.md\\.html\\'")
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode))



(provide 'markdown-config)
