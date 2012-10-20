(in-package :stumpwm)


;;; swankサーバ起動 (起動後1度のみ)
(ql:quickload "swank")
(defvar *complete-load-swank* nil)
(unless *complete-load-swank*
  (swank:create-server :port 4005)
  (setf *complete-load-swank* t))


(require 'swank)