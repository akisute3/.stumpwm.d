(in-package :stumpwm)

;;; フォント
(set-font "-misc-*-*-*-*-*-18-*-*-*-iso10646-1")

;;; マウス
(setf *mouse-focus-policy* :click)

;;; ウィンドウ
(setf *message-window-gravity* :center)
(setf *input-window-gravity* :center)

;;; 不要ファイル削除
(run-shell-command "rm ~/.xsession-errors")

;;; リサイズ
;;; (iresize.lisp の export を *resize-increment* から
;;;  set-resize-increment に変更してインストールする必要あり)
(set-resize-increment 192)


(provide 'misc)