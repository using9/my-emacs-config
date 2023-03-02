;;; awesome-tray-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:


;;;### (autoloads nil "awesome-tray" "awesome-tray.el" (0 0 0 0))
;;; Generated autoloads from awesome-tray.el

(defvar awesome-tray-mode nil "\
Non-nil if Awesome-Tray mode is enabled.
See the `awesome-tray-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `awesome-tray-mode'.")

(custom-autoload 'awesome-tray-mode "awesome-tray" nil)

(autoload 'awesome-tray-mode "awesome-tray" "\
Display text at the end of the echo area.

This is a minor mode.  If called interactively, toggle the
`Awesome-Tray mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='awesome-tray-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'awesome-tray-enable "awesome-tray" "\
Turn on the awesome-tray." t nil)

(autoload 'awesome-tray-disable "awesome-tray" "\
Turn off the awesome-tray." t nil)

(register-definition-prefixes "awesome-tray" '("awesome-tray-"))

;;;***

;;;### (autoloads nil nil ("awesome-tray-faces.el") (0 0 0 0))

;;;***

(provide 'awesome-tray-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; awesome-tray-autoloads.el ends here
