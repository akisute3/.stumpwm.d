(in-package :stumpwm)

;;; 変数設定
(setf *mode-line-border-width* 1)
(setf *mode-line-pad-x* 6)
(setf *mode-line-pad-y* 0)
(setf *mode-line-background-color* "black")
(setf *mode-line-foreground-color* "wheat")
(setf *mode-line-border-color* "dark grey")
(setf *mode-line-timeout* 1.5)

;;; ハイライトのために mode-line.lisp の fm-twindow-list を上書き
(defun fmt-window-list (ml)
  "Using *window-format*, return a 1 line list of the windows, space seperated."
  (format nil "~{~a~^ ~}"
          (mapcar (lambda (w)
                    (let ((str (format-expand *window-formatters* *window-format* w)))
                      (if (eq w (current-window))
                          (fmt-highlight str)
                          str)))
                  (sort-windows (mode-line-current-group ml)))))

;;; mode-line 用のモジュール利用
(set-contrib-dir "~/.stumpwm.d/contrib")
(mapcar #'load-module '("cpu" "mem" "disk" "net"))

;;; モードラインフォーマット
(setf *window-format* "%m%n%s%20c")
(setf *group-format* "%n%s%t")
(setf *disk-usage-paths* '("/"))
(setf *disk-modeline-fmt* "DISK: %u/%s")
(setf *screen-mode-line-format*
      (list " "
            '(:eval (run-shell-command
                     "LANG=c; date '+%m/%d(%a) %H:%M'|tr -d [:cntrl:]" t))
            " | %c| %M| %D| %l| "
            "%w | %g"))


(provide 'mode-line)