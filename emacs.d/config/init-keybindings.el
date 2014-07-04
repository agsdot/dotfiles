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

;; Vim style
(global-evil-leader-mode)
(evil-leader/set-leader ",")

(evil-leader/set-key
  "f" 'projectile-grep
  "p" 'projectile-find-file
  "r" 'recentf-open-files
  "b" 'buffer-menu
  "n" 'neotree-toggle
  "/" 'evilnc-comment-or-uncomment-lines
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
