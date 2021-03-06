(require-package 'company)
(require-package 'drag-stuff)
(require-package 'git-gutter)
(require-package 'git-timemachine)
(require-package 'groovy-mode)
(require-package 'js2-mode)
(require-package 'linum-relative)
(require-package 'lua-mode)
(require-package 'magit)
(require-package 'web-mode)
(require-package 'vimrc-mode)

;; enable seeing of git diffs
(require 'git-gutter)
(global-git-gutter-mode +1)

;; http://whattheemacsd.com/setup-magit.el-01.html
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))
(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gsp?\\'" . web-mode))

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(require 'groovy-mode)
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;; https://immerrr.github.io/lua-mode/
(require 'lua-mode)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

(add-hook 'after-init-hook 'global-company-mode)

(require 'drag-stuff)
(drag-stuff-global-mode t)

(require 'linum-relative)
;; http://stackoverflow.com/a/15310340/2741455
;; How to set defcustom variable
(after-load 'linum-relative
  (setq linum-relative-format "%3s ")
  (setq linum-relative-current-symbol ""))

;;;;;;;;;;
(provide 'init-coding)