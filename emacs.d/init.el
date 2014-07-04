(let ((default-directory "~/.emacs.d/custom/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "~/.emacs.d/config/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-packages)

;; the below scripts depend on init-packages
(require 'init-basics)
(require 'init-aesthetics)
(require 'init-navigation)
(require 'init-coding)
(require 'init-evil)

;; the below keybindings depend on init-evil being loaded first
(require 'init-keybindings)
