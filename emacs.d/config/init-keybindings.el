(require-package 'evil-leader)
(require-package 'key-chord)

;; Emacs style

;; Fast cursor movement in vertical direction with Meta.
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-c C-p") 'projectile-find-file)
(global-set-key (kbd "C-c C-f") 'projectile-grep)

;; Shift <directional key> moves between windows
(windmove-default-keybindings)

;; Vim style
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; use alternative/faster utilities than grep if found
;; outside utilities need to be installed in bash with homebrew or apt-get or the packages directly
;; pt, ag, and ack...grep is built into all unix systems
(cond ((executable-find "pt")
        (require-package 'pt) ;; https://github.com/bling/pt.el
        (defalias 'my-search-util 'projectile-pt))  ;; seems pretty fast (faster than ag? maybe...dunno), but it's written in Go!
      ((executable-find "ag")
        (require-package 'ag) ;; https://github.com/Wilfred/ag.el
        (defalias 'my-search-util 'projectile-ag))  ;; on the website, it said faster than ack
      ((executable-find "ack")
        (require-package 'ack-and-a-half) ;; https://github.com/jhelwig/ack-and-a-half
        (defalias 'my-search-util 'projectile-ack))  ;; faster than grep
      ((executable-find "grep")
        (defalias 'my-search-util 'projectile-grep)))

(evil-leader/set-key
  "b" 'buffer-menu
  "f" 'my-search-util
  "l" 'linum-relative-toggle
  "nf" 'neotree-find
  "nt" 'neotree-toggle
  "p" 'projectile-find-file
  "r" 'recentf-open-files
  "/" 'evilnc-comment-or-uncomment-lines
  "<down>" 'drag-stuff-down
  "<up>" 'drag-stuff-up
)

(define-key evil-normal-state-map ":" 'smex)

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

;;;;;;;;;;
(provide 'init-keybindings)
