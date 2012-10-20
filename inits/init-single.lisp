(in-package :stumpwm)


;;; inits ファイル読み込み
(setf inits-files (directory (concat inits-dir "??_*.lisp")))
(mapc 'load inits-files)

;;; シングルディスプレイ独自設定
;;; モードライン読み込み (起動後1度のみ)
(defvar *complete-load-mode-line* nil)
(unless *complete-load-mode-line*
  (mode-line)
  (setf *complete-load-mode-line* t))


(provide 'init)