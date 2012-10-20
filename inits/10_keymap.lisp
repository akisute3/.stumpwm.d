(in-package :stumpwm)

;;; input で Emacs キーバインド
(define-key *input-map* (kbd "C-i") 'input-complete-forward)
(define-key *input-map* (kbd "C-j") 'input-submit)
(define-key *input-map* (kbd "C-h") 'input-delete-backward-char)
(define-key *input-map* (kbd "M-h") 'input-backward-kill-word)

;;; スクリーン変更
(define-key *root-map* (kbd "C-p") "move-focus up")
(define-key *root-map* (kbd "C-n") "move-focus down")
(define-key *root-map* (kbd "C-b") "move-focus left")
(define-key *root-map* (kbd "C-f") "move-focus right")
(define-key *root-map* (kbd "C-P") "move-window up")
(define-key *root-map* (kbd "C-N") "move-window down")
(define-key *root-map* (kbd "C-B") "move-window left")
(define-key *root-map* (kbd "C-F") "move-window right")

;;; Alt-TAB
(define-key *top-map* (kbd "M-TAB") "fnext")


(provide 'keymap)