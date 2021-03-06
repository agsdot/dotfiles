(require-package 'f)
(require-package 'undo-tree)
(require-package 'hungry-delete)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for various persistent files.")

(require 'f)
(after-load 'f
  (unless (f-exists? dotemacs-cache-directory)
    (f-mkdir dotemacs-cache-directory)))

;; Dont display logo at startup
(setq inhibit-startup-message t)

;; menu bar visibility
(menu-bar-mode -1)

;; Backup Files location
;; https://github.com/bling/dotemacs/blob/master/config/init-core.el
(setq backup-directory-alist
  `((".*" . ,(concat dotemacs-cache-directory "backups")))
  auto-save-file-name-transforms
  `((".*" ,(concat dotemacs-cache-directory "backups") t))
  auto-save-list-file-prefix
  (concat dotemacs-cache-directory "auto-save-list/saves-"))

;; Emacs: reopen buffers from last session on startup?
;; http://stackoverflow.com/a/803828/2741455
;; (desktop-save-mode 1)
;; Some emacs desktop-save questions: how to change it to save in ~/.emacs.d/.emacs.desktop
;; http://stackoverflow.com/a/4485083/2741455
;; (setq desktop-path (list dotemacs-cache-directory))

;; Closing all other buffers in Emacs
;; http://stackoverflow.com/a/3417473/2741455
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

;; How do I change the scratch message in Emacs?
;; http://stackoverflow.com/a/1498292/2741455
(setq initial-scratch-message ";; This is the Emacs Scratch Buffer")

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't automatically add newline to end of file
(setq mode-require-final-newline nil)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)

;; Turn off ding
(setq visible-bell 1)

;; FIX SHIFT-UP, impacts Emacs mode (doesn't affect Evil mode)
;; from http://stackoverflow.com/questions/10871745/shift-up-arrow-doesnt-highlight-text-emacs-iterm2
;; and http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))

;; copy/paste with C-c and C-v and C-x, check out C-RET too
;; impacts Emacs mode (doesn't affect Evil mode)
(cua-mode)

;; From http://ergoemacs.org/emacs/emacs_best_redo_mode.html
(require 'undo-tree)
(global-undo-tree-mode t)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style
(global-set-key (kbd "C-y") 'redo) ; 【Ctrl+y】; Microsoft Windows style

;; cross platform copy paste
(require 'cross-platform-copy-paste)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil) ;; seems to affect autocomplete modes

(require 'hungry-delete)
(global-hungry-delete-mode)

;;;;;;;;;;
(provide 'init-basics)