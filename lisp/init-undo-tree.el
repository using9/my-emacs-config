
(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree")
(require 'undo-tree)
(with-eval-after-load 'undo-tree
  (unless (file-directory-p "~/.emacs.d/undo-tree")
	(make-directory "~/.emacs.d/undo-tree"))
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist `(("." . ,(concat user-emacs-directory "undo-tree")))
		undo-tree-enable-undo-in-region nil
		undo-tree-visualizer-diff t
		undo-tree-visualizer-timestamps t
		undo-limit 6710886400
		undo-strong-limit 100663296
		undo-outer-limit 1006632960)
  )




  (provide 'init-undo-tree)
  ;;
