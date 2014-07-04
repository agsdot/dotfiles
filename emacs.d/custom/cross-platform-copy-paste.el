;;From http://blog.binchen.org/posts/the-reliable-way-to-access-system-clipboard-from-emacs.html

;; Key points

;; support Mac/Linux/Windows(cygwin).
;; works well in Emacs with or WITHOUT X support.
;; tested on different versions of Linux (Gentoo, Ubuntu 12.04, Centos 6, ArchLinux).
;; On Linux, you need use xsel instead of xclip (version 0.1.2) because xclip has some compatible issue when called from Emacs.
;; It's easy to support remote X clipboard when you use Emacs in ssh based on my code.
;; Solution

;; All you need to do is to add below code into your .emacs:

(defun copy-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
    (progn
     ; my clipboard manager only intercept CLIPBOARD
      (shell-command-on-region (region-beginning) (region-end)
        (cond
         ((eq system-type 'cygwin) "putclip")
         ((eq system-type 'darwin) "pbcopy")
         (t "xsel -ib")
         )
        )
      (message "Yanked region to clipboard!")
      (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))
(defun paste-from-x-clipboard()
  (interactive)
  (shell-command
   (cond
    ((eq system-type 'cygwin) "getclip")
    ((eq system-type 'darwin) "pbpaste")
    (t "xsel -ob")
    )
   1)
  )


(provide 'cross-platform-copy-paste)
