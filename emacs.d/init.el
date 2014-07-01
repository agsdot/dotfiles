(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(color-theme
    solarized-theme
    monokai-theme
    zenburn-theme
    color-theme-sanityinc-tomorrow
    base16-theme

    ido
    ido-vertical-mode
    flx-ido
    smex
    key-chord

    projectile
    evil-nerd-commenter
    crosshairs
    undo-tree
    ace-jump-mode
    rainbow-delimiters

    evil
    evil-leader
    powerline-evil

    git-gutter

    web-mode
    groovy-mode
    js2-mode

    company
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/custom/neotree")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (load-theme 'sanityinc-tomorrow-eighties t)
(load "tomorrow-night-eighties-theme.el")
(require 'tomorrow-night-eighties-theme)

(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

;; Disable the creation of backup files.
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; fast file management
(projectile-global-mode)

;; enable evil nerd commenter commenting, works in emacs mode and vim/evil mode
(evilnc-default-hotkeys)

;; enable sidebar file managers
(require 'neotree)

;; enable seeing of git diffs
(require 'git-gutter)
(global-git-gutter-mode +1)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; menu bar visibility
(menu-bar-mode -1)

;; ido mode configs
(require 'ido)
(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode t)

(require 'smex) ; Not needed if you use package.el
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; C-x C-j opens dired with the cursor right on the file you're editing
(require 'dired-x)
;; Turn off ding
(setq visible-bell 1)

(require 'crosshairs)
(toggle-crosshairs-when-idle 30)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; FIX SHIFT-UP
;; from http://stackoverflow.com/questions/10871745/shift-up-arrow-doesnt-highlight-text-emacs-iterm2
;; and http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html
(define-key input-decode-map "\e[1;2A" [S-up])
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))

;; copy/paste with C-c and C-v and C-x, check out C-RET too
(cua-mode)
;; cross platform copy paste
(load "cross-platform-copy-paste.el")

;; From http://ergoemacs.org/emacs/emacs_best_redo_mode.html
(require 'undo-tree)
(global-undo-tree-mode t)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
(global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style
(global-set-key (kbd "C-y") 'redo) ; 【Ctrl+y】; Microsoft Windows style

(electric-pair-mode 1)
(show-paren-mode 1)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Fast cursor movement in vertical direction with Meta.
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-c C-p") 'projectile-find-file)
(global-set-key (kbd "C-c C-f") 'projectile-grep)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (tab-mark 9 [9655 9] [92 9])))

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Dont display logo at startup
(setq inhibit-startup-message t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gsp?\\'" . web-mode))

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(require 'groovy-mode)
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;;;vim navigation
(require 'evil)
(defalias 'em 'evil-mode)
(evil-mode 1)
(global-evil-leader-mode)
; Make horizontal movement cross lines
(setq-default evil-cross-lines t)
; (after "evil-leader-autoloads"
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "f" 'projectile-grep
      "p" 'projectile-find-file
      "r" 'recentf-open-files
      "b" 'buffer-menu
      "n" 'neotree-toggle
      "/" 'evilnc-comment-or-uncomment-lines
)

;; press k j in rapid succesion to escape
;; http://stackoverflow.com/questions/10569165/how-to-map-jj-to-esc-in-emacs-evil-mode
(define-key evil-insert-state-map "k" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

;; Press jj in rapid succession to escape 
;; Whoa..two ways to do the same things, the above function and below with the key-chord-mode plugin
(setq key-chord-two-keys-delay 0.2)
;; from http://bbbscarter.wordpress.com/category/coding/emacs/
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;;Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'smex)

(require 'powerline-evil)
(powerline-evil-vim-theme)
;; (powerline-evil-center-color-theme)
;; (powerline-evil-vim-color-theme)

;; flx-ido completion system, recommended by Projectile
;; http://www.swaroopch.com/2013/10/17/emacs-configuration-tutorial/
;; whoa...yeah!!! 6/27/14, this makes projectile behave just like ctrlp in vim (with a working fuzzy search)! yeah!!!
(require 'flx-ido)
(flx-ido-mode 1)
;; change it if you have a fast processor.
(setq flx-ido-threshhold 1000)

(add-hook 'after-init-hook 'global-company-mode)

;; Esc => jj... as in Vim...
;;(define-jey evil-insert-state-map  "")
;; https://github.com/ahmadseleem/ViMacs/blob/master/evil/vimacs.el
