(require-package 'evil)
(require-package 'evil-jumper)
(require-package 'evil-matchit)
(require-package 'evil-numbers)
(require-package 'powerline-evil)

;; vim navigation
(require 'evil)
(defalias 'em 'evil-mode)
(evil-mode 1)

;; Use a semicolon instead of the colon to get into command mode
(define-key evil-normal-state-map ";" 'evil-ex)

; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

;; Make Evil-Jumper jump list persist in between sessions by storing to a file
(setq evil-jumper-auto-center t)
(setq evil-jumper-file (concat dotemacs-cache-directory "evil-jumps"))
(setq evil-jumper-auto-save-interval 120)
(setq evil-jumper-max-length 10)
(require 'evil-jumper)

(require  'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-S-a") 'evil-numbers/dec-at-pt)

(require 'powerline-evil)
(powerline-evil-vim-theme)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;;Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(evil-set-initial-state 'magit-status-mode 'emacs)
(evil-set-initial-state 'magit-log-edit-mode 'emacs)

;;;;;;;;;;
(provide 'init-evil)