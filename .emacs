; Require package
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; Ido mode
(require 'ido)
(ido-mode t)

; Multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; Auto Complete
(require 'auto-complete)

; Zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

; Load theme
(load-theme 'zenburn t)

; Use colors to highlight commands, etc.
(global-font-lock-mode t)

; Disable the welcom message
(setq inhibit-startup-message t)

; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")

; Display time
(display-time)

; Always end a file with a new line
(setq require-final-newline t)

; Stop emacs from arbitrarily adding lines to the end of a file when the
; cursor is moved past the end of it
(setq next-line-add-newlines nil)

; Flash instead of that annoying bell
(setq visible-bell t)

; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)

; Lines
(setq scroll-step 1)
(line-number-mode 1)
(column-number-mode 1)

; Backup
(setq make-backup-files t)
(setq version-control t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

; Helpful key bindings
(global-set-key "\C-^" 'enlarge-window)
(global-set-key "\M-g" 'goto-line)

; Tab 2
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
