(require-package 'evil)
(require-package 'evil-matchit)
(require-package 'powerline-evil)
(require-package 'evil-jumper)

;; vim navigation
(require 'evil)
(defalias 'em 'evil-mode)
(evil-mode 1)

;; Use a semicolon instead of the colon to get into command mode
(define-key evil-normal-state-map ";" 'evil-ex)

; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

(require 'evil-jumper)

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