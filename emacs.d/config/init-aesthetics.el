(require-package 'color-theme)
(require-package 'base16-theme)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'monokai-theme)
(require-package 'solarized-theme)
(require-package 'zenburn-theme)

(require-package 'crosshairs)
(require-package 'rainbow-delimiters)

(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

(line-number-mode t)
(column-number-mode t)
(global-linum-mode t)

(require 'crosshairs)
(toggle-crosshairs-when-idle 30)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(electric-pair-mode 1)
(show-paren-mode 1)

(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (tab-mark 9 [9655 9] [92 9])))

; (load-theme 'sanityinc-tomorrow-eighties t)
(load "tomorrow-night-eighties-theme.el")
(require 'tomorrow-night-eighties-theme)

;;;;;;;;;;
(provide 'init-aesthetics)