(require-package 'ace-jump-mode)
(require-package 'ido)
(require-package 'ido-vertical-mode)
(require-package 'flx-ido)
(require-package 'neotree)
(require-package 'projectile)
(require-package 'smex)

;; enable sidebar file managers
(require 'neotree)

(require 'smex) ; Not needed if you use package.el
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; fast file management
(projectile-global-mode)

;; ido mode configs
(require 'ido)
(require 'ido-vertical-mode)
(ido-mode t)
(ido-vertical-mode t)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; flx-ido completion system, recommended by Projectile
;; http://www.swaroopch.com/2013/10/17/emacs-configuration-tutorial/
;; whoa...yeah!!! 6/27/14, this makes projectile behave just like ctrlp in vim (with a working fuzzy search)! yeah!!!
(require 'flx-ido)
(flx-ido-mode 1)
;; change it if you have a fast processor.
(setq flx-ido-threshhold 1000)

;; Save point position between sessions
(require 'saveplace)
;; Try to make emacsclient play nice with saveplace
;; http://www.emacswiki.org/emacs/EmacsClient#toc35
(setq server-visit-hook (quote (save-place-find-file-hook)))
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;;;;;;;;;;
(provide 'init-navigation)
