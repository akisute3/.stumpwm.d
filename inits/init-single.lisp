(in-package :stumpwm)


;;; inits ファイル読み込み
(setf inits-files (directory (concat inits-dir "??_*.lisp")))
(mapc 'load inits-files)

;;; シングルディスプレイ独自設定
;;; モードライン読み込み (起動後1度のみ)
(defvar *complete-load-mode-line* nil)
(unless *complete-load-mode-line*
  (run-shell-command "syndaemon -i 2 -d -t -k")
  (run-shell-command "stalonetray")
  (run-shell-command "nm-applet")
  (run-shell-command "dropbox start")
  (run-shell-command "gnome-sound-applet")
  (run-shell-command "indicator-multiload")
  (run-shell-command "classicmenu-indicator")
  (run-shell-command "~/compile/batterymon-clone/batterymon")
  (setf *complete-load-mode-line* t))


(provide 'init)
