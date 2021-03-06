;;; skewer-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (skewer-bower-load skewer-bower-refresh) "skewer-bower"
;;;;;;  "skewer-bower.el" (20940 35193 967252 388000))
;;; Generated autoloads from skewer-bower.el

(autoload 'skewer-bower-refresh "skewer-bower" "\
Update the package listing and packages synchronously.

\(fn)" t nil)

(autoload 'skewer-bower-load "skewer-bower" "\
Dynamically load a library from bower into the current page.

\(fn PACKAGE &optional VERSION)" t nil)

;;;***

;;;### (autoloads (skewer-css-mode) "skewer-css" "skewer-css.el"
;;;;;;  (20940 35194 67252 387000))
;;; Generated autoloads from skewer-css.el

(autoload 'skewer-css-mode "skewer-css" "\
Minor mode for interactively loading new CSS rules.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (skewer-html-mode) "skewer-html" "skewer-html.el"
;;;;;;  (20940 35193 867252 387000))
;;; Generated autoloads from skewer-html.el

(autoload 'skewer-html-mode "skewer-html" "\
Minor mode for interactively loading new HTML.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (run-skewer skewer-mode list-skewer-clients) "skewer-mode"
;;;;;;  "skewer-mode.el" (20940 35193 835252 387000))
;;; Generated autoloads from skewer-mode.el

(autoload 'list-skewer-clients "skewer-mode" "\
List the attached browsers in a buffer.

\(fn)" t nil)

(autoload 'skewer-mode "skewer-mode" "\
Minor mode for interacting with a browser.

\(fn &optional ARG)" t nil)

(autoload 'run-skewer "skewer-mode" "\
Attach a browser to Emacs for a skewer JavaScript REPL. Uses
`browse-url' to launch a browser.

\(fn)" t nil)

;;;***

;;;### (autoloads (skewer-repl skewer-repl--response-hook) "skewer-repl"
;;;;;;  "skewer-repl.el" (20940 35193 899252 388000))
;;; Generated autoloads from skewer-repl.el

(autoload 'skewer-repl--response-hook "skewer-repl" "\
Catches all browser messages logging some to the REPL.

\(fn RESPONSE)" nil nil)

(autoload 'skewer-repl "skewer-repl" "\
Start a JavaScript REPL to be evaluated in the visiting browser.

\(fn)" t nil)

(eval-after-load 'skewer-mode '(progn (add-hook 'skewer-response-hook #'skewer-repl--response-hook) (define-key skewer-mode-map (kbd "C-c C-z") #'skewer-repl)))

;;;***

;;;### (autoloads (skewer-setup) "skewer-setup" "skewer-setup.el"
;;;;;;  (20940 35194 103252 386000))
;;; Generated autoloads from skewer-setup.el

(autoload 'skewer-setup "skewer-setup" "\
Fully integrate Skewer into js2-mode, css-mode, and html-mode buffers.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("cache-table.el" "skewer-mode-pkg.el")
;;;;;;  (20940 35194 137952 859000))

;;;***

(provide 'skewer-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; skewer-mode-autoloads.el ends here
