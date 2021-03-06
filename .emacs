; Require package
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; Multiple cursors
(require 'multiple-cursors)
(global-set-key "\C-d" 'mc/mark-next-like-this)
(global-set-key "\M-d" 'mc/mark-all-like-this)

; Ido mode
(require 'ido)
(ido-mode t)

; CSS mode

; Auto Complete
(require 'auto-complete-config)
(ac-config-default)

; Multi term
(require 'multi-term)
(setq multi-term-program "/bin/bash")

; Js2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; Zencoding
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

; Skewer Mode
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

; Sql Mode
(eval-after-load "sql"
  '(load-library "sql-indent"))
(add-hook 'sql-mode-hook 'sql-highlight-postgres-keywords)

; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

; Find file in
(global-set-key (kbd "C-x f") 'find-file-in-project)

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
(setq make-backup-files nil)
;(setq version-control t)
;(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

; Autosave
(setq auto-save-default nil)

; Helpful key bindings
(global-set-key "\C-^" 'enlarge-window)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-;" 'evilnc-comment-or-uncomment-lines)
(global-set-key "\C-t" 'multi-term)

; Tab 2
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq css-indent-offset 2)
(setq tab-width 2) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

; Back tab

; FlySpell
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)
(flyspell-mode 1)

; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; (add-hook 'prog-mode-hook
;;           '(lambda ()
;;              (yas-minor-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#2d2d2d"))
 '(custom-enabled-themes (quote (base16-default)))
 '(custom-safe-themes (quote ("9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#393939")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#f2777a") (40 . "#f99157") (60 . "#ffcc66") (80 . "#99cc99") (100 . "#66cccc") (120 . "#6699cc") (140 . "#cc99cc") (160 . "#f2777a") (180 . "#f99157") (200 . "#ffcc66") (220 . "#99cc99") (240 . "#66cccc") (260 . "#6699cc") (280 . "#cc99cc") (300 . "#f2777a") (320 . "#f99157") (340 . "#ffcc66") (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
