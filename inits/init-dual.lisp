(in-package :stumpwm)


;;; inits ファイル読み込み
(setf inits-files (directory (concat inits-dir "??_*.lisp")))
(mapc 'load inits-files)

;;; デュアルディスプレイ独自設定
;;; モードライン読み込み (起動後1度のみ)
(defvar *complete-load-mode-line* nil)
(unless *complete-load-mode-line*
  (mode-line)
  (move-focus :left)
  (run-shell-command "stalonetray")
  (run-shell-command "nm-applet")
  (run-shell-command "dropbox start")
  (run-shell-command "gnome-sound-applet")
  (run-shell-command "indicator-keylock")
  (run-shell-command "indicator-multiload")
  (run-shell-command "classicmenu-indicator")
  (setf *complete-load-mode-line* t))


(provide 'init)