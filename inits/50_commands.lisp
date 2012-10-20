(in-package :stumpwm)

;;; ロック
(defcommand lock-screen () ()
  "Lock and turn off my screen."
  (run-shell-command "gnome-screensaver-command --lock && xset dpms force standby"))
(define-key *root-map* (kbd "l") "lock-screen")

;;; Firefox
(defcommand firefox () ()
  "Start Firefox or switch to it, if it is already running."
  (run-or-raise "firefox" '(:class "Firefox")))
(define-key *root-map* (kbd "f") "firefox")
(define-key *root-map* (kbd "F") "fselect")

;;; Chrome
(defcommand chrome () ()
  "Start Chrome or switch to it, if it is already running."
  (run-or-raise "chromium-browser" '(:class "Chromium-browser")))
(define-key *root-map* (kbd "c") "chrome")

;;; Terminal
(defcommand open-terminal () ()
  "Start Gnome-terminal or switch to it, if it is already running."
  (run-or-raise "gnome-terminal" '(:class "Gnome-terminal")))
(define-key *root-map* (kbd "t") "open-terminal")
(define-key *root-map* (kbd "T") "send-escape")

;;; Launcher
(defcommand dmenu () ()
  "Start launcher 'dmenu'."
  (run-shell-command "dmenu_run -hist ~/.dmenu.history -b"))
(define-key *root-map* (kbd ".") "dmenu")


;; swap 2 windows
(defun shift-windows-forward (frames win)
  (when frames
    (let ((frame (car frames)))
      (shift-windows-forward (cdr frames)
                             (frame-window frame))
      (when win
        (pull-window win frame)))))

(defcommand rotate-windows () ()
            (let* ((frames (group-frames (current-group)))
                   (win (frame-window (car (last frames)))))
              (shift-windows-forward frames win)))

(define-key *root-map* (kbd "~") "rotate-windows")


;; toggle between vertical split and horizontal split
(defcommand toggle-split () ()
            (let* ((group (current-group))
                   (cur-frame (tile-group-current-frame group))
                   (frames (group-frames group)))
              (if (eq (length frames) 2)
                  (progn (if (or (neighbour :left cur-frame frames)
                                 (neighbour :right cur-frame frames))
                             (progn
                               (only)
                               (vsplit))
                             (progn
                               (only)
                               (hsplit))))
                  (message "Works only with 2 frames"))))

(define-key *root-map* (kbd "|") "toggle-split")


(provide 'commands)