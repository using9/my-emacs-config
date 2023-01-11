(provide 'work-path)
(defun open_config_file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-editor.el"))

(defun explorer_it()
  (interactive)
  (shell-command "explorer ."))

(defun cc()
  "compile c files"
  (interactive)
  (shell-command (concat "gcc.exe " (buffer-file-name) " -o"
			 (file-name-base (buffer-file-name))
			 ".exe" " -I" "c:/dev-cpp/include"
			 " -L" "c:/dev-cpp/lib"
			 )
		 )
  )

(defun cpp()
  "compile cpp file"
  (interactive)
  (shell-command (concat "g++.exe " (buffer-file-name) " -o "
			 (file-name-base (buffer-file-name))
			 ".exe -g3 -I" "C:/Dev-Cpp/include/c++"
			 " -I " "C:/Dev-Cpp/include/c++/mingw32"
			 " -I "  "C:/Dev-Cpp/include/c++/backward"
			 " -I " "C:/Dev-Cpp/include"
			 " -L " "C:/Dev-Cpp/lib"
			 )
		 )

  )



(defun open-text-directory()
  "open text dir"
  (interactive)
  (dired '( "e:\\text\\")))

(defun jianxi()
  "open jianxi excel file."
  (interactive)
  (call-process-shell-command "explorer E:\\text\\��Ӧ��\\�߼����\\��϶��.xls"))

(defun gengkai()
  "open jianxi excel file."
  (interactive)
  (call-process-shell-command "explorer E:\\text\\�����ͷ.xls"))


(defun nianjia_daoxiu()
  "open nianjia_daoxiu org file."
  (interactive)
  (find-file "~/��ٵ���.org"))



(defun changqi-gongkuang()
  "print some thing"
  (interactive)
  (message changqi_message)
  )

(defun shangba()
  "ɽ��������һ���ϰΣ�A����������Ϊ�ܵ�һ��ĸ�����B�಻�䡣"
  (interactive)
  (message shangba_message)
  )


(defun luoshuanbiao()
  "show luosuan information picture."
  (interactive)
  (call-process-shell-command "explorer e:\\text\\��˨����.png"))

(defun silingtu_str()
  "open silingtu 2D fine information string."
  (interactive)
  (call-process-shell-command "explorer e:\\text\\silingtu_string.dwg"))

(defun luxiang()
  "open screen2Exe"
  (interactive)
  (call-process-shell-command "E:\\soft\\SCREEN2EXE\\screen2exe.exe")
  )

(defun lc()
  "open text dir"
  (interactive)
  (dired '( "c:\\dhcad\\dharch_lc")))

;; (defun huibao()
;;   "open cc directory"
;;   (interactive)
;;   (call-process-shell-command "explorer E:\\cm_ͳ��\\cc\\"))

(defun javac-make()
  " "
  (interactive)
  (shell-command (concat "javac " buffer-file-name)))

(defun java-make()
  " "
  (interactive)
  (shell-command (concat "java " (substring (buffer-name) 0 -5))))


(defun js_test ()
  "use firefox start test file."
  (interactive)
  ;;;(async-shell-command  (expand-file-name (buffer-name))))
  (call-process-shell-command (expand-file-name (buffer-name)) nil 0))

(defun myl_test()
  (interactive)
  (call-process "C:/DHCAD/DHARCH_lC/PCZR_MYL.exe" nil 0))

(defun chutu_myl()
  (interactive)
  (shell-command "C:/DHCAD/DHARCH_lC/PCZR_MYL_chutu.exe") )


(defun hz_test()
   (interactive)
  (call-process "C:/DHCADyes/DHARCH_lC/dhhz.exe" nil 0))

(defun myl()
  (interactive)
  (call-process "C:/DHCAD/DHARCH_LC/PCZR_MYL.exe" nil 0))
(defun hz()
  (interactive)
  (call-process "c:/dhcad/dharch_LC/dhhz.exe" nil 0))

(defun atk()
  (interactive)
  (call-process "E:/soft/AutoHotKey/AutoHotKey ���İ�/AutoHotkey.exe" nil 0))

(defun jietu()
  (interactive)
  (call-process "E:/soft/hyperSnap/hprsnap7.exe" nil 0))

(defun zhuatu()
  (interactive)
  (call-process "E:/soft/hyperSnap/hprsnap7.exe" nil 0))

(defun dhdm()
  (interactive)
  (call-process "E:/wxh/CLIENTs/DHDM2ClientProject.exe" nil 0))

(defun cad09()
  (interactive)
  (call-process "C:/Program Files (x86)/AutoCAD 2009/acad.exe" nil 0))
(defun cad()
  (interactive)
  (call-process "C:/Program Files/Autodesk/AutoCAD 2017/acad.exe" nil 0))

(defun jiancha()
  (interactive)
  (find-file "~/jiancha.org"))


(defun notes-view()
(interactive)
(find-file "d:/home/.emacs.d/notes")
(end-of-buffer)
)
(defun notes ()
  (interactive)
      (find-file "d:/home/.emacs.d/notes")
      (end-of-buffer)
      )

(defun insert-date-full ()
  " insert current date "
  (interactive)
  (insert (format-time-string "%Y-%m-%d %T")))

(defun date-insert ()
  " insert current date "
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun ruby_insert_end ()
  " ruby mode insert end "
  (interactive)
  (insert "end")
  (ruby-indent-line))

(defun nchz()
  " open nc version dhhz"
  (interactive)
  (call-process "C:/DHCAD/DHARCH_NC/dhhz.exe" nil 0))

(defun lchz()
  " open lc version dhhz"
  (interactive)
  (call-process "C:/DHCAD/DHARCH_LC/dhhz.exe" nil 0))

(defun open-test-dir()
  "open test directory."
  (interactive)
  (async-shell-command "explorer  D:\\ProJect\\������֤����\\����\\"))

(defun test-program-dir()
  "open test directory."
  (interactive)
  (async-shell-command "explorer  c:\\dhcadyes\\dharch_lc"))

(defun open-lc-project-dir()
  "open lc project directory."
  (interactive)
  (async-shell-command "explorer C:\\DHCAD\\DHARCH_LC_2\\"))

(defun open-work-project-dir()
  "open work project dir."
  (interactive)
  (async-shell-command "explorer d:\\project\\benbu\\"))

(defun desktop()
  "open work project dir."
  (interactive)
  (async-shell-command "explorer C:\\Users\\wxh.BJDH.000\\Desktop"))

(defun desk-dired()
  "dired open desktop"
  (interactive)
  (dired "c:/Users/wxh.bjdh.000/desktop"))


(defun DH_dir ()
  "Open DH dir"
  (interactive)
  (async-shell-command "explorer \\200.200.101.62\�������"))
(defun p2020()
  "open project dir"
  (interactive)
  (async-shell-command "explorer d:\\2020"))


(defun huibao()
  "work huibao"
  (interactive)
  (find-file "~/�㱨.org")
  (end-of-buffer)
  (newline)
  (insert "______________________________________")
  (newline)
  (date-insert)
  (newline)
  (newline)
  (insert "--------------------------------------")
  (newline)
  (previous-line 2)
  )

(defun luoshuan ()
  "�ؽ���˨�����M24��M30��M36��M42��M48��M56��M64��
M72��M80��M90��M100ѡ�á�"
  (interactive)
  (message dijiaoluoshuan_message)
  )

(defun hezaixishu()
  "��װ�����ǽ��£���������ϵ��1.15������1.1; ������ʩ�����ͳ��쳤;��������ϵ������1.1������1.2"
  (interactive)
  (message "��װ�����ǽ��£���������ϵ��1.15������1.1; ������ʩ�����ͳ��쳤;��������ϵ������1.1������1.2")
  )

(defun jiangwen()
  "�������ֱ�ȷ����������"
  (interactive)
  (message jiemianji_message)
  )

(defun tmyl() 
  "test myl bug"
  (interactive)
  (switch-to-buffer (format-time-string "%Y_%m_%d--%H_%M_MYL"))
  (text-mode)
  (insert "myl")  
  )

(defun thz() 
  "test hz bug"
  (interactive)
  (switch-to-buffer (format-time-string "%Y_%m_%d--%H_%M_hz"))
  (text-mode)
  (insert "hz")  
  )

(defun tggg()
   "test ggg  bug"
  (interactive)
  (switch-to-buffer (format-time-string "%Y_%m_%d--%H_%M_GGG"))
  (text-mode)
  (insert "ggg")  
  )

(defun tsng()
   "test sng  bug"
  (interactive)
  (switch-to-buffer (format-time-string "%Y_%m_%d--%H_%M_SNG"))
  (text-mode)
  (insert "sng")  
  )

;; (defun make-work-dir ()
;;   "work directory "
;;   (interactive)
;;   (let base '(concat "D:\\ProJect\\2019\\" (format-time-string "%Y_%m_%d--%H_%M")))
;;   (mkdir 'base)
;;   )

;; (provide 'work-path)

;; (make-directory (format-time-string "%Y_%m_%d--%H_%M") "d:/ProJect/2019")
;;;


