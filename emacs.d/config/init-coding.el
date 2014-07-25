(require-package 'company)
(require-package 'evil-nerd-commenter)
(require-package 'magit)
(require-package 'git-gutter)
(require-package 'git-timemachine)
(require-package 'groovy-mode)
(require-package 'js2-mode)
(require-package 'web-mode)
(require-package 'vimrc-mode)

;; enable seeing of git diffs
(require 'git-gutter)
(global-git-gutter-mode +1)

;; enable evil nerd commenter commenting, works in emacs mode and vim/evil mode
(evilnc-default-hotkeys)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gsp?\\'" . web-mode))

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(require 'groovy-mode)
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

(add-hook 'after-init-hook 'global-company-mode)

;;;;;;;;;;
(provide 'init-coding)
