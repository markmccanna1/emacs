;;; color-theme-sanityinc-tomorrow.el --- A version of Chris Kempson's "tomorrow" themes

;; Copyright (C) 2012-2014 Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Keywords: themes
;; X-URL: http://github.com/purcell/color-theme-sanityinc-tomorrow
;; URL: http://github.com/purcell/color-theme-sanityinc-tomorrow
;; Version: {{VERSION}}

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; These five color themes are designed for use with Emacs' built-in
;; theme support in Emacs 24. However, they also work with older Emacs
;; versions, in which case color-theme.el is required.

;; Usage:

;; If your Emacs has the `load-theme' command, you can use it to
;; activate one of these themes programatically, or use
;; `customize-themes' to select a theme interactively.

;; Alternatively, or in older Emacs versions, use one of the provided
;; wrapper commands to activate a theme:

;;     M-x color-theme-tomorrow-day
;;     M-x color-theme-tomorrow-night
;;     M-x color-theme-tomorrow-blue
;;     M-x color-theme-tomorrow-bright
;;     M-x color-theme-tomorrow-eighties
;;
;;; Credit:

;; Colour selection by Chris Kempson:
;; https://github.com/ChrisKempson/Tomorrow-Theme

;;; Code:

(defconst color-theme-sanityinc-tomorrow-colors
  '((night . ((background . "#1d1f21")
              (current-line . "#282a2e")
              (selection . "#373b41")
              (foreground . "#c5c8c6")
              (comment . "#969896")
              (red . "#cc6666")
              (orange . "#de935f")
              (yellow . "#f0c674")
              (green . "#b5bd68")
              (aqua . "#8abeb7")
              (blue . "#81a2be")
              (purple . "#b294bb")))
    (day . ((background . "#ffffff")
            (current-line . "#efefef")
            (selection . "#d6d6d6")
            (foreground . "#4d4d4c")
            (comment . "#8e908c")
            (red . "#c82829")
            (orange . "#f5871f")
            (yellow . "#eab700")
            (green . "#718c00")
            (aqua . "#3e999f")
            (blue . "#4271ae")
            (purple . "#8959a8")))
    (eighties . ((background . "#2d2d2d")
                 (current-line . "#393939")
                 (selection . "#515151")
                 (foreground . "#cccccc")
                 (comment . "#999999")
                 (red . "#f2777a")
                 (orange . "#f99157")
                 (yellow . "#ffcc66")
                 (green . "#99cc99")
                 (aqua . "#66cccc")
                 (blue . "#6699cc")
                 (purple . "#cc99cc")))
    (blue . ((background . "#002451")
             (current-line . "#00346e")
             (selection . "#003f8e")
             (foreground . "#ffffff")
             (comment . "#7285b7")
             (red . "#ff9da4")
             (orange . "#ffc58f")
             (yellow . "#ffeead")
             (green . "#d1f1a9")
             (aqua . "#99ffff")
             (blue . "#bbdaff")
             (purple . "#ebbbff")))
    (bright . ((background . "#000000")
               (current-line . "#2a2a2a")
               (selection . "#424242")
               (foreground . "#eaeaea")
               (comment . "#969896")
               (red . "#d54e53")
               (orange . "#e78c45")
               (yellow . "#e7c547")
               (green . "#b9ca4a")
               (aqua . "#70c0b1")
               (blue . "#7aa6da")
               (purple . "#c397d8")))))



(defmacro color-theme-sanityinc-tomorrow--with-colors (mode &rest body)
  "Execute `BODY' in a scope with variables bound to the various tomorrow colors.

`MODE' should be set to either 'day, 'night, 'eighties, 'blue or 'bright."
  `(let* ((colors (or (cdr (assoc ,mode color-theme-sanityinc-tomorrow-colors))
                      (error "no such theme flavor")))
          (background   (cdr (assoc 'background colors)))
          (current-line (cdr (assoc 'current-line colors)))
          (selection    (cdr (assoc 'selection colors)))
          (foreground   (cdr (assoc 'foreground colors)))
          (comment      (cdr (assoc 'comment colors)))
          (red          (cdr (assoc 'red colors)))
          (orange       (cdr (assoc 'orange colors)))
          (yellow       (cdr (assoc 'yellow colors)))
          (green        (cdr (assoc 'green colors)))
          (aqua         (cdr (assoc 'aqua colors)))
          (blue         (cdr (assoc 'blue colors)))
          (purple       (cdr (assoc 'purple colors)))
          (class '((class color) (min-colors 89))))
     ,@body))

(defmacro color-theme-sanityinc-tomorrow--face-specs ()
  "Return a backquote which defines a list of face specs.

It expects to be evaluated in a scope in which the various color
names to which it refers are bound."
  (quote
   (mapcar
    (lambda (entry)
      (list (car entry) `((,class ,@(cdr entry)))))
    `(;; Standard font lock faces
      (default (:foreground ,foreground :background ,background))
      (bold (:weight bold))
      (bold-italic (:slant italic :weight bold))
      (underline (:underline t))
      (italic (:slant italic))
      (font-lock-builtin-face (:foreground ,purple))
      (font-lock-comment-delimiter-face (:foreground ,comment :slant italic))
      (font-lock-comment-face (:foreground ,comment :slant italic))
      (font-lock-constant-face (:foreground ,blue))
      (font-lock-doc-face (:foreground ,purple))
      (font-lock-doc-string-face (:foreground ,yellow))
      (font-lock-function-name-face (:foreground ,orange))
      (font-lock-keyword-face (:foreground ,green))
      (font-lock-negation-char-face (:foreground ,blue))
      (font-lock-preprocessor-face (:foreground ,purple))
      (font-lock-regexp-grouping-backslash (:foreground ,yellow))
      (font-lock-regexp-grouping-construct (:foreground ,purple))
      (font-lock-string-face (:foreground ,aqua))
      (font-lock-type-face (:foreground ,blue))
      (font-lock-variable-name-face (:foreground ,yellow))
      (font-lock-warning-face (:weight bold :foreground ,red))
      (shadow (:foreground ,comment))
      (success (:foreground ,green))
      (error (:foreground ,red))
      (warning (:foreground ,orange))

      ;; Flycheck
      (flycheck-error (:underline (:style wave :color ,red)))
      (flycheck-warning (:underline (:style wave :color ,orange)))
      (flycheck-fringe-error (:foreground ,red :inverse-video t))
      (flycheck-fringe-info (:foreground ,yellow :inverse-video t))
      (flycheck-fringe-warning (:foreground ,orange :inverse-video t))

      ;; Flymake
      (flymake-warnline (:underline (:style wave :color ,orange) :background ,background))
      (flymake-errline (:underline (:style wave :color ,red) :background ,background))

      ;; Clojure errors
      (clojure-test-failure-face (:background nil :inherit flymake-warnline))
      (clojure-test-error-face (:background nil :inherit flymake-errline))
      (clojure-test-success-face (:background nil :foreground nil :underline ,green))

      ;; EDTS errors
      (edts-face-warning-line (:background nil :inherit flymake-warnline))
      (edts-face-warning-mode-line (:background nil :foreground ,orange :weight bold))
      (edts-face-error-line (:background nil :inherit flymake-errline))
      (edts-face-error-mode-line (:background nil :foreground ,red :weight bold))

      ;; For Brian Carper's extended clojure syntax table
      (clojure-keyword (:foreground ,yellow))
      (clojure-parens (:foreground ,foreground))
      (clojure-braces (:foreground ,green))
      (clojure-brackets (:foreground ,yellow))
      (clojure-double-quote (:foreground ,aqua :background nil))
      (clojure-special (:foreground ,blue))
      (clojure-java-call (:foreground ,purple))

      ;; Rainbow-delimiters
      (rainbow-delimiters-depth-1-face (:foreground ,foreground))
      (rainbow-delimiters-depth-2-face (:foreground ,aqua))
      (rainbow-delimiters-depth-3-face (:foreground ,yellow))
      (rainbow-delimiters-depth-4-face (:foreground ,green))
      (rainbow-delimiters-depth-5-face (:foreground ,blue))
      (rainbow-delimiters-depth-6-face (:foreground ,foreground))
      (rainbow-delimiters-depth-7-face (:foreground ,aqua))
      (rainbow-delimiters-depth-8-face (:foreground ,yellow))
      (rainbow-delimiters-depth-9-face (:foreground ,green))
      (rainbow-delimiters-unmatched-face (:foreground ,red))

      ;; MMM-mode
      (mmm-code-submode-face (:background ,current-line))
      (mmm-comment-submode-face (:inherit font-lock-comment-face))
      (mmm-output-submode-face (:background ,current-line))

      ;; Search
      (match (:foreground ,blue :background ,background :inverse-video t))
      (isearch (:foreground ,yellow :background ,background :inverse-video t))
      (isearch-lazy-highlight-face (:foreground ,aqua :background ,background :inverse-video t))
      (isearch-fail (:background ,background :inherit font-lock-warning-face :inverse-video t))

      ;; Anzu
      (anzu-mode-line (:foreground ,orange))
      (anzu-replace-highlight (:inherit isearch-lazy-highlight-face))
      (anzu-replace-to (:inherit isearch))

      ;; IDO
      (ido-subdir (:foreground ,purple))
      (ido-first-match (:foreground ,orange))
      (ido-only-match (:foreground ,green))
      (ido-indicator (:foreground ,red :background ,background))
      (ido-virtual (:foreground ,comment))

      ;; flx-ido
      (flx-highlight-face (:inherit nil :foreground ,yellow :weight bold :underline nil))

      ;; which-function
      (which-func (:foreground ,blue :background nil :weight bold))

      ;; Emacs interface
      (cursor (:background ,foreground))
      (fringe (:background ,current-line))
      (linum (:background ,current-line :foreground ,green :italic nil))
      (border (:background ,current-line))
      (border-glyph (nil))
      (highlight (:inverse-video nil :background ,current-line))
      (gui-element (:background ,current-line :foreground ,foreground))
      (mode-line (:foreground nil :background ,current-line :weight normal
                              :box (:line-width 1 :color ,foreground)))
      (mode-line-buffer-id (:foreground ,purple :background nil))
      (mode-line-inactive (:inherit mode-line
                                    :foreground ,comment
                                    :background ,current-line :weight normal
                                    :box (:line-width 1 :color ,foreground)))
      (mode-line-emphasis (:foreground ,foreground :slant italic))
      (mode-line-highlight (:foreground ,purple :box nil :weight bold))
      (minibuffer-prompt (:foreground ,blue))
      (region (:background ,selection))
      (secondary-selection (:background ,current-line))

      (header-line (:inherit mode-line :foreground ,purple :background nil))

      (trailing-whitespace (:background ,red :foreground ,yellow))
      (whitespace-empty (:foreground ,red :background ,yellow))
      (whitespace-hspace (:background ,current-line :foreground ,comment))
      (whitespace-indentation (:background ,current-line :foreground ,comment))
      (whitespace-line (:background ,current-line :foreground ,red))
      (whitespace-newline (:background ,current-line :foreground ,comment))
      (whitespace-space (:background ,current-line :foreground ,comment))
      (whitespace-space-after-tab (:background ,current-line :foreground ,yellow))
      (whitespace-space-before-tab (:background ,current-line :foreground ,red))
      (whitespace-tab (:background ,current-line :foreground ,comment))
      (whitespace-trailing (:background ,current-line :foreground ,red))

      ;; Parenthesis matching (built-in)
      (show-paren-match (:background nil :foreground nil :inverse-video t))
      (show-paren-mismatch (:background ,purple :foreground ,background))

      ;; Smartparens paren matching
      (sp-show-pair-match-face (:foreground nil :background nil :inherit show-paren-match))
      (sp-show-pair-mismatch-face (:foreground nil :background nil :inherit show-paren-mismatch))

      ;; Parenthesis matching (mic-paren)
      (paren-face-match (:foreground nil :background nil :inherit show-paren-match))
      (paren-face-mismatch (:foreground nil :background nil :inherit show-paren-mismatch))
      (paren-face-no-match (:foreground nil :background nil :inherit show-paren-mismatch))

      ;; Parenthesis dimming (parenface)
      (paren-face (:foreground ,comment :background nil))

      (sh-heredoc (:foreground nil :inherit font-lock-string-face :weight normal))
      (sh-quoted-exec (:foreground nil :inherit font-lock-preprocessor-face))
      (slime-highlight-edits-face (:weight bold))
      (slime-repl-input-face (:weight normal :underline nil))
      (slime-repl-prompt-face (:underline nil :weight bold :foreground ,purple))
      (slime-repl-result-face (:foreground ,green))
      (slime-repl-output-face (:foreground ,blue :background ,background))

      (csv-separator-face (:foreground ,orange))

      (diff-added (:foreground ,green))
      (diff-changed (:foreground ,purple))
      (diff-removed (:foreground ,orange))
      (diff-header (:foreground ,aqua :background nil))
      (diff-file-header (:foreground ,blue :background nil))
      (diff-hunk-header (:foreground ,purple))
      (diff-refine-added (:inherit diff-added :inverse-video t))
      (diff-refine-removed (:inherit diff-removed :inverse-video t))

      (diff-hl-insert (:background ,green))
      (diff-hl-change (:background ,blue))
      (diff-hl-delete (:background ,orange))
      (diff-hl-unknown :background ,purple)

      (ediff-even-diff-A (:foreground nil :background nil :inverse-video t))
      (ediff-even-diff-B (:foreground nil :background nil :inverse-video t))
      (ediff-odd-diff-A  (:foreground ,comment :background nil :inverse-video t))
      (ediff-odd-diff-B  (:foreground ,comment :background nil :inverse-video t))

      (eldoc-highlight-function-argument (:foreground ,green :weight bold))

      ;; macrostep
      (macrostep-expansion-highlight-face (:inherit highlight :foreground nil))

      ;; undo-tree
      (undo-tree-visualizer-default-face (:foreground ,foreground))
      (undo-tree-visualizer-current-face (:foreground ,green :weight bold))
      (undo-tree-visualizer-active-branch-face (:foreground ,red))
      (undo-tree-visualizer-register-face (:foreground ,yellow))

      ;; dired+
      (diredp-compressed-file-suffix (:foreground ,blue))
      (diredp-deletion (:inherit error :inverse-video t))
      (diredp-deletion-file-name (:inherit error))
      (diredp-dir-heading (:foreground ,green :weight bold))
      (diredp-dir-priv (:foreground ,aqua :background nil))
      (diredp-exec-priv (:foreground ,blue :background nil))
      (diredp-executable-tag (:foreground ,red :background nil))
      (diredp-file-name (:foreground ,yellow))
      (diredp-file-suffix (:foreground ,green))
      (diredp-flag-mark (:foreground ,green :inverse-video t))
      (diredp-flag-mark-line (:background nil :inherit highlight))
      (diredp-ignored-file-name (:foreground ,comment))
      (diredp-link-priv (:background nil :foreground ,purple))
      (diredp-mode-line-flagged (:foreground ,red))
      (diredp-mode-line-marked (:foreground ,green))
      (diredp-no-priv (:background nil))
      (diredp-number (:foreground ,yellow))
      (diredp-other-priv (:background nil :foreground ,purple))
      (diredp-rare-priv (:foreground ,red :background nil))
      (diredp-read-priv (:foreground ,green :background nil))
      (diredp-symlink (:foreground ,purple))
      (diredp-write-priv (:foreground ,yellow :background nil))

      ;; Magit (a patch is pending in magit to make these standard upstream)
      (magit-branch (:foreground ,green))
      (magit-header (:inherit nil :weight bold))
      (magit-item-highlight (:inherit highlight :background nil))
      (magit-log-author (:foreground ,aqua))
      (magit-log-graph (:foreground ,comment))
      (magit-log-sha1 (:foreground ,yellow))
      (magit-log-head-label-bisect-bad (:foreground ,red))
      (magit-log-head-label-bisect-good (:foreground ,green))
      (magit-log-head-label-default (:foreground ,yellow :box nil :weight bold))
      (magit-log-head-label-head (:foreground ,orange :box nil :weight bold))
      (magit-log-head-label-local (:foreground ,purple :box nil :weight bold))
      (magit-log-head-label-remote (:foreground ,purple :box nil :weight bold))
      (magit-log-head-label-tags (:foreground ,aqua :box nil :weight bold))
      (magit-log-head-label-wip (:foreground ,blue :box nil :weight bold))
      (magit-process-ok (:inherit success))
      (magit-process-ng (:inherit error))
      (magit-section-title (:foreground ,blue :weight bold))

      ;; git-gutter
      (git-gutter:modified (:foreground ,purple :weight bold))
      (git-gutter:added (:foreground ,green :weight bold))
      (git-gutter:deleted (:foreground ,red :weight bold))
      (git-gutter:unchanged (:background ,yellow))

      ;; git-gutter-fringe
      (git-gutter-fr:modified (:foreground ,purple :weight bold))
      (git-gutter-fr:added (:foreground ,green :weight bold))
      (git-gutter-fr:deleted (:foreground ,red :weight bold))

      (link (:foreground nil :underline t))
      (widget-button (:underline t))
      (widget-field (:background ,current-line :box (:line-width 1 :color ,foreground)))

      ;; Compilation (most faces politely inherit from 'success, 'error, 'warning etc.)
      (compilation-column-number (:foreground ,yellow))
      (compilation-line-number (:foreground ,yellow))
      (compilation-message-face (:foreground ,blue))
      (compilation-mode-line-exit (:foreground ,green))
      (compilation-mode-line-fail (:foreground ,red))
      (compilation-mode-line-run (:foreground ,blue))

      ;; Grep
      (grep-context-face (:foreground ,comment))
      (grep-error-face (:foreground ,red :weight bold :underline t))
      (grep-hit-face (:foreground ,blue))
      (grep-match-face (:foreground nil :background nil :inherit match))

     ;;; TODO: wgrep faces

      (regex-tool-matched-face (:foreground nil :background nil :inherit match))

      ;; mark-multiple
      (mm/master-face (:inherit region :foreground nil :background nil))
      (mm/mirror-face (:inherit region :foreground nil :background nil))

      ;; helm
      (helm-buffer-saved-out (:inherit warning))
      (helm-buffer-size (:foreground ,yellow))
      (helm-buffer-not-saved (:foreground ,orange))
      (helm-buffer-process (:foreground ,aqua))
      (helm-ff-directory (:foreground ,aqua))
      (helm-candidate-number (:foreground ,red))
      (helm-selection (:inherit highlight))
      (helm-separator (:foreground ,purple))
      (helm-source-header (:inherit org-document-title))

      (org-agenda-structure (:foreground ,purple))
      (org-agenda-date (:foreground ,blue :underline nil))
      (org-agenda-done (:foreground ,green))
      (org-agenda-dimmed-todo-face (:foreground ,comment))
      (org-block (:foreground ,orange))
      (org-code (:foreground ,yellow))
      (org-column (:background ,current-line))
      (org-column-title (:inherit org-column :weight bold :underline t))
      (org-date (:foreground ,blue :underline t))
      (org-document-info (:foreground ,aqua))
      (org-document-info-keyword (:foreground ,green))
      (org-document-title (:weight bold :foreground ,orange :height 1.44))
      (org-done (:foreground ,green))
      (org-ellipsis (:foreground ,comment))
      (org-footnote (:foreground ,aqua))
      (org-formula (:foreground ,red))
      (org-hide (:foreground ,background :background ,background))
      (org-link (:foreground ,blue :underline t))
      (org-scheduled (:foreground ,green))
      (org-scheduled-previously (:foreground ,orange))
      (org-scheduled-today (:foreground ,green))
      (org-special-keyword (:foreground ,orange))
      (org-table (:foreground ,purple))
      (org-todo (:foreground ,red))
      (org-upcoming-deadline (:foreground ,orange))
      (org-warning (:weight bold :foreground ,red))

      (markdown-url-face (:inherit link))
      (markdown-link-face (:foreground ,blue :underline t))

      (hl-sexp-face (:background ,current-line))
      (highlight-symbol-face (:background ,current-line :weight bold))
      (highlight-80+ (:background ,current-line))

      ;; Python-specific overrides
      (py-builtins-face (:foreground ,orange :weight normal))

      ;; js2-mode
      (js2-warning (:underline ,orange))
      (js2-error (:foreground nil :underline ,red))
      (js2-external-variable (:foreground ,purple))
      (js2-function-param (:foreground ,blue))
      (js2-instance-member (:foreground ,blue))
      (js2-private-function-call (:foreground ,red))

      ;; js3-mode
      (js3-warning-face (:underline ,orange))
      (js3-error-face (:foreground nil :underline ,red))
      (js3-external-variable-face (:foreground ,purple))
      (js3-function-param-face (:foreground ,blue))
      (js3-jsdoc-tag-face (:foreground ,orange))
      (js3-jsdoc-type-face (:foreground ,aqua))
      (js3-jsdoc-value-face (:foreground ,yellow))
      (js3-jsdoc-html-tag-name-face (:foreground ,blue))
      (js3-jsdoc-html-tag-delimiter-face (:foreground ,green))
      (js3-instance-member-face (:foreground ,blue))
      (js3-private-function-call-face (:foreground ,red))

      ;; coffee-mode
      (coffee-mode-class-name (:foreground ,orange :weight bold))
      (coffee-mode-function-param (:foreground ,purple))

      ;; nxml
      (nxml-name-face (:foreground unspecified :inherit font-lock-constant-face))
      (nxml-attribute-local-name-face (:foreground unspecified :inherit font-lock-variable-name-face))
      (nxml-ref-face (:foreground unspecified :inherit font-lock-preprocessor-face))
      (nxml-delimiter-face (:foreground unspecified :inherit font-lock-keyword-face))
      (nxml-delimited-data-face (:foreground unspecified :inherit font-lock-string-face))
      (rng-error-face (:underline ,red))

      ;; RHTML
      (erb-delim-face (:background ,current-line))
      (erb-exec-face (:background ,current-line :weight bold))
      (erb-exec-delim-face (:background ,current-line))
      (erb-out-face (:background ,current-line :weight bold))
      (erb-out-delim-face (:background ,current-line))
      (erb-comment-face (:background ,current-line :weight bold :slant italic))
      (erb-comment-delim-face (:background ,current-line))

      ;; Message-mode
      (message-header-other (:foreground nil :background nil :weight normal))
      (message-header-subject (:inherit message-header-other :weight bold :foreground ,yellow))
      (message-header-to (:inherit message-header-other :weight bold :foreground ,orange))
      (message-header-cc (:inherit message-header-to :foreground nil))
      (message-header-name (:foreground ,blue :background nil))
      (message-header-newsgroups (:foreground ,aqua :background nil :slant normal))
      (message-separator (:foreground ,purple))

      ;; Jabber
      (jabber-chat-prompt-local (:foreground ,yellow))
      (jabber-chat-prompt-foreign (:foreground ,orange))
      (jabber-chat-prompt-system (:foreground ,yellow :weight bold))
      (jabber-chat-text-local (:foreground ,yellow))
      (jabber-chat-text-foreign (:foreground ,orange))
      (jabber-chat-text-error (:foreground ,red))

      (jabber-roster-user-online (:foreground ,green))
      (jabber-roster-user-xa :foreground ,comment)
      (jabber-roster-user-dnd :foreground ,yellow)
      (jabber-roster-user-away (:foreground ,orange))
      (jabber-roster-user-chatty (:foreground ,purple))
      (jabber-roster-user-error (:foreground ,red))
      (jabber-roster-user-offline (:foreground ,comment))

      (jabber-rare-time-face (:foreground ,comment))
      (jabber-activity-face (:foreground ,purple))
      (jabber-activity-personal-face (:foreground ,aqua))

      ;; Powerline
      (powerline-active1 (:foreground ,foreground :background ,selection))
      (powerline-active2 (:foreground ,foreground :background ,current-line))

      ;; Outline
      (outline-1 (:inherit nil :foreground ,blue))
      (outline-2 (:inherit nil :foreground ,purple))
      (outline-3 (:inherit nil :foreground ,foreground))
      (outline-4 (:inherit nil :foreground ,aqua))
      (outline-5 (:inherit nil :foreground ,orange))
      (outline-6 (:inherit nil :foreground ,blue))
      (outline-7 (:inherit nil :foreground ,purple))
      (outline-8 (:inherit nil :foreground ,foreground))
      (outline-9 (:inherit nil :foreground ,aqua))

      ;; Ledger-mode
      (ledger-font-comment-face (:inherit font-lock-comment-face))
      (ledger-font-occur-narrowed-face (:inherit font-lock-comment-face :invisible t))
      (ledger-font-occur-xact-face (:inherit highlight))
      (ledger-font-payee-cleared-face (:foreground ,green))
      (ledger-font-payee-uncleared-face (:foreground ,aqua))
      (ledger-font-posting-account-cleared-face (:foreground ,blue))
      (ledger-font-posting-account-face (:foreground ,purple))
      (ledger-font-posting-account-pending-face (:foreground ,yellow))
      (ledger-font-xact-highlight-face (:inherit highlight))
      (ledger-occur-narrowed-face (:inherit font-lock-comment-face :invisible t))
      (ledger-occur-xact-face (:inherit highlight))

      ;; EMMS
      (emms-browser-artist-face (:inherit outline-2))
      (emms-browser-album-face (:inherit outline-3))
      (emms-browser-track-face (:inherit outline-4))
      (emms-browser-year/genre-face (:inherit outline-1))
      (emms-playlist-selected-face (:inverse-video t))
      (emms-playlist-track-face (:inherit outline-4))

      ;; mu4e
      (mu4e-header-highlight-face (:underline nil :inherit region))
      (mu4e-header-marks-face (:underline nil :foreground ,yellow))
      (mu4e-flagged-face (:foreground ,orange :inherit nil))
      (mu4e-replied-face (:foreground ,blue :inherit nil))
      (mu4e-unread-face (:foreground ,yellow :inherit nil))
      (mu4e-cited-1-face (:inherit outline-1 :slant normal))
      (mu4e-cited-2-face (:inherit outline-2 :slant normal))
      (mu4e-cited-3-face (:inherit outline-3 :slant normal))
      (mu4e-cited-4-face (:inherit outline-4 :slant normal))
      (mu4e-cited-5-face (:inherit outline-5 :slant normal))
      (mu4e-cited-6-face (:inherit outline-6 :slant normal))
      (mu4e-cited-7-face (:inherit outline-7 :slant normal))
      (mu4e-ok-face (:foreground ,green))
      (mu4e-view-contact-face (:inherit nil :foreground ,yellow))
      (mu4e-view-link-face (:inherit link :foreground ,blue))
      (mu4e-view-url-number-face (:inherit nil :foreground ,aqua))
      (mu4e-view-attach-number-face (:inherit nil :foreground ,orange))
      (mu4e-highlight-face (:inherit highlight))
      (mu4e-title-face (:inherit nil :foreground ,green))

      ;; Gnus
      (gnus-cite-1 (:inherit outline-1 :foreground nil))
      (gnus-cite-2 (:inherit outline-2 :foreground nil))
      (gnus-cite-3 (:inherit outline-3 :foreground nil))
      (gnus-cite-4 (:inherit outline-4 :foreground nil))
      (gnus-cite-5 (:inherit outline-5 :foreground nil))
      (gnus-cite-6 (:inherit outline-6 :foreground nil))
      (gnus-cite-7 (:inherit outline-7 :foreground nil))
      (gnus-cite-8 (:inherit outline-8 :foreground nil))
      ;; there are several more -cite- faces...
      (gnus-header-content (:inherit message-header-other))
      (gnus-header-subject (:inherit message-header-subject))
      (gnus-header-from (:inherit message-header-other-face :weight bold :foreground ,orange))
      (gnus-header-name (:inherit message-header-name))
      (gnus-button (:inherit link :foreground nil))
      (gnus-signature (:inherit font-lock-comment-face))

      (gnus-summary-normal-unread (:foreground ,blue :weight normal))
      (gnus-summary-normal-read (:foreground ,foreground :weight normal))
      (gnus-summary-normal-ancient (:foreground ,aqua :weight normal))
      (gnus-summary-normal-ticked (:foreground ,orange :weight normal))
      (gnus-summary-low-unread (:foreground ,comment :weight normal))
      (gnus-summary-low-read (:foreground ,comment :weight normal))
      (gnus-summary-low-ancient (:foreground ,comment :weight normal))
      (gnus-summary-high-unread (:foreground ,yellow :weight normal))
      (gnus-summary-high-read (:foreground ,green :weight normal))
      (gnus-summary-high-ancient (:foreground ,green :weight normal))
      (gnus-summary-high-ticked (:foreground ,orange :weight normal))
      (gnus-summary-cancelled (:foreground ,red :background nil :weight normal))

      (gnus-group-mail-low (:foreground ,comment))
      (gnus-group-mail-low-empty (:foreground ,comment))
      (gnus-group-mail-1 (:foreground nil :weight normal :inherit outline-1))
      (gnus-group-mail-2 (:foreground nil :weight normal :inherit outline-2))
      (gnus-group-mail-3 (:foreground nil :weight normal :inherit outline-3))
      (gnus-group-mail-4 (:foreground nil :weight normal :inherit outline-4))
      (gnus-group-mail-5 (:foreground nil :weight normal :inherit outline-5))
      (gnus-group-mail-6 (:foreground nil :weight normal :inherit outline-6))
      (gnus-group-mail-1-empty (:inherit gnus-group-mail-1 :foreground ,comment))
      (gnus-group-mail-2-empty (:inherit gnus-group-mail-2 :foreground ,comment))
      (gnus-group-mail-3-empty (:inherit gnus-group-mail-3 :foreground ,comment))
      (gnus-group-mail-4-empty (:inherit gnus-group-mail-4 :foreground ,comment))
      (gnus-group-mail-5-empty (:inherit gnus-group-mail-5 :foreground ,comment))
      (gnus-group-mail-6-empty (:inherit gnus-group-mail-6 :foreground ,comment))
      (gnus-group-news-1 (:foreground nil :weight normal :inherit outline-5))
      (gnus-group-news-2 (:foreground nil :weight normal :inherit outline-6))
      (gnus-group-news-3 (:foreground nil :weight normal :inherit outline-7))
      (gnus-group-news-4 (:foreground nil :weight normal :inherit outline-8))
      (gnus-group-news-5 (:foreground nil :weight normal :inherit outline-1))
      (gnus-group-news-6 (:foreground nil :weight normal :inherit outline-2))
      (gnus-group-news-1-empty (:inherit gnus-group-news-1 :foreground ,comment))
      (gnus-group-news-2-empty (:inherit gnus-group-news-2 :foreground ,comment))
      (gnus-group-news-3-empty (:inherit gnus-group-news-3 :foreground ,comment))
      (gnus-group-news-4-empty (:inherit gnus-group-news-4 :foreground ,comment))
      (gnus-group-news-5-empty (:inherit gnus-group-news-5 :foreground ,comment))
      (gnus-group-news-6-empty (:inherit gnus-group-news-6 :foreground ,comment))

      (erc-direct-msg-face (:foreground ,orange))
      (erc-error-face (:foreground ,red))
      (erc-header-face (:foreground ,foreground :background ,selection))
      (erc-input-face (:foreground ,green))
      (erc-keyword-face (:foreground ,yellow))
      (erc-current-nick-face (:foreground ,green))
      (erc-my-nick-face (:foreground ,green))
      (erc-nick-default-face (:weight normal :foreground ,purple))
      (erc-nick-msg-face (:weight normal :foreground ,yellow))
      (erc-notice-face (:foreground ,comment))
      (erc-pal-face (:foreground ,orange))
      (erc-prompt-face (:foreground ,blue))
      (erc-timestamp-face (:foreground ,aqua))
      (erc-keyword-face (:foreground ,green))

      ;; twittering-mode
      (twittering-username-face (:inherit erc-pal-face))
      (twittering-uri-face (:foreground ,blue :inherit link))
      (twittering-timeline-header-face (:foreground ,green :weight bold))
      (twittering-timeline-footer-face (:inherit twittering-timeline-header-face))

      (custom-variable-tag (:foreground ,blue))
      (custom-group-tag (:foreground ,blue))
      (custom-state (:foreground ,green))

      ;; ansi-term
      (term (:foreground nil :background nil :inherit default))
      (term-color-black   (:foreground ,foreground :background ,foreground))
      (term-color-red     (:foreground ,red :background ,red))
      (term-color-green   (:foreground ,green :background ,green))
      (term-color-yellow  (:foreground ,yellow :background ,yellow))
      (term-color-blue    (:foreground ,blue :background ,blue))
      (term-color-magenta (:foreground ,purple :background ,purple))
      (term-color-cyan    (:foreground ,aqua :background ,aqua))
      (term-color-white   (:foreground ,background :background ,background))
      ))))

(defmacro color-theme-sanityinc-tomorrow--frame-parameter-specs ()
  "Return a backquote which defines a list of frame parameter specs.

These are required by color-theme's `color-theme-install', but
not by the new `deftheme' mechanism. It expects to be evaluated
in a scope in which the various color names to which it refers
are bound."
  (quote
   `(((background-color . ,background)
      (background-mode . light)
      (border-color . ,foreground)
      (cursor-color . ,purple)
      (foreground-color . ,foreground)
      (mouse-color . ,aqua)))))

(defun color-theme-sanityinc-tomorrow--theme-name (mode)
  (intern (format "sanityinc-tomorrow-%s" (symbol-name mode))))

(defmacro color-theme-sanityinc-tomorrow--define-theme (mode)
  "Define a theme for the tomorrow variant `MODE'."
  (let ((name (color-theme-sanityinc-tomorrow--theme-name mode))
        (doc (format "A version of Chris Kempson's 'Tomorrow' theme (%s version)" mode)))
    `(progn
       (deftheme ,name ,doc)
       (put ',name 'theme-immediate t)
       (color-theme-sanityinc-tomorrow--with-colors
        ',mode
        (apply 'custom-theme-set-faces ',name
               (color-theme-sanityinc-tomorrow--face-specs))
        (custom-theme-set-variables
         ',name
         `(fci-rule-color ,current-line)
         `(vc-annotate-color-map
           '((20  . ,red)
             (40  . ,orange)
             (60  . ,yellow)
             (80  . ,green)
             (100 . ,aqua)
             (120 . ,blue)
             (140 . ,purple)
             (160 . ,red)
             (180 . ,orange)
             (200 . ,yellow)
             (220 . ,green)
             (240 . ,aqua)
             (260 . ,blue)
             (280 . ,purple)
             (300 . ,red)
             (320 . ,orange)
             (340 . ,yellow)
             (360 . ,green)))
         `(vc-annotate-very-old-color nil)
         `(vc-annotate-background nil)
         `(ansi-color-names-vector (vector ,foreground ,red ,green ,yellow ,blue ,purple ,aqua ,background))
         '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
         ))
       (provide-theme ',name))))


(defun color-theme-sanityinc-tomorrow (mode)
  "Apply the tomorrow variant theme."
  (if (fboundp 'load-theme)
      (let ((name (color-theme-sanityinc-tomorrow--theme-name mode)))
        (if (boundp 'custom-enabled-themes)
            (custom-set-variables `(custom-enabled-themes '(,name)))
          (if (> emacs-major-version 23)
              (load-theme name t)
            (load-theme name))))
    (progn
      (require 'color-theme)
      (color-theme-sanityinc-tomorrow--with-colors
       mode
       (color-theme-install
        `(,(intern (concat "color-theme-sanityinc-tomorrow-" (symbol-name mode)))
          ,@(color-theme-sanityinc-tomorrow--frame-parameter-specs)
          ,@(color-theme-sanityinc-tomorrow--face-specs)))
       ;; ansi-color - comint and other modes that handle terminal color escape sequences
       (setq ansi-color-names-vector (vector foreground red green yellow blue purple aqua background))
       (setq ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])))))

;;;###autoload
(when (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;;###autoload
(defun color-theme-sanityinc-tomorrow-night ()
  "Apply the tomorrow night theme."
  (interactive)
  (color-theme-sanityinc-tomorrow 'night))

;;;###autoload
(defun color-theme-sanityinc-tomorrow-day ()
  "Apply the tomorrow day theme."
  (interactive)
  (color-theme-sanityinc-tomorrow 'day))

;;;###autoload
(defun color-theme-sanityinc-tomorrow-bright ()
  "Apply the tomorrow bright theme."
  (interactive)
  (color-theme-sanityinc-tomorrow 'bright))

;;;###autoload
(defun color-theme-sanityinc-tomorrow-eighties ()
  "Apply the tomorrow eighties theme."
  (interactive)
  (color-theme-sanityinc-tomorrow 'eighties))

;;;###autoload
(defun color-theme-sanityinc-tomorrow-blue ()
  "Apply the tomorrow blue theme."
  (interactive)
  (color-theme-sanityinc-tomorrow 'blue))


(provide 'color-theme-sanityinc-tomorrow)

;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; rainbow-mode: t
;; End:

;;; color-theme-sanityinc-tomorrow.el ends here
