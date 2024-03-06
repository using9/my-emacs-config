;;

;;;### (autoloads nil "achive/achive" "achive/achive.el" (0 0 0 0))
;;; Generated autoloads from achive/achive.el

(autoload 'achive "achive/achive" "\
Launch achive and switch to visual buffer." t)

(autoload 'achive-search "achive/achive" "\
Search stock by codes.
CODES: string of stocks list.

\(fn CODES)" t)

(autoload 'achive-add "achive/achive" "\
Add stocks by codes.
CODES: string of stocks list.

\(fn CODES)" t)

(autoload 'achive-remove "achive/achive" "\
Remove stocks." t)

(autoload 'achive-switch-colouring "achive/achive" "\
Manual switch colouring. It's handy for emergencies." t)

(register-definition-prefixes "achive/achive" '("achive-" "url-http-response-status"))

;;;***
;;
;;;### (autoloads nil "async/async" "async/async.el" (0 0 0 0))
;;; Generated autoloads from async/async.el

(autoload 'async-start-process "async/async" "\
Start the executable PROGRAM asynchronously named NAME.  See `async-start'.
PROGRAM is passed PROGRAM-ARGS, calling FINISH-FUNC with the
process object when done.  If FINISH-FUNC is nil, the future
object will return the process object when the program is
finished.  Set DEFAULT-DIRECTORY to change PROGRAM's current
working directory.

\(fn NAME PROGRAM FINISH-FUNC &rest PROGRAM-ARGS)")

(autoload 'async-start "async/async" "\
Execute START-FUNC (often a lambda) in a subordinate Emacs process.
When done, the return value is passed to FINISH-FUNC.  Example:

    (async-start
       ;; What to do in the child process
       (lambda ()
         (message \"This is a test\")
         (sleep-for 3)
         222)

       ;; What to do when it finishes
       (lambda (result)
         (message \"Async process done, result should be 222: %s\"
                  result)))

If you call `async-send' from a child process, the message will
be also passed to the FINISH-FUNC.  You can test RESULT to see if
it is a message by using `async-message-p'.  If nil, it means
this is the final result.  Example of the FINISH-FUNC:

    (lambda (result)
      (if (async-message-p result)
          (message \"Received a message from child process: %s\" result)
        (message \"Async process done, result: %s\" result)))

If FINISH-FUNC is nil or missing, a future is returned that can
be inspected using `async-get', blocking until the value is
ready.  Example:

    (let ((proc (async-start
                   ;; What to do in the child process
                   (lambda ()
                     (message \"This is a test\")
                     (sleep-for 3)
                     222))))

        (message \"I'm going to do some work here\") ;; ....

        (message \"Waiting on async process, result should be 222: %s\"
                 (async-get proc)))

If you don't want to use a callback, and you don't care about any
return value from the child process, pass the `ignore' symbol as
the second argument (if you don't, and never call `async-get', it
will leave *emacs* process buffers hanging around):

    (async-start
     (lambda ()
       (delete-file \"a remote file on a slow link\" nil))
     \\='ignore)

Special case:
If the output of START-FUNC is a string with properties
e.g. (buffer-string) RESULT will be transformed in a list where the
car is the string itself (without props) and the cdr the rest of
properties, this allows using in FINISH-FUNC the string without
properties and then apply the properties in cdr to this string (if
needed).
Properties handling special objects like markers are returned as
list to allow restoring them later.
See <https://github.com/jwiegley/emacs-async/issues/145> for more infos.

Note: Even when FINISH-FUNC is present, a future is still
returned except that it yields no value (since the value is
passed to FINISH-FUNC).  Call `async-get' on such a future always
returns nil.  It can still be useful, however, as an argument to
`async-ready' or `async-wait'.

\(fn START-FUNC &optional FINISH-FUNC)")

(register-definition-prefixes "async/async" '("async-"))

;;;***

;;;### (autoloads nil "async/async-bytecomp" "async/async-bytecomp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from async/async-bytecomp.el

(autoload 'async-byte-recompile-directory "async/async-bytecomp" "\
Compile all *.el files in DIRECTORY asynchronously.
All *.elc files are systematically deleted before proceeding.

\(fn DIRECTORY &optional QUIET)")

(defvar async-bytecomp-package-mode nil "\
Non-nil if Async-Bytecomp-Package mode is enabled.
See the `async-bytecomp-package-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `async-bytecomp-package-mode'.")

(custom-autoload 'async-bytecomp-package-mode "async/async-bytecomp" nil)

(autoload 'async-bytecomp-package-mode "async/async-bytecomp" "\
Byte compile asynchronously packages installed with package.el.

Async compilation of packages can be controlled by
`async-bytecomp-allowed-packages'.

This is a global minor mode.  If called interactively, toggle the
`Async-Bytecomp-Package mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='async-bytecomp-package-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(autoload 'async-byte-compile-file "async/async-bytecomp" "\
Byte compile Lisp code FILE asynchronously.

Same as `byte-compile-file' but asynchronous.

\(fn FILE)" t)

(register-definition-prefixes "async/async-bytecomp" '("async-"))

;;;***

;;;### (autoloads nil "async/async-test" "async/async-test.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from async/async-test.el

(register-definition-prefixes "async/async-test" '("async-test-"))

;;;***

;;;### (autoloads nil "async/dired-async" "async/dired-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from async/dired-async.el

(defvar dired-async-mode nil "\
Non-nil if Dired-Async mode is enabled.
See the `dired-async-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dired-async-mode'.")

(custom-autoload 'dired-async-mode "async/dired-async" nil)

(autoload 'dired-async-mode "async/dired-async" "\
Do dired actions asynchronously.

This is a global minor mode.  If called interactively, toggle the
`Dired-Async mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='dired-async-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(autoload 'dired-async-do-copy "async/dired-async" "\
Run ‘dired-do-copy’ asynchronously.

\(fn &optional ARG)" t)

(autoload 'dired-async-do-symlink "async/dired-async" "\
Run ‘dired-do-symlink’ asynchronously.

\(fn &optional ARG)" t)

(autoload 'dired-async-do-hardlink "async/dired-async" "\
Run ‘dired-do-hardlink’ asynchronously.

\(fn &optional ARG)" t)

(autoload 'dired-async-do-rename "async/dired-async" "\
Run ‘dired-do-rename’ asynchronously.

\(fn &optional ARG)" t)

(register-definition-prefixes "async/dired-async" '("dired-async-"))

;;;***

;;;### (autoloads nil "async/smtpmail-async" "async/smtpmail-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from async/smtpmail-async.el

(register-definition-prefixes "async/smtpmail-async" '("async-smtpmail-"))

;;;***
;;
;;;### (autoloads nil "auto-mark/auto-mark" "auto-mark/auto-mark.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-mark/auto-mark.el

(register-definition-prefixes "auto-mark/auto-mark" '("auto-mark-" "global-auto-mark-mode"))

;;;***
;;
;;;### (autoloads nil "avy/avy" "avy/avy.el" (0 0 0 0))
;;; Generated autoloads from avy/avy.el

(autoload 'avy-process "avy/avy" "\
Select one of CANDIDATES using `avy-read'.
Use OVERLAY-FN to visualize the decision overlay.
CLEANUP-FN should take no arguments and remove the effects of
multiple OVERLAY-FN invocations.

\(fn CANDIDATES &optional OVERLAY-FN CLEANUP-FN)")

(autoload 'avy-goto-char "avy/avy" "\
Jump to the currently visible CHAR.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-char-in-line "avy/avy" "\
Jump to the currently visible CHAR in the current line.

\(fn CHAR)" t)

(autoload 'avy-goto-char-2 "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.

\(fn CHAR1 CHAR2 &optional ARG BEG END)" t)

(autoload 'avy-goto-char-2-above "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR1 CHAR2 &optional ARG)" t)

(autoload 'avy-goto-char-2-below "avy/avy" "\
Jump to the currently visible CHAR1 followed by CHAR2.
This is a scoped version of `avy-goto-char-2', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR1 CHAR2 &optional ARG)" t)

(autoload 'avy-isearch "avy/avy" "\
Jump to one of the current isearch candidates." t)

(autoload 'avy-goto-word-0 "avy/avy" "\
Jump to a word start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.

\(fn ARG &optional BEG END)" t)

(autoload 'avy-goto-whitespace-end "avy/avy" "\
Jump to the end of a whitespace sequence.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.

\(fn ARG &optional BEG END)" t)

(autoload 'avy-goto-word-1 "avy/avy" "\
Jump to the currently visible CHAR at a word start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.
BEG and END narrow the scope where candidates are searched.
When SYMBOL is non-nil, jump to symbol start instead of word start.

\(fn CHAR &optional ARG BEG END SYMBOL)" t)

(autoload 'avy-goto-word-1-above "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-word-1-below "avy/avy" "\
Jump to the currently visible CHAR at a word start.
This is a scoped version of `avy-goto-word-1', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-symbol-1 "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-symbol-1-above "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer up to point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-symbol-1-below "avy/avy" "\
Jump to the currently visible CHAR at a symbol start.
This is a scoped version of `avy-goto-symbol-1', where the scope is
the visible part of the current buffer following point.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-subword-0 "avy/avy" "\
Jump to a word or subword start.
The window scope is determined by `avy-all-windows' (ARG negates it).

When PREDICATE is non-nil it's a function of zero parameters that
should return true.

BEG and END narrow the scope where candidates are searched.

\(fn &optional ARG PREDICATE BEG END)" t)

(autoload 'avy-goto-subword-1 "avy/avy" "\
Jump to the currently visible CHAR at a subword start.
The window scope is determined by `avy-all-windows' (ARG negates it).
The case of CHAR is ignored.

\(fn CHAR &optional ARG)" t)

(autoload 'avy-goto-word-or-subword-1 "avy/avy" "\
Forward to `avy-goto-subword-1' or `avy-goto-word-1'.
Which one depends on variable `subword-mode'." t)

(autoload 'avy-goto-line "avy/avy" "\
Jump to a line start in current buffer.

When ARG is 1, jump to lines currently visible, with the option
to cancel to `goto-line' by entering a number.

When ARG is 4, negate the window scope determined by
`avy-all-windows'.

Otherwise, forward to `goto-line' with ARG.

\(fn &optional ARG)" t)

(autoload 'avy-goto-line-above "avy/avy" "\
Goto visible line above the cursor.
OFFSET changes the distance between the closest key to the cursor and
the cursor
When BOTTOM-UP is non-nil, display avy candidates from top to bottom

\(fn &optional OFFSET BOTTOM-UP)" t)

(autoload 'avy-goto-line-below "avy/avy" "\
Goto visible line below the cursor.
OFFSET changes the distance between the closest key to the cursor and
the cursor
When BOTTOM-UP is non-nil, display avy candidates from top to bottom

\(fn &optional OFFSET BOTTOM-UP)" t)

(autoload 'avy-goto-end-of-line "avy/avy" "\
Call `avy-goto-line' and move to the end of the line.

\(fn &optional ARG)" t)

(autoload 'avy-copy-line "avy/avy" "\
Copy a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t)

(autoload 'avy-move-line "avy/avy" "\
Move a selected line above the current line.
ARG lines can be used.

\(fn ARG)" t)

(autoload 'avy-copy-region "avy/avy" "\
Select two lines and copy the text between them to point.

The window scope is determined by `avy-all-windows' or
`avy-all-windows-alt' when ARG is non-nil.

\(fn ARG)" t)

(autoload 'avy-move-region "avy/avy" "\
Select two lines and move the text between them above the current line." t)

(autoload 'avy-kill-region "avy/avy" "\
Select two lines and kill the region between them.

The window scope is determined by `avy-all-windows' or
`avy-all-windows-alt' when ARG is non-nil.

\(fn ARG)" t)

(autoload 'avy-kill-ring-save-region "avy/avy" "\
Select two lines and save the region between them to the kill ring.
The window scope is determined by `avy-all-windows'.
When ARG is non-nil, do the opposite of `avy-all-windows'.

\(fn ARG)" t)

(autoload 'avy-kill-whole-line "avy/avy" "\
Select line and kill the whole selected line.

With a numerical prefix ARG, kill ARG line(s) starting from the
selected line.  If ARG is negative, kill backward.

If ARG is zero, kill the selected line but exclude the trailing
newline.

\\[universal-argument] 3 \\[avy-kil-whole-line] kill three lines
starting from the selected line.  \\[universal-argument] -3

\\[avy-kill-whole-line] kill three lines backward including the
selected line.

\(fn ARG)" t)

(autoload 'avy-kill-ring-save-whole-line "avy/avy" "\
Select line and save the whole selected line as if killed, but don’t kill it.

This command is similar to `avy-kill-whole-line', except that it
saves the line(s) as if killed, but does not kill it(them).

With a numerical prefix ARG, kill ARG line(s) starting from the
selected line.  If ARG is negative, kill backward.

If ARG is zero, kill the selected line but exclude the trailing
newline.

\(fn ARG)" t)

(autoload 'avy-setup-default "avy/avy" "\
Setup the default shortcuts.")

(autoload 'avy-goto-char-timer "avy/avy" "\
Read one or many consecutive chars and jump to the first one.
The window scope is determined by `avy-all-windows' (ARG negates it).

\(fn &optional ARG)" t)

(autoload 'avy-transpose-lines-in-region "avy/avy" "\
Transpose lines in the active region." t)

(register-definition-prefixes "avy/avy" '("avy-"))

;;;***
;;
;;;### (autoloads nil "cal-china-x/cal-china-x" "cal-china-x/cal-china-x.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from cal-china-x/cal-china-x.el

(autoload 'cal-china-x-birthday-from-chinese "cal-china-x/cal-china-x" "\
Return next birthday date in Gregorian form.

LUNAR-MONTH and LUNAR-DAY are date number used in chinese lunar
calendar.

\(fn LUNAR-MONTH LUNAR-DAY)" t)

(autoload 'holiday-lunar "cal-china-x/cal-china-x" "\
Like `holiday-fixed', but with LUNAR-MONTH and LUNAR-DAY.

When there are multiple days(like Run Yue or 闰月, e.g.,
2006-08-30, which is 07-07 in lunar calendar, the chinese
valentine's day), we use NUM to define which day(s) as
holidays. The rules are:

NUM = 0, only the earlier day.
NUM = 1, only the later day.
NUM with other values(default), all days(maybe one or two).

emacs23 introduces a similar `holiday-chinese', a quick test
shows that it does not recognize Run Yue at all.

\(fn LUNAR-MONTH LUNAR-DAY STRING &optional NUM)")

(autoload 'holiday-solar-term "cal-china-x/cal-china-x" "\
A holiday(STR) on SOLAR-TERM day.
See `cal-china-x-solar-term-name' for a list of solar term names .

\(fn SOLAR-TERM STR)")

(register-definition-prefixes "cal-china-x/cal-china-x" '("cal" "chinese-date-diary-pattern" "holiday-"))

;;;***
;;
;;;### (autoloads nil "cape/cape" "cape/cape.el" (0 0 0 0))
;;; Generated autoloads from cape/cape.el

(autoload 'cape-history "cape/cape" "\
Complete from Eshell, Comint or minibuffer history.
See also `consult-history' for a more flexible variant based on
`completing-read'.  If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-file "cape/cape" "\
Complete file name at point.
See the user option `cape-file-directory-must-exist'.
If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-elisp-symbol "cape/cape" "\
Complete Elisp symbol at point.
If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-elisp-block "cape/cape" "\
Complete Elisp in Org or Markdown code block.
This Capf is particularly useful for literate Emacs configurations.
If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-dabbrev "cape/cape" "\
Complete with Dabbrev at point.

If INTERACTIVE is nil the function acts like a Capf.  In case you
observe a performance issue with auto-completion and `cape-dabbrev'
it is strongly recommended to disable scanning in other buffers.
See the user options `cape-dabbrev-min-length' and
`cape-dabbrev-check-other-buffers'.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-dict "cape/cape" "\
Complete word from dictionary at point.
This completion function works best if the dictionary is sorted
by frequency.  See the custom option `cape-dict-file'.  If
INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-abbrev "cape/cape" "\
Complete abbreviation at point.
If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-line "cape/cape" "\
Complete current line from other lines.
The buffers returned by `cape-line-buffer-function' are scanned for lines.
If INTERACTIVE is nil the function acts like a Capf.

\(fn &optional INTERACTIVE)" t)

(autoload 'cape-company-to-capf "cape/cape" "\
Convert Company BACKEND function to Capf.
VALID is a function taking the old and new input string.  It
should return nil if the cached candidates became invalid.  The
default value for VALID is `string-prefix-p' such that the
candidates are only fetched again if the input prefix
changed.  The function `cape-company-to-capf' is experimental.

\(fn BACKEND &optional VALID)")

(autoload 'cape-interactive "cape/cape" "\
Complete interactively with the given CAPFS.

\(fn &rest CAPFS)")

(autoload 'cape-capf-interactive "cape/cape" "\
Create interactive completion function from CAPF.

\(fn CAPF)")

(autoload 'cape-wrap-super "cape/cape" "\
Call CAPFS and return merged completion result.
The functions `cape-wrap-super' and `cape-capf-super' are experimental.

\(fn &rest CAPFS)")

(autoload 'cape-wrap-debug "cape/cape" "\
Call CAPF and return a completion table which prints trace messages.
If CAPF is an anonymous lambda, pass the Capf NAME explicitly for
meaningful debugging output.

\(fn CAPF &optional NAME)")

(autoload 'cape-wrap-buster "cape/cape" "\
Call CAPF and return a completion table with cache busting.
This function can be used as an advice around an existing Capf.
The cache is busted when the input changes.  The argument VALID
can be a function taking the old and new input string.  It should
return nil if the new input requires that the completion table is
refreshed.  The default value for VALID is `equal', such that the
completion table is refreshed on every input change.

\(fn CAPF &optional VALID)")

(autoload 'cape-wrap-passthrough "cape/cape" "\
Call CAPF and make sure that no completion style filtering takes place.

\(fn CAPF)")

(autoload 'cape-wrap-properties "cape/cape" "\
Call CAPF and add additional completion PROPERTIES.
Completion properties include for example :exclusive, :annotation-function and
the various :company-* extensions.  Furthermore a boolean :sort flag and a
completion :category symbol can be specified.

\(fn CAPF &rest PROPERTIES)")

(autoload 'cape-wrap-nonexclusive "cape/cape" "\
Call CAPF and ensure that it is marked as non-exclusive.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-predicate "cape/cape" "\
Call CAPF and add an additional candidate PREDICATE.
The PREDICATE is passed the candidate symbol or string.

\(fn CAPF PREDICATE)")

(autoload 'cape-wrap-silent "cape/cape" "\
Call CAPF and silence it (no messages, no errors).
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-case-fold "cape/cape" "\
Call CAPF and return a case-insensitive completion table.
If DONT-FOLD is non-nil return a case sensitive table instead.
This function can be used as an advice around an existing Capf.

\(fn CAPF &optional DONT-FOLD)")

(autoload 'cape-wrap-noninterruptible "cape/cape" "\
Call CAPF and return a non-interruptible completion table.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-prefix-length "cape/cape" "\
Call CAPF and ensure that prefix length is greater or equal than LENGTH.
If the prefix is long enough, enforce auto completion.

\(fn CAPF LENGTH)")

(autoload 'cape-wrap-inside-faces "cape/cape" "\
Call CAPF only if inside FACES.
This function can be used as an advice around an existing Capf.

\(fn CAPF &rest FACES)")

(autoload 'cape-wrap-inside-code "cape/cape" "\
Call CAPF only if inside code, not inside a comment or string.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-inside-comment "cape/cape" "\
Call CAPF only if inside comment.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-inside-string "cape/cape" "\
Call CAPF only if inside string.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")

(autoload 'cape-wrap-purify "cape/cape" "\
Call CAPF and ensure that it does not illegally modify the buffer.
This function can be used as an advice around an existing
Capf.  It has been introduced mainly to fix the broken
`pcomplete-completions-at-point' function in Emacs versions < 29.

\(fn CAPF)")

(autoload 'cape-wrap-accept-all "cape/cape" "\
Call CAPF and return a completion table which accepts every input.
This function can be used as an advice around an existing Capf.

\(fn CAPF)")
 (autoload 'cape-capf-accept-all "cape")
 (autoload 'cape-capf-buster "cape")
 (autoload 'cape-capf-case-fold "cape")
 (autoload 'cape-capf-debug "cape")
 (autoload 'cape-capf-inside-code "cape")
 (autoload 'cape-capf-inside-comment "cape")
 (autoload 'cape-capf-inside-faces "cape")
 (autoload 'cape-capf-inside-string "cape")
 (autoload 'cape-capf-nonexclusive "cape")
 (autoload 'cape-capf-noninterruptible "cape")
 (autoload 'cape-capf-passthrough "cape")
 (autoload 'cape-capf-predicate "cape")
 (autoload 'cape-capf-prefix-length "cape")
 (autoload 'cape-capf-properties "cape")
 (autoload 'cape-capf-purify "cape")
 (autoload 'cape-capf-silent "cape")
 (autoload 'cape-capf-super "cape")

(register-definition-prefixes "cape/cape" '("cape-"))

;;;***

;;;### (autoloads nil "cape/cape-char" "cape/cape-char.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from cape/cape-char.el
 (autoload 'cape-tex "cape-char" nil t)
 (autoload 'cape-sgml "cape-char" nil t)
 (autoload 'cape-rfc1345 "cape-char" nil t)
 (when (> emacs-major-version 28) (autoload 'cape-emoji "cape-char" nil t))

(register-definition-prefixes "cape/cape-char" '("cape-char--"))

;;;***

;;;### (autoloads nil "cape/cape-keyword" "cape/cape-keyword.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from cape/cape-keyword.el

(autoload 'cape-keyword "cape/cape-keyword" "\
Complete programming language keyword at point.
See the variable `cape-keyword-list'.
If INTERACTIVE is nil the function acts like a capf.

\(fn &optional INTERACTIVE)" t)

(register-definition-prefixes "cape/cape-keyword" '("cape-"))

;;;***
;;
;;;### (autoloads nil "compat/compat" "compat/compat.el" (0 0 0 0))
;;; Generated autoloads from compat/compat.el

(register-definition-prefixes "compat/compat" '("compat-"))

;;;***

;;;### (autoloads nil "compat/compat-macs" "compat/compat-macs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from compat/compat-macs.el

(register-definition-prefixes "compat/compat-macs" '("compat-"))

;;;***

;;;### (autoloads nil "compat/compat-tests" "compat/compat-tests.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from compat/compat-tests.el

(register-definition-prefixes "compat/compat-tests" '("compat-tests--" "should-equal"))

;;;***
;;
;;;### (autoloads nil "consult/consult" "consult/consult.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from consult/consult.el

(autoload 'consult-completion-in-region "consult/consult" "\
Use minibuffer completion as the UI for `completion-at-point'.

The function is called with 4 arguments: START END COLLECTION PREDICATE.
The arguments and expected return value are as specified for
`completion-in-region'.  Use as a value for `completion-in-region-function'.

The function can be configured via `consult-customize'.

    (consult-customize consult-completion-in-region
                       :completion-styles (basic)
                       :cycle-threshold 3)

These configuration options are supported:

    * :cycle-threshold - Cycling threshold (def: `completion-cycle-threshold')
    * :completion-styles - Use completion styles (def: `completion-styles')
    * :require-match - Require matches when completing (def: nil)
    * :prompt - The prompt string shown in the minibuffer

\(fn START END COLLECTION &optional PREDICATE)")

(autoload 'consult-outline "consult/consult" "\
Jump to an outline heading, obtained by matching against `outline-regexp'.

This command supports narrowing to a heading level and candidate
preview.  The initial narrowing LEVEL can be given as prefix
argument.  The symbol at point is added to the future history.

\(fn &optional LEVEL)" t)

(autoload 'consult-mark "consult/consult" "\
Jump to a marker in MARKERS list (defaults to buffer-local `mark-ring').

The command supports preview of the currently selected marker position.
The symbol at point is added to the future history.

\(fn &optional MARKERS)" t)

(autoload 'consult-global-mark "consult/consult" "\
Jump to a marker in MARKERS list (defaults to `global-mark-ring').

The command supports preview of the currently selected marker position.
The symbol at point is added to the future history.

\(fn &optional MARKERS)" t)

(autoload 'consult-line "consult/consult" "\
Search for a matching line.

Depending on the setting `consult-point-placement' the command
jumps to the beginning or the end of the first match on the line
or the line beginning.  The default candidate is the non-empty
line next to point.  This command obeys narrowing.  Optional
INITIAL input can be provided.  The search starting point is
changed if the START prefix argument is set.  The symbol at point
and the last `isearch-string' is added to the future history.

\(fn &optional INITIAL START)" t)

(autoload 'consult-line-multi "consult/consult" "\
Search for a matching line in multiple buffers.

By default search across all project buffers.  If the prefix
argument QUERY is non-nil, all buffers are searched.  Optional
INITIAL input can be provided.  The symbol at point and the last
`isearch-string' is added to the future history.  In order to
search a subset of buffers, QUERY can be set to a plist according
to `consult--buffer-query'.

\(fn QUERY &optional INITIAL)" t)

(autoload 'consult-keep-lines "consult/consult" "\
Select a subset of the lines in the current buffer with live preview.

The selected lines are kept and the other lines are deleted.  When called
interactively, the lines selected are those that match the minibuffer input.  In
order to match the inverse of the input, prefix the input with `! '.  When
called from Elisp, the filtering is performed by a FILTER function.  This
command obeys narrowing.

FILTER is the filter function.
INITIAL is the initial input.

\(fn FILTER &optional INITIAL)" t)

(autoload 'consult-focus-lines "consult/consult" "\
Hide or show lines using overlays.

The selected lines are shown and the other lines hidden.  When called
interactively, the lines selected are those that match the minibuffer input.  In
order to match the inverse of the input, prefix the input with `! '.  With
optional prefix argument SHOW reveal the hidden lines.  Alternatively the
command can be restarted to reveal the lines.  When called from Elisp, the
filtering is performed by a FILTER function.  This command obeys narrowing.

FILTER is the filter function.
INITIAL is the initial input.

\(fn FILTER &optional SHOW INITIAL)" t)

(autoload 'consult-goto-line "consult/consult" "\
Read line number and jump to the line with preview.

Enter either a line number to jump to the first column of the
given line or line:column in order to jump to a specific column.
Jump directly if a line number is given as prefix ARG.  The
command respects narrowing and the settings
`consult-goto-line-numbers' and `consult-line-numbers-widen'.

\(fn &optional ARG)" t)

(autoload 'consult-recent-file "consult/consult" "\
Find recent file using `completing-read'." t)

(autoload 'consult-mode-command "consult/consult" "\
Run a command from any of the given MODES.

If no MODES are specified, use currently active major and minor modes.

\(fn &rest MODES)" t)

(autoload 'consult-yank-from-kill-ring "consult/consult" "\
Select STRING from the kill ring and insert it.
With prefix ARG, put point at beginning, and mark at end, like `yank' does.

This command behaves like `yank-from-kill-ring' in Emacs 28, which also offers
a `completing-read' interface to the `kill-ring'.  Additionally the Consult
version supports preview of the selected string.

\(fn STRING &optional ARG)" t)

(autoload 'consult-yank-pop "consult/consult" "\
If there is a recent yank act like `yank-pop'.

Otherwise select string from the kill ring and insert it.
See `yank-pop' for the meaning of ARG.

This command behaves like `yank-pop' in Emacs 28, which also offers a
`completing-read' interface to the `kill-ring'.  Additionally the Consult
version supports preview of the selected string.

\(fn &optional ARG)" t)

(autoload 'consult-yank-replace "consult/consult" "\
Select STRING from the kill ring.

If there was no recent yank, insert the string.
Otherwise replace the just-yanked string with the selected string.

There exists no equivalent of this command in Emacs 28.

\(fn STRING)" t)

(autoload 'consult-bookmark "consult/consult" "\
If bookmark NAME exists, open it, otherwise create a new bookmark with NAME.

The command supports preview of file bookmarks and narrowing.  See the
variable `consult-bookmark-narrow' for the narrowing configuration.

\(fn NAME)" t)

(autoload 'consult-complex-command "consult/consult" "\
Select and evaluate command from the command history.

This command can act as a drop-in replacement for `repeat-complex-command'." t)

(autoload 'consult-history "consult/consult" "\
Insert string from HISTORY of current buffer.
In order to select from a specific HISTORY, pass the history
variable as argument.  INDEX is the name of the index variable to
update, if any.  BOL is the function which jumps to the beginning
of the prompt.  See also `cape-history' from the Cape package.

\(fn &optional HISTORY INDEX BOL)" t)

(autoload 'consult-isearch-history "consult/consult" "\
Read a search string with completion from the Isearch history.

This replaces the current search string if Isearch is active, and
starts a new Isearch session otherwise." t)

(autoload 'consult-minor-mode-menu "consult/consult" "\
Enable or disable minor mode.

This is an alternative to `minor-mode-menu-from-indicator'." t)

(autoload 'consult-theme "consult/consult" "\
Disable current themes and enable THEME from `consult-themes'.

The command supports previewing the currently selected theme.

\(fn THEME)" t)

(autoload 'consult-buffer "consult/consult" "\
Enhanced `switch-to-buffer' command with support for virtual buffers.

The command supports recent files, bookmarks, views and project files as
virtual buffers.  Buffers are previewed.  Narrowing to buffers (b), files (f),
bookmarks (m) and project files (p) is supported via the corresponding
keys.  In order to determine the project-specific files and buffers, the
`consult-project-function' is used.  The virtual buffer SOURCES
default to `consult-buffer-sources'.  See `consult--multi' for the
configuration of the virtual buffer sources.

\(fn &optional SOURCES)" t)

(autoload 'consult-project-buffer "consult/consult" "\
Enhanced `project-switch-to-buffer' command with support for virtual buffers.
The command may prompt you for a project directory if it is invoked from
outside a project.  See `consult-buffer' for more details." t)

(autoload 'consult-buffer-other-window "consult/consult" "\
Variant of `consult-buffer', switching to a buffer in another window." t)

(autoload 'consult-buffer-other-frame "consult/consult" "\
Variant of `consult-buffer', switching to a buffer in another frame." t)

(autoload 'consult-buffer-other-tab "consult/consult" "\
Variant of `consult-buffer', switching to a buffer in another tab." t)

(autoload 'consult-grep "consult/consult" "\
Search with `grep' for files in DIR where the content matches a regexp.

The initial input is given by the INITIAL argument.  DIR can be
nil, a directory string or a list of file/directory paths.  If
`consult-grep' is called interactively with a prefix argument,
the user can specify the directories or files to search in.
Multiple directories must be separated by comma in the
minibuffer, since they are read via `completing-read-multiple'.
By default the project directory is used if
`consult-project-function' is defined and returns non-nil.
Otherwise the `default-directory' is searched.

The input string is split, the first part of the string (grep
input) is passed to the asynchronous grep process and the second
part of the string is passed to the completion-style filtering.

The input string is split at a punctuation character, which is
given as the first character of the input string.  The format is
similar to Perl-style regular expressions, e.g., /regexp/.
Furthermore command line options can be passed to grep, specified
behind --.  The overall prompt input has the form
`#async-input -- grep-opts#filter-string'.

Note that the grep input string is transformed from Emacs regular
expressions to Posix regular expressions.  Always enter Emacs
regular expressions at the prompt.  `consult-grep' behaves like
builtin Emacs search commands, e.g., Isearch, which take Emacs
regular expressions.  Furthermore the asynchronous input split
into words, each word must match separately and in any order.
See `consult--regexp-compiler' for the inner workings.  In order
to disable transformations of the grep input, adjust
`consult--regexp-compiler' accordingly.

Here we give a few example inputs:

#alpha beta         : Search for alpha and beta in any order.
#alpha.*beta        : Search for alpha before beta.
#\\(alpha\\|beta\\) : Search for alpha or beta (Note Emacs syntax!)
#word -- -C3        : Search for word, include 3 lines as context
#first#second       : Search for first, quick filter for second.

The symbol at point is added to the future history.

\(fn &optional DIR INITIAL)" t)

(autoload 'consult-git-grep "consult/consult" "\
Search with `git grep' for files in DIR with INITIAL input.
See `consult-grep' for details.

\(fn &optional DIR INITIAL)" t)

(autoload 'consult-ripgrep "consult/consult" "\
Search with `rg' for files in DIR with INITIAL input.
See `consult-grep' for details.

\(fn &optional DIR INITIAL)" t)

(autoload 'consult-find "consult/consult" "\
Search for files with `find' in DIR.
The file names must match the input regexp.  INITIAL is the
initial minibuffer input.  See `consult-grep' for details
regarding the asynchronous search and the arguments.

\(fn &optional DIR INITIAL)" t)

(autoload 'consult-fd "consult/consult" "\
Search for files with `fd' in DIR.
The file names must match the input regexp.  INITIAL is the
initial minibuffer input.  See `consult-grep' for details
regarding the asynchronous search and the arguments.

\(fn &optional DIR INITIAL)" t)

(autoload 'consult-locate "consult/consult" "\
Search with `locate' for files which match input given INITIAL input.

The input is treated literally such that locate can take advantage of
the locate database index.  Regular expressions would often force a slow
linear search through the entire database.  The locate process is started
asynchronously, similar to `consult-grep'.  See `consult-grep' for more
details regarding the asynchronous search.

\(fn &optional INITIAL)" t)

(autoload 'consult-man "consult/consult" "\
Search for man page given INITIAL input.

The input string is not preprocessed and passed literally to the
underlying man commands.  The man process is started asynchronously,
similar to `consult-grep'.  See `consult-grep' for more details regarding
the asynchronous search.

\(fn &optional INITIAL)" t)

(register-definition-prefixes "consult/consult" '("consult-"))

;;;***

;;;### (autoloads nil "consult/consult-compile" "consult/consult-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-compile.el

(autoload 'consult-compile-error "consult/consult-compile" "\
Jump to a compilation error in the current buffer.

This command collects entries from compilation buffers and grep
buffers related to the current buffer.  The command supports
preview of the currently selected error." t)

(register-definition-prefixes "consult/consult-compile" '("consult-compile--"))

;;;***

;;;### (autoloads nil "consult/consult-flymake" "consult/consult-flymake.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-flymake.el

(autoload 'consult-flymake "consult/consult-flymake" "\
Jump to Flymake diagnostic.
When PROJECT is non-nil then prompt with diagnostics from all
buffers in the current project instead of just the current buffer.

\(fn &optional PROJECT)" t)

(register-definition-prefixes "consult/consult-flymake" '("consult-flymake--"))

;;;***

;;;### (autoloads nil "consult/consult-imenu" "consult/consult-imenu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-imenu.el

(autoload 'consult-imenu "consult/consult-imenu" "\
Select item from flattened `imenu' using `completing-read' with preview.

The command supports preview and narrowing.  See the variable
`consult-imenu-config', which configures the narrowing.
The symbol at point is added to the future history.

See also `consult-imenu-multi'." t)

(autoload 'consult-imenu-multi "consult/consult-imenu" "\
Select item from the imenus of all buffers from the same project.

In order to determine the buffers belonging to the same project, the
`consult-project-function' is used.  Only the buffers with the
same major mode as the current buffer are used.  See also
`consult-imenu' for more details.  In order to search a subset of buffers,
QUERY can be set to a plist according to `consult--buffer-query'.

\(fn &optional QUERY)" t)

(register-definition-prefixes "consult/consult-imenu" '("consult-imenu-"))

;;;***

;;;### (autoloads nil "consult/consult-info" "consult/consult-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-info.el

(autoload 'consult-info "consult/consult-info" "\
Full text search through info MANUALS.

\(fn &rest MANUALS)" t)

(register-definition-prefixes "consult/consult-info" '("consult-info--"))

;;;***

;;;### (autoloads nil "consult/consult-kmacro" "consult/consult-kmacro.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-kmacro.el

(autoload 'consult-kmacro "consult/consult-kmacro" "\
Run a chosen keyboard macro.

With prefix ARG, run the macro that many times.
Macros containing mouse clicks are omitted.

\(fn ARG)" t)

(register-definition-prefixes "consult/consult-kmacro" '("consult-kmacro--"))

;;;***

;;;### (autoloads nil "consult/consult-org" "consult/consult-org.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-org.el

(autoload 'consult-org-heading "consult/consult-org" "\
Jump to an Org heading.

MATCH and SCOPE are as in `org-map-entries' and determine which
entries are offered.  By default, all entries of the current
buffer are offered.

\(fn &optional MATCH SCOPE)" t)

(autoload 'consult-org-agenda "consult/consult-org" "\
Jump to an Org agenda heading.

By default, all agenda entries are offered.  MATCH is as in
`org-map-entries' and can used to refine this.

\(fn &optional MATCH)" t)

(register-definition-prefixes "consult/consult-org" '("consult-org--"))

;;;***

;;;### (autoloads nil "consult/consult-register" "consult/consult-register.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-register.el

(autoload 'consult-register-window "consult/consult-register" "\
Enhanced drop-in replacement for `register-preview'.

BUFFER is the window buffer.
SHOW-EMPTY must be t if the window should be shown for an empty register list.

\(fn BUFFER &optional SHOW-EMPTY)")

(autoload 'consult-register-format "consult/consult-register" "\
Enhanced preview of register REG.
This function can be used as `register-preview-function'.
If COMPLETION is non-nil format the register for completion.

\(fn REG &optional COMPLETION)")

(autoload 'consult-register "consult/consult-register" "\
Load register and either jump to location or insert the stored text.

This command is useful to search the register contents.  For quick access
to registers it is still recommended to use the register functions
`consult-register-load' and `consult-register-store' or the built-in
built-in register access functions.  The command supports narrowing, see
`consult-register--narrow'.  Marker positions are previewed.  See
`jump-to-register' and `insert-register' for the meaning of prefix ARG.

\(fn &optional ARG)" t)

(autoload 'consult-register-load "consult/consult-register" "\
Do what I mean with a REG.

For a window configuration, restore it.  For a number or text, insert it.
For a location, jump to it.  See `jump-to-register' and `insert-register'
for the meaning of prefix ARG.

\(fn REG &optional ARG)" t)

(autoload 'consult-register-store "consult/consult-register" "\
Store register dependent on current context, showing an action menu.

With an active region, store/append/prepend the contents, optionally
deleting the region when a prefix ARG is given.  With a numeric prefix
ARG, store or add the number.  Otherwise store point, frameset, window or
kmacro.

\(fn ARG)" t)

(register-definition-prefixes "consult/consult-register" '("consult-register-"))

;;;***

;;;### (autoloads nil "consult/consult-xref" "consult/consult-xref.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from consult/consult-xref.el

(autoload 'consult-xref "consult/consult-xref" "\
Show xrefs with preview in the minibuffer.

This function can be used for `xref-show-xrefs-function'.
See `xref-show-xrefs-function' for the description of the
FETCHER and ALIST arguments.

\(fn FETCHER &optional ALIST)")

(register-definition-prefixes "consult/consult-xref" '("consult-xref--"))

;;;***
;;
;;;### (autoloads nil "corfu/corfu" "corfu/corfu.el" (0 0 0 0))
;;; Generated autoloads from corfu/corfu.el

(autoload 'corfu-mode "corfu/corfu" "\
COmpletion in Region FUnction.

This is a minor mode.  If called interactively, toggle the `Corfu
mode' mode.  If the prefix argument is positive, enable the mode,
and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `corfu-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(put 'global-corfu-mode 'globalized-minor-mode t)

(defvar global-corfu-mode nil "\
Non-nil if Global Corfu mode is enabled.
See the `global-corfu-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-corfu-mode'.")

(custom-autoload 'global-corfu-mode "corfu/corfu" nil)

(autoload 'global-corfu-mode "corfu/corfu" "\
Toggle Corfu mode in all buffers.
With prefix ARG, enable Global Corfu mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Corfu mode is enabled in all buffers where `corfu--on' would do it.

See `corfu-mode' for more information on Corfu mode.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu" '("corfu-" "global-corfu-modes"))

;;;***

;;;### (autoloads nil "corfu/corfu-echo" "corfu/corfu-echo.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from corfu/corfu-echo.el

(defvar corfu-echo-mode nil "\
Non-nil if Corfu-Echo mode is enabled.
See the `corfu-echo-mode' command
for a description of this minor mode.")

(custom-autoload 'corfu-echo-mode "corfu/corfu-echo" nil)

(autoload 'corfu-echo-mode "corfu/corfu-echo" "\
Show candidate documentation in echo area.

This is a global minor mode.  If called interactively, toggle the
`Corfu-Echo mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='corfu-echo-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu-echo" '("corfu-echo-"))

;;;***

;;;### (autoloads nil "corfu/corfu-history" "corfu/corfu-history.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from corfu/corfu-history.el

(defvar corfu-history-mode nil "\
Non-nil if Corfu-History mode is enabled.
See the `corfu-history-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `corfu-history-mode'.")

(custom-autoload 'corfu-history-mode "corfu/corfu-history" nil)

(autoload 'corfu-history-mode "corfu/corfu-history" "\
Update Corfu history and sort completions by history.

This is a global minor mode.  If called interactively, toggle the
`Corfu-History mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='corfu-history-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu-history" '("corfu-history"))

;;;***

;;;### (autoloads nil "corfu/corfu-indexed" "corfu/corfu-indexed.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from corfu/corfu-indexed.el

(defvar corfu-indexed-mode nil "\
Non-nil if Corfu-Indexed mode is enabled.
See the `corfu-indexed-mode' command
for a description of this minor mode.")

(custom-autoload 'corfu-indexed-mode "corfu/corfu-indexed" nil)

(autoload 'corfu-indexed-mode "corfu/corfu-indexed" "\
Prefix candidates with indices.

This is a global minor mode.  If called interactively, toggle the
`Corfu-Indexed mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='corfu-indexed-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu-indexed" '("corfu-indexed-"))

;;;***

;;;### (autoloads nil "corfu/corfu-info" "corfu/corfu-info.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from corfu/corfu-info.el

(autoload 'corfu-info-documentation "corfu/corfu-info" "\
Show documentation of current candidate.
If called with a prefix ARG, the buffer is persistent.

\(fn &optional ARG)" t)

(autoload 'corfu-info-location "corfu/corfu-info" "\
Show location of current candidate.
If called with a prefix ARG, the buffer is persistent.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu-info" '("corfu-info--"))

;;;***

;;;### (autoloads nil "corfu/corfu-popupinfo" "corfu/corfu-popupinfo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from corfu/corfu-popupinfo.el

(defvar corfu-popupinfo-mode nil "\
Non-nil if Corfu-Popupinfo mode is enabled.
See the `corfu-popupinfo-mode' command
for a description of this minor mode.")

(custom-autoload 'corfu-popupinfo-mode "corfu/corfu-popupinfo" nil)

(autoload 'corfu-popupinfo-mode "corfu/corfu-popupinfo" "\
Corfu info popup minor mode.

This is a global minor mode.  If called interactively, toggle the
`Corfu-Popupinfo mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='corfu-popupinfo-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "corfu/corfu-popupinfo" '("corfu-popupinfo-"))

;;;***

;;;### (autoloads nil "corfu/corfu-quick" "corfu/corfu-quick.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from corfu/corfu-quick.el

(autoload 'corfu-quick-jump "corfu/corfu-quick" "\
Jump to candidate using quick keys." t)

(autoload 'corfu-quick-insert "corfu/corfu-quick" "\
Insert candidate using quick keys." t)

(autoload 'corfu-quick-complete "corfu/corfu-quick" "\
Complete candidate using quick keys." t)

(register-definition-prefixes "corfu/corfu-quick" '("corfu-quick"))

;;;***
;;
;;;### (autoloads nil "dash/dash" "dash/dash.el" (0 0 0 0))
;;; Generated autoloads from dash/dash.el

(autoload 'dash-fontify-mode "dash/dash" "\
Toggle fontification of Dash special variables.

Dash-Fontify mode is a buffer-local minor mode intended for Emacs
Lisp buffers.  Enabling it causes the special variables bound in
anaphoric Dash macros to be fontified.  These anaphoras include
`it', `it-index', `acc', and `other'.  In older Emacs versions
which do not dynamically detect macros, Dash-Fontify mode
additionally fontifies Dash macro calls.

See also `dash-fontify-mode-lighter' and
`global-dash-fontify-mode'.

This is a minor mode.  If called interactively, toggle the
`Dash-Fontify mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `dash-fontify-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(put 'global-dash-fontify-mode 'globalized-minor-mode t)

(defvar global-dash-fontify-mode nil "\
Non-nil if Global Dash-Fontify mode is enabled.
See the `global-dash-fontify-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-dash-fontify-mode'.")

(custom-autoload 'global-dash-fontify-mode "dash/dash" nil)

(autoload 'global-dash-fontify-mode "dash/dash" "\
Toggle Dash-Fontify mode in all buffers.
With prefix ARG, enable Global Dash-Fontify mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Dash-Fontify mode is enabled in all buffers where
`dash--turn-on-fontify-mode' would do it.

See `dash-fontify-mode' for more information on Dash-Fontify mode.

\(fn &optional ARG)" t)

(autoload 'dash-register-info-lookup "dash/dash" "\
Register the Dash Info manual with `info-lookup-symbol'.
This allows Dash symbols to be looked up with \\[info-lookup-symbol]." t)

(register-definition-prefixes "dash/dash" '("!cdr" "!cons" "--" "->" "-a" "-butlast" "-c" "-d" "-e" "-f" "-gr" "-i" "-juxt" "-keep" "-l" "-m" "-no" "-o" "-p" "-r" "-s" "-t" "-u" "-value-to-list" "-when-let" "-zip" "dash-"))

;;;***
;;
;;;### (autoloads nil "diredfl/diredfl" "diredfl/diredfl.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from diredfl/diredfl.el

(autoload 'diredfl-mode "diredfl/diredfl" "\
Enable additional font locking in `dired-mode'.

This is a minor mode.  If called interactively, toggle the
`Diredfl mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `diredfl-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(put 'diredfl-global-mode 'globalized-minor-mode t)

(defvar diredfl-global-mode nil "\
Non-nil if Diredfl-Global mode is enabled.
See the `diredfl-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `diredfl-global-mode'.")

(custom-autoload 'diredfl-global-mode "diredfl/diredfl" nil)

(autoload 'diredfl-global-mode "diredfl/diredfl" "\
Toggle Diredfl mode in all buffers.
With prefix ARG, enable Diredfl-Global mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Diredfl mode is enabled in all buffers where `(lambda nil (when
\(derived-mode-p 'dired-mode) (diredfl-mode)))' would do it.

See `diredfl-mode' for more information on Diredfl mode.

\(fn &optional ARG)" t)

(register-definition-prefixes "diredfl/diredfl" '("diredfl-"))

;;;***
;;
;;;### (autoloads nil "elfeed/elfeed" "elfeed/elfeed.el" (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed.el

(autoload 'elfeed-update "elfeed/elfeed" "\
Update all the feeds in `elfeed-feeds'." t)

(autoload 'elfeed "elfeed/elfeed" "\
Enter elfeed." t)

(autoload 'elfeed-load-opml "elfeed/elfeed" "\
Load feeds from an OPML file into `elfeed-feeds'.
When called interactively, the changes to `elfeed-feeds' are
saved to your customization file.

\(fn FILE)" t)

(autoload 'elfeed-export-opml "elfeed/elfeed" "\
Export the current feed listing to OPML-formatted FILE.

\(fn FILE)" t)

(register-definition-prefixes "elfeed/elfeed" '("elfeed-"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-csv" "elfeed/elfeed-csv.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-csv.el

(register-definition-prefixes "elfeed/elfeed-csv" '("elfeed-csv-"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-curl" "elfeed/elfeed-curl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-curl.el

(register-definition-prefixes "elfeed/elfeed-curl" '("elfeed-curl-"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-db" "elfeed/elfeed-db.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from elfeed/elfeed-db.el

(register-definition-prefixes "elfeed/elfeed-db" '("elfeed-" "with-elfeed-db-visit"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-lib" "elfeed/elfeed-lib.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-lib.el

(register-definition-prefixes "elfeed/elfeed-lib" '("elfeed-"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-link" "elfeed/elfeed-link.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-link.el

(autoload 'elfeed-link-store-link "elfeed/elfeed-link" "\
Store a link to an elfeed search or entry buffer.

When storing a link to an entry, automatically extract all the
entry metadata.  These can be used in the capture templates as
%:elfeed-entry-<prop>.  See `elfeed-entry--create' for the list
of available props.")

(autoload 'elfeed-link-open "elfeed/elfeed-link" "\
Jump to an elfeed entry or search.

Depending on what FILTER-OR-ID looks like, we jump to either
search buffer or show a concrete entry.

\(fn FILTER-OR-ID)")

(eval-after-load 'org `(funcall ',(lambda nil (if (version< (org-version) "9.0") (with-no-warnings (org-add-link-type "elfeed" #'elfeed-link-open) (add-hook 'org-store-link-functions #'elfeed-link-store-link)) (with-no-warnings (org-link-set-parameters "elfeed" :follow #'elfeed-link-open :store #'elfeed-link-store-link))))))

;;;***

;;;### (autoloads nil "elfeed/elfeed-log" "elfeed/elfeed-log.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-log.el

(register-definition-prefixes "elfeed/elfeed-log" '("elfeed-log"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-search" "elfeed/elfeed-search.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-search.el

(autoload 'elfeed-search-bookmark-handler "elfeed/elfeed-search" "\
Jump to an elfeed-search bookmarked location.

\(fn RECORD)")

(autoload 'elfeed-search-desktop-restore "elfeed/elfeed-search" "\
Restore the state of an elfeed-search buffer on desktop restore.

\(fn FILE-NAME BUFFER-NAME SEARCH-FILTER)")

(add-to-list 'desktop-buffer-mode-handlers '(elfeed-search-mode . elfeed-search-desktop-restore))

(register-definition-prefixes "elfeed/elfeed-search" '("elfeed-s"))

;;;***

;;;### (autoloads nil "elfeed/elfeed-show" "elfeed/elfeed-show.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elfeed/elfeed-show.el

(autoload 'elfeed-show-bookmark-handler "elfeed/elfeed-show" "\
Show the bookmarked entry saved in the `RECORD'.

\(fn RECORD)")

(register-definition-prefixes "elfeed/elfeed-show" '("elfeed-"))

;;;***

;;;### (autoloads nil "elfeed/xml-query" "elfeed/xml-query.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from elfeed/xml-query.el

(register-definition-prefixes "elfeed/xml-query" '("xml-query"))

;;;***
;;
;;;### (autoloads nil "embark/avy-embark-collect" "embark/avy-embark-collect.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from embark/avy-embark-collect.el

(autoload 'avy-embark-collect-choose "embark/avy-embark-collect" "\
Choose an Embark Collect candidate." t)

(autoload 'avy-embark-collect-act "embark/avy-embark-collect" "\
Act on an Embark Collect candidate." t)

(register-definition-prefixes "embark/avy-embark-collect" '("avy-embark-collect--"))

;;;***

;;;### (autoloads nil "embark/embark" "embark/embark.el" (0 0 0 0))
;;; Generated autoloads from embark/embark.el

(defun embark--record-this-command nil "\
Record command which opened the minibuffer.
We record this because it will be the default action.
This function is meant to be added to `minibuffer-setup-hook'." (setq-local embark--command this-command))

(add-hook 'minibuffer-setup-hook #'embark--record-this-command)

(autoload 'embark-bindings-in-keymap "embark/embark" "\
Explore command key bindings in KEYMAP with `completing-read'.
The selected command will be executed.  Interactively, prompt the
user for a KEYMAP variable.

\(fn KEYMAP)" t)

(autoload 'embark-bindings "embark/embark" "\
Explore all current command key bindings with `completing-read'.
The selected command will be executed.

If NO-GLOBAL is non-nil (interactively, if called with a prefix
argument) omit global key bindings; this leaves key bindings from
minor mode maps and the local map (usually set by the major
mode), but also less common keymaps such as those from a text
property or overlay, or the overriding maps:
`overriding-terminal-local-map' and `overriding-local-map'.

\(fn NO-GLOBAL)" t)

(autoload 'embark-bindings-at-point "embark/embark" "\
Explore all key bindings at point with `completing-read'.
The selected command will be executed.

This command lists key bindings found in keymaps specified by the
text properties `keymap' or `local-map', from either buffer text
or an overlay.  These are not widely used in Emacs, and when they
are used can be somewhat hard to discover.  Examples of locations
that have such a keymap are links and images in `eww' buffers,
attachment links in `gnus' article buffers, and the 'Stash' line
in a `vc-dir' buffer." t)

(autoload 'embark-prefix-help-command "embark/embark" "\
Prompt for and run a command bound in the prefix used for this command.
The prefix described consists of all but the last event of the
key sequence that ran this command.  This function is intended to
be used as a value for `prefix-help-command'.

In addition to using completion to select a command, you can also
type @ and the key binding (without the prefix)." t)

(autoload 'embark-act "embark/embark" "\
Prompt the user for an action and perform it.
The targets of the action are chosen by `embark-target-finders'.
By default, if called from a minibuffer the target is the top
completion candidate.  When called from a non-minibuffer buffer
there can multiple targets and you can cycle among them by using
`embark-cycle' (which is bound by default to the same key
binding `embark-act' is, but see `embark-cycle-key').

This command uses `embark-prompter' to ask the user to specify an
action, and calls it injecting the target at the first minibuffer
prompt.

If you call this from the minibuffer, it can optionally quit the
minibuffer.  The variable `embark-quit-after-action' controls
whether calling `embark-act' with nil ARG quits the minibuffer,
and if ARG is non-nil it will do the opposite.  Interactively,
ARG is the prefix argument.

If instead you call this from outside the minibuffer, the first
ARG targets are skipped over (if ARG is negative the skipping is
done by cycling backwards) and cycling starts from the following
target.

\(fn &optional ARG)" t)

(autoload 'embark-act-all "embark/embark" "\
Prompt the user for an action and perform it on each candidate.
The candidates are chosen by `embark-candidate-collectors'.
By default, if called from a minibuffer the candidates are the
completion candidates.

This command uses `embark-prompter' to ask the user to specify an
action, and calls it injecting the target at the first minibuffer
prompt.

If you call this from the minibuffer, it can optionally quit the
minibuffer.  The variable `embark-quit-after-action' controls
whether calling `embark-act' with nil ARG quits the minibuffer,
and if ARG is non-nil it will do the opposite.  Interactively,
ARG is the prefix argument.

\(fn &optional ARG)" t)

(autoload 'embark-dwim "embark/embark" "\
Run the default action on the current target.
The target of the action is chosen by `embark-target-finders'.

If the target comes from minibuffer completion, then the default
action is the command that opened the minibuffer in the first
place, unless overidden by `embark-default-action-overrides'.

For targets that do not come from minibuffer completion
\(typically some thing at point in a regular buffer) and whose
type is not listed in `embark-default-action-overrides', the
default action is given by whatever binding RET has in the action
keymap for the target's type.

See `embark-act' for the meaning of the prefix ARG.

\(fn &optional ARG)" t)

(autoload 'embark-become "embark/embark" "\
Make current command become a different command.
Take the current minibuffer input as initial input for new
command.  The new command can be run normally using key bindings or
\\[execute-extended-command], but if the current command is found in a keymap in
`embark-become-keymaps', that keymap is activated to provide
convenient access to the other commands in it.

If FULL is non-nil (interactively, if called with a prefix
argument), the entire minibuffer contents are used as the initial
input of the new command.  By default only the part of the
minibuffer contents between the current completion boundaries is
taken.  What this means is fairly technical, but (1) usually
there is no difference: the completion boundaries include the
entire minibuffer contents, and (2) the most common case where
these notions differ is file completion, in which case the
completion boundaries single out the path component containing
point.

\(fn &optional FULL)" t)

(autoload 'embark-collect "embark/embark" "\
Create an Embark Collect buffer.

To control the display, add an entry to `display-buffer-alist'
with key \"Embark Collect\".

Reverting an Embark Collect buffer has slightly unusual behavior
if the buffer was obtained by running `embark-collect' from
within a minibuffer completion session.  In that case reverting
just restarts the completion session, that is, the command that
opened the minibuffer is run again and the minibuffer contents
restored.  You can then interact normally with the command,
perhaps editing the minibuffer contents, and, if you wish, you
can rerun `embark-collect' to get an updated buffer." t)

(autoload 'embark-live "embark/embark" "\
Create a live-updating Embark Collect buffer.

To control the display, add an entry to `display-buffer-alist'
with key \"Embark Live\"." t)

(autoload 'embark-export "embark/embark" "\
Create a type-specific buffer to manage current candidates.
The variable `embark-exporters-alist' controls how to make the
buffer for each type of completion.

Reverting an Embark Export buffer has slightly unusual behavior if
the buffer was obtained by running `embark-export' from within a
minibuffer completion session.  In that case reverting just
restarts the completion session, that is, the command that opened
the minibuffer is run again and the minibuffer contents restored.
You can then interact normally with the command, perhaps editing
the minibuffer contents, and, if you wish, you can rerun
`embark-export' to get an updated buffer." t)

(register-definition-prefixes "embark/embark" '("embark-"))

;;;***

;;;### (autoloads nil "embark/embark-consult" "embark/embark-consult.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from embark/embark-consult.el

(register-definition-prefixes "embark/embark-consult" '("embark-consult-"))

;;;***

;;;### (autoloads nil "embark/embark-org" "embark/embark-org.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from embark/embark-org.el

(register-definition-prefixes "embark/embark-org" '("embark-org-"))

;;;***
;;
;;;### (autoloads nil "evil/evil-command-window" "evil/evil-command-window.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil/evil-command-window.el

(register-definition-prefixes "evil/evil-command-window" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-commands" "evil/evil-commands.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil/evil-commands.el

(register-definition-prefixes "evil/evil-commands" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-common" "evil/evil-common.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from evil/evil-common.el

(register-definition-prefixes "evil/evil-common" '("bounds-of-evil-" "evil-" "forward-evil-"))

;;;***

;;;### (autoloads nil "evil/evil-core" "evil/evil-core.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from evil/evil-core.el
 (autoload 'evil-mode "evil" nil t)

(register-definition-prefixes "evil/evil-core" '("evil-" "turn-o"))

;;;***

;;;### (autoloads nil "evil/evil-digraphs" "evil/evil-digraphs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil/evil-digraphs.el

(autoload 'evil-digraph "evil/evil-digraphs" "\
Convert DIGRAPH to character or list representation.
If DIGRAPH is a list (CHAR1 CHAR2), return the corresponding character;
if DIGRAPH is a character, return the corresponding list.
Searches in `evil-digraphs-table-user' and `evil-digraphs-table'.

\(fn DIGRAPH)")

(register-definition-prefixes "evil/evil-digraphs" '("evil-digraphs-table"))

;;;***

;;;### (autoloads nil "evil/evil-ex" "evil/evil-ex.el" (0 0 0 0))
;;; Generated autoloads from evil/evil-ex.el

(register-definition-prefixes "evil/evil-ex" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-integration" "evil/evil-integration.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil/evil-integration.el

(register-definition-prefixes "evil/evil-integration" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-jumps" "evil/evil-jumps.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from evil/evil-jumps.el

(register-definition-prefixes "evil/evil-jumps" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-macros" "evil/evil-macros.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from evil/evil-macros.el

(register-definition-prefixes "evil/evil-macros" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-maps" "evil/evil-maps.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from evil/evil-maps.el

(register-definition-prefixes "evil/evil-maps" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-repeat" "evil/evil-repeat.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from evil/evil-repeat.el

(register-definition-prefixes "evil/evil-repeat" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-search" "evil/evil-search.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from evil/evil-search.el

(register-definition-prefixes "evil/evil-search" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-states" "evil/evil-states.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from evil/evil-states.el

(register-definition-prefixes "evil/evil-states" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-test-helpers" "evil/evil-test-helpers.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from evil/evil-test-helpers.el

(register-definition-prefixes "evil/evil-test-helpers" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-tests" "evil/evil-tests.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from evil/evil-tests.el

(register-definition-prefixes "evil/evil-tests" '("evil-"))

;;;***

;;;### (autoloads nil "evil/evil-types" "evil/evil-types.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from evil/evil-types.el

(register-definition-prefixes "evil/evil-types" '("evil-ex-get-optional-register-and-count"))

;;;***

;;;### (autoloads nil "evil/evil-vars" "evil/evil-vars.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from evil/evil-vars.el

(register-definition-prefixes "evil/evil-vars" '("evil-"))

;;;***
;;
;;;### (autoloads nil "goto-chg/goto-chg" "goto-chg/goto-chg.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from goto-chg/goto-chg.el

(autoload 'goto-last-change "goto-chg/goto-chg" "\
Go to the point where the last edit was made in the current buffer.
Repeat the command to go to the second last edit, etc.

To go back to more recent edit, the reverse of this command, use \\[goto-last-change-reverse]
or precede this command with \\[universal-argument] - (minus).

It does not go to the same point twice even if there has been many edits
there. I call the minimal distance between distinguishable edits \"span\".
Set variable `glc-default-span' to control how close is \"the same point\".
Default span is 8.
The span can be changed temporarily with \\[universal-argument] right before \\[goto-last-change]:
\\[universal-argument] <NUMBER> set current span to that number,
\\[universal-argument] (no number) multiplies span by 4, starting with default.
The so set span remains until it is changed again with \\[universal-argument], or the consecutive
repetition of this command is ended by any other command.

When span is zero (i.e. \\[universal-argument] 0) subsequent \\[goto-last-change] visits each and
every point of edit and a message shows what change was made there.
In this case it may go to the same point twice.

This command uses undo information. If undo is disabled, so is this command.
At times, when undo information becomes too large, the oldest information is
discarded. See variable `undo-limit'.

\(fn ARG)" t)

(autoload 'goto-last-change-reverse "goto-chg/goto-chg" "\
Go back to more recent changes after \\[goto-last-change] have been used.
See `goto-last-change' for use of prefix argument.

\(fn ARG)" t)

(register-definition-prefixes "goto-chg/goto-chg" '("glc-"))

;;;***
;;
;;;### (autoloads nil "marginalia/marginalia" "marginalia/marginalia.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from marginalia/marginalia.el

(defvar marginalia-mode nil "\
Non-nil if Marginalia mode is enabled.
See the `marginalia-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `marginalia-mode'.")

(custom-autoload 'marginalia-mode "marginalia/marginalia" nil)

(autoload 'marginalia-mode "marginalia/marginalia" "\
Annotate completion candidates with richer information.

This is a global minor mode.  If called interactively, toggle the
`Marginalia mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='marginalia-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(autoload 'marginalia-cycle "marginalia/marginalia" "\
Cycle between annotators in `marginalia-annotator-registry'." t)

(register-definition-prefixes "marginalia/marginalia" '("marginalia-"))

;;;***
;;
;;;### (autoloads nil "markdown-mode/markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t)

(add-to-list 'auto-mode-alist '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t)

(autoload 'markdown-view-mode "markdown-mode/markdown-mode" "\
Major mode for viewing Markdown content.

\(fn)" t)

(autoload 'gfm-view-mode "markdown-mode/markdown-mode" "\
Major mode for viewing GitHub Flavored Markdown content.

\(fn)" t)

(autoload 'markdown-live-preview-mode "markdown-mode/markdown-mode" "\
Toggle native previewing on save for a specific markdown file.

This is a minor mode.  If called interactively, toggle the
`Markdown-Live-Preview mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `markdown-live-preview-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "markdown-mode/markdown-mode" '("defun-markdown-" "gfm-" "markdown"))

;;;***
;;
;;;### (autoloads nil "minions/minions" "minions/minions.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from minions/minions.el

(defvar minions-mode nil "\
Non-nil if Minions mode is enabled.
See the `minions-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `minions-mode'.")

(custom-autoload 'minions-mode "minions/minions" nil)

(autoload 'minions-mode "minions/minions" "\
Display a minor-mode menu in the mode line.

This replaces the likely incomplete and possibly cut off list of
minor modes that is usually displayed directly in the mode line.

This is a global minor mode.  If called interactively, toggle the
`Minions mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='minions-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "minions/minions" '("minions-"))

;;;***
;;
;;;### (autoloads nil "orderless/orderless" "orderless/orderless.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from orderless/orderless.el

(autoload 'orderless-filter "orderless/orderless" "\
Split STRING into components and find entries TABLE matching all.
The predicate PRED is used to constrain the entries in TABLE.

\(fn STRING TABLE &optional PRED)")

(autoload 'orderless-all-completions "orderless/orderless" "\
Split STRING into components and find entries TABLE matching all.
The predicate PRED is used to constrain the entries in TABLE.  The
matching portions of each candidate are highlighted.
This function is part of the `orderless' completion style.

\(fn STRING TABLE PRED POINT)")

(autoload 'orderless-try-completion "orderless/orderless" "\
Complete STRING to unique matching entry in TABLE.
This uses `orderless-all-completions' to find matches for STRING
in TABLE among entries satisfying PRED.  If there is only one
match, it completes to that match.  If there are no matches, it
returns nil.  In any other case it \"completes\" STRING to
itself, without moving POINT.
This function is part of the `orderless' completion style.

\(fn STRING TABLE PRED POINT)")

(add-to-list 'completion-styles-alist '(orderless orderless-try-completion orderless-all-completions "Completion of multiple components, in any order."))

(autoload 'orderless-ivy-re-builder "orderless/orderless" "\
Convert STR into regexps for use with ivy.
This function is for integration of orderless with ivy, use it as
a value in `ivy-re-builders-alist'.

\(fn STR)")

(register-definition-prefixes "orderless/orderless" '("orderless-"))

;;;***
;;
;;;### (autoloads nil "pyim-basedict/pyim-basedict" "pyim-basedict/pyim-basedict.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim-basedict/pyim-basedict.el

(autoload 'pyim-basedict-enable "pyim-basedict/pyim-basedict" "\
Add pyim-basedict.pyim file to `pyim-extra-dicts'." t)

;;;***

;;;### (autoloads nil "pyim-basedict/pyim-basedict-utils" "pyim-basedict/pyim-basedict-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim-basedict/pyim-basedict-utils.el

(register-definition-prefixes "pyim-basedict/pyim-basedict-utils" '("pyim-basedict-"))

;;;***

;;;### (autoloads nil "pyim/pyim" "pyim/pyim.el" (0 0 0 0))
;;; Generated autoloads from pyim/pyim.el

(defvar pyim-title "PYIM ")

(register-input-method "pyim" "UTF-8" #'pyim-activate pyim-title "")

(autoload 'pyim-activate "pyim/pyim" "\
pyim 启动函数.

pyim 是使用 `pyim-activate' 来启动输入法，这个命令主要做如下工作：
1. 重置所有的 local 变量。
2. 创建汉字到拼音和拼音到汉字的 hash table。
3. 创建词库缓存 dcache.
4. 运行 hook： `pyim-load-hook'。
5. 将 `pyim--kill-emacs-hook-function' 命令添加到 `kill-emacs-hook' , emacs 关闭
之前将用户选择过的词生成的缓存和词频缓存保存到文件，供以后使用。
6. 设定变量：
   1. `input-method-function'
   2. `deactivate-current-input-method-function'
7. 运行 `pyim-activate-hook'

pyim 使用函数 `pyim-activate' 启动输入法的时候，会将变量
`input-method-function' 设置为 `pyim-input-method' ，这个变量会影
响 `read-event' 的行为。

当输入字符时，`read-event' 会被调用，`read-event' 调用的过程中，
会执行 `pyim-input-method' 这个函数。

\(fn &optional ARGS)" t)

(autoload 'pyim-convert-string-at-point "pyim/pyim" "\
将光标前的用户输入的字符串转换为中文.

\(fn &optional _)" t)

(register-definition-prefixes "pyim/pyim" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-autoselector" "pyim/pyim-autoselector.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-autoselector.el

(register-definition-prefixes "pyim/pyim-autoselector" '("pyim-autoselector-"))

;;;***

;;;### (autoloads nil "pyim/pyim-candidates" "pyim/pyim-candidates.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-candidates.el

(register-definition-prefixes "pyim/pyim-candidates" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-cloudim" "pyim/pyim-cloudim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-cloudim.el

(register-definition-prefixes "pyim/pyim-cloudim" '("pyim-cloudim"))

;;;***

;;;### (autoloads nil "pyim/pyim-common" "pyim/pyim-common.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pyim/pyim-common.el

(register-definition-prefixes "pyim/pyim-common" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-cregexp" "pyim/pyim-cregexp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-cregexp.el

(register-definition-prefixes "pyim/pyim-cregexp" '("pyim-cregexp-"))

;;;***

;;;### (autoloads nil "pyim/pyim-cregexp-utils" "pyim/pyim-cregexp-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-cregexp-utils.el

(autoload 'pyim-cregexp-convert-at-point "pyim/pyim-cregexp-utils" "\
将光标前的字符串按拼音的规则转换为一个搜索中文的 regexp.
用于实现拼音搜索中文的功能。

在 minibuffer 中，这个命令默认会自动运行 `exit-minibuffer'.
这个可以使用 INSERT-ONLY 参数控制。

\(fn &optional INSERT-ONLY)" t)

(defvar pyim-isearch-mode nil "\
Non-nil if pyim-isearch mode is enabled.
See the `pyim-isearch-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pyim-isearch-mode'.")

(custom-autoload 'pyim-isearch-mode "pyim/pyim-cregexp-utils" nil)

(autoload 'pyim-isearch-mode "pyim/pyim-cregexp-utils" "\
这个 mode 为 isearch 添加拼音搜索功能.

This is a global minor mode.  If called interactively, toggle the
`pyim-isearch mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='pyim-isearch-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "pyim/pyim-cregexp-utils" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-cstring" "pyim/pyim-cstring.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-cstring.el

(autoload 'pyim-cstring-to-pinyin "pyim/pyim-cstring" "\
将汉字字符串转换为对应的拼音字符串的工具.

如果 SHOU-ZI-MU 设置为 t, 转换仅得到拼音首字母字符串。当
RETURN-LIST 设置为 t 时，返回一个拼音列表，这个列表包含词条的一个
或者多个拼音（词条包含多音字时）；如果 IGNORE-DUO-YIN-ZI 设置为
t, 遇到多音字时，只使用第一个拼音，其它拼音忽略。

BUG: 当 STRING 中包含其它标点符号，并且设置 SEPERATER 时，结果会
包含多余的连接符：比如： \"你=好\" --> \"ni-=-hao\"

\(fn STRING &optional SHOU-ZI-MU SEPARATOR RETURN-LIST IGNORE-DUO-YIN-ZI _)")

(autoload 'pyim-cstring-to-pinyin-simple "pyim/pyim-cstring" "\
简化版的 `pyim-cstring-to-pinyin', 不处理多音字。

\(fn STRING &optional SHOU-ZI-MU SEPARATOR RETURN-LIST)")

(register-definition-prefixes "pyim/pyim-cstring" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-cstring-utils" "pyim/pyim-cstring-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-cstring-utils.el

(register-definition-prefixes "pyim/pyim-cstring-utils" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-dcache" "pyim/pyim-dcache.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pyim/pyim-dcache.el

(register-definition-prefixes "pyim/pyim-dcache" '("pyim-dcache-"))

;;;***

;;;### (autoloads nil "pyim/pyim-dhashcache" "pyim/pyim-dhashcache.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-dhashcache.el

(register-definition-prefixes "pyim/pyim-dhashcache" '("pyim-dhashcache-"))

;;;***

;;;### (autoloads nil "pyim/pyim-dict" "pyim/pyim-dict.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pyim/pyim-dict.el

(register-definition-prefixes "pyim/pyim-dict" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-dict-manager" "pyim/pyim-dict-manager.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-dict-manager.el

(autoload 'pyim-dicts-manager "pyim/pyim-dict-manager" "\
pyim 词库管理器。

使用这个词库管理器可以方便的执行下列命令：
1. 添加词库。
2. 删除词库。
3. 向上和向下移动词库。
4. 保存词库设置。
5. 重启输入法。" t)

(register-definition-prefixes "pyim/pyim-dict-manager" '("pyim-dict-manager-"))

;;;***

;;;### (autoloads nil "pyim/pyim-dregcache" "pyim/pyim-dregcache.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-dregcache.el

(register-definition-prefixes "pyim/pyim-dregcache" '("pyim-dregcache-"))

;;;***

;;;### (autoloads nil "pyim/pyim-entered" "pyim/pyim-entered.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-entered.el

(register-definition-prefixes "pyim/pyim-entered" '("pyim-entered-"))

;;;***

;;;### (autoloads nil "pyim/pyim-indicator" "pyim/pyim-indicator.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-indicator.el

(register-definition-prefixes "pyim/pyim-indicator" '("pyim-indicator-"))

;;;***

;;;### (autoloads nil "pyim/pyim-liberime" "pyim/pyim-liberime.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-liberime.el

(register-definition-prefixes "pyim/pyim-liberime" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-outcome" "pyim/pyim-outcome.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-outcome.el

(register-definition-prefixes "pyim/pyim-outcome" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-page" "pyim/pyim-page.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from pyim/pyim-page.el

(register-definition-prefixes "pyim/pyim-page" '("pyim-page-"))

;;;***

;;;### (autoloads nil "pyim/pyim-pinyin" "pyim/pyim-pinyin.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pyim/pyim-pinyin.el

(register-definition-prefixes "pyim/pyim-pinyin" '("pyim-pinyin-"))

;;;***

;;;### (autoloads nil "pyim/pyim-preview" "pyim/pyim-preview.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-preview.el

(register-definition-prefixes "pyim/pyim-preview" '("pyim-preview--"))

;;;***

;;;### (autoloads nil "pyim/pyim-probe" "pyim/pyim-probe.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from pyim/pyim-probe.el

(register-definition-prefixes "pyim/pyim-probe" '("pyim-probe-"))

;;;***

;;;### (autoloads nil "pyim/pyim-process" "pyim/pyim-process.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-process.el

(register-definition-prefixes "pyim/pyim-process" '("pyim-"))

;;;***

;;;### (autoloads nil "pyim/pyim-punctuation" "pyim/pyim-punctuation.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-punctuation.el

(register-definition-prefixes "pyim/pyim-punctuation" '("pyim-punctuation-"))

;;;***

;;;### (autoloads nil "pyim/pyim-pymap" "pyim/pyim-pymap.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from pyim/pyim-pymap.el

(register-definition-prefixes "pyim/pyim-pymap" '("pyim-pymap"))

;;;***

;;;### (autoloads nil "pyim/pyim-pymap-utils" "pyim/pyim-pymap-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pyim/pyim-pymap-utils.el

(register-definition-prefixes "pyim/pyim-pymap-utils" '("pyim-pymap-"))

;;;***

;;;### (autoloads nil "pyim/pyim-scheme" "pyim/pyim-scheme.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from pyim/pyim-scheme.el

(autoload 'pyim-default-scheme "pyim/pyim-scheme" "\


\(fn &optional SCHEME-NAME)" t)

(register-definition-prefixes "pyim/pyim-scheme" '("pyim-"))

;;;***
;;;;
;;;### (autoloads nil "switch-window/switch-window" "switch-window/switch-window.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from switch-window/switch-window.el

(autoload 'switch-window-then-delete "switch-window/switch-window" "\
Display an overlay in each window showing a unique key.
In the mean time, user will be asked to choose the window deleted." t)

(autoload 'switch-window-then-maximize "switch-window/switch-window" "\
Display an overlay in each window showing a unique key.
In the mean time, ask user which window to maximize" t)

(autoload 'switch-window "switch-window/switch-window" "\
Display an overlay in each window showing a unique key.
In the mean time, ask user for the window where move to" t)

(autoload 'switch-window-then-split-horizontally "switch-window/switch-window" "\
Select a window then split it horizontally.
Argument ARG .

\(fn ARG)" t)

(autoload 'switch-window-then-split-vertically "switch-window/switch-window" "\
Select a window then split it vertically.
Argument ARG .

\(fn ARG)" t)

(autoload 'switch-window-then-split-below "switch-window/switch-window" "\
Select a window then split it with split-window-below's mode.
TODO: Argument ARG.

\(fn ARG)" t)

(autoload 'switch-window-then-split-right "switch-window/switch-window" "\
Select a window then split it with split-window-right's mode.
TODO: Argument ARG .

\(fn ARG)" t)

(autoload 'switch-window-then-swap-buffer "switch-window/switch-window" "\
Swap the current window's buffer with a selected window's buffer.

Move the focus on the newly selected window unless KEEP-FOCUS is
non-nil (aka keep the focus on the current window).

When a window is strongly dedicated to its buffer, this function
won't take effect, and no buffers will be switched.

\(fn &optional KEEP-FOCUS)" t)

(autoload 'switch-window-then-find-file "switch-window/switch-window" "\
Select a window, then find a file in it.

Designed to replace `find-file-other-window'." t)

(autoload 'switch-window-then-find-file-read-only "switch-window/switch-window" "\
Select a window, then find a file in it, read-only.

Designed to replace `find-file-read-only-other-window'." t)

(autoload 'switch-window-then-display-buffer "switch-window/switch-window" "\
Select a window, display a buffer in it, then return.

Designed to replace `display-buffer'." t)

(autoload 'switch-window-then-kill-buffer "switch-window/switch-window" "\
Select a window, then kill its buffer, then close it.

Designed to replace `kill-buffer-and-window'." t)

(autoload 'switch-window-then-dired "switch-window/switch-window" "\
Select a window, then dired in it.

Designed to replace `dired-other-window'." t)

(autoload 'switch-window-then-compose-mail "switch-window/switch-window" "\
Select a window, then start composing mail in it.

Designed to replace `compose-mail-other-window'." t)

(register-definition-prefixes "switch-window/switch-window" '("delete-other-window" "switch-window-"))

;;;***

;;;### (autoloads nil "switch-window/switch-window-asciiart" "switch-window/switch-window-asciiart.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from switch-window/switch-window-asciiart.el

(register-definition-prefixes "switch-window/switch-window-asciiart" '("switch-window-asciiart"))

;;;***

;;;### (autoloads nil "switch-window/switch-window-mvborder" "switch-window/switch-window-mvborder.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from switch-window/switch-window-mvborder.el

(register-definition-prefixes "switch-window/switch-window-mvborder" '("switch-window-"))

;;;***
;;
;;;### (autoloads nil "valign/valign" "valign/valign.el" (0 0 0 0))
;;; Generated autoloads from valign/valign.el

(autoload 'valign-table "valign/valign" "\
Visually align the table at point." t)

(autoload 'valign-mode "valign/valign" "\
Visually align Org tables.

This is a minor mode.  If called interactively, toggle the
`Valign mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `valign-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "valign/valign" '("valign-"))

;;;***
;;
;;;### (autoloads nil "vertico/vertico" "vertico/vertico.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from vertico/vertico.el

(defvar vertico-mode nil "\
Non-nil if Vertico mode is enabled.
See the `vertico-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-mode'.")

(custom-autoload 'vertico-mode "vertico/vertico" nil)

(autoload 'vertico-mode "vertico/vertico" "\
VERTical Interactive COmpletion.

This is a global minor mode.  If called interactively, toggle the
`Vertico mode' mode.  If the prefix argument is positive, enable
the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico" '("vertico-"))

;;;***

;;;### (autoloads nil "vertico/vertico-buffer" "vertico/vertico-buffer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-buffer.el

(defvar vertico-buffer-mode nil "\
Non-nil if Vertico-Buffer mode is enabled.
See the `vertico-buffer-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-buffer-mode'.")

(custom-autoload 'vertico-buffer-mode "vertico/vertico-buffer" nil)

(autoload 'vertico-buffer-mode "vertico/vertico-buffer" "\
Display Vertico like a regular buffer in a large window.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Buffer mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-buffer-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-buffer" '("vertico-buffer-"))

;;;***

;;;### (autoloads nil "vertico/vertico-directory" "vertico/vertico-directory.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-directory.el

(autoload 'vertico-directory-enter "vertico/vertico-directory" "\
Enter directory or exit completion with current candidate.
Exit with current input if prefix ARG is given.

\(fn &optional ARG)" t)

(autoload 'vertico-directory-up "vertico/vertico-directory" "\
Delete N names before point.

\(fn &optional N)" t)

(autoload 'vertico-directory-delete-char "vertico/vertico-directory" "\
Delete N directories or chars before point.

\(fn &optional N)" t)

(autoload 'vertico-directory-delete-word "vertico/vertico-directory" "\
Delete N directories or words before point.

\(fn &optional N)" t)

(autoload 'vertico-directory-tidy "vertico/vertico-directory" "\
Tidy shadowed file name, see `rfn-eshadow-overlay'.")

;;;***

;;;### (autoloads nil "vertico/vertico-flat" "vertico/vertico-flat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-flat.el

(defvar vertico-flat-mode nil "\
Non-nil if Vertico-Flat mode is enabled.
See the `vertico-flat-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-flat-mode'.")

(custom-autoload 'vertico-flat-mode "vertico/vertico-flat" nil)

(autoload 'vertico-flat-mode "vertico/vertico-flat" "\
Flat, horizontal display for Vertico.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Flat mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-flat-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-flat" '("vertico-flat-"))

;;;***

;;;### (autoloads nil "vertico/vertico-grid" "vertico/vertico-grid.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-grid.el

(defvar vertico-grid-mode nil "\
Non-nil if Vertico-Grid mode is enabled.
See the `vertico-grid-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-grid-mode'.")

(custom-autoload 'vertico-grid-mode "vertico/vertico-grid" nil)

(autoload 'vertico-grid-mode "vertico/vertico-grid" "\
Grid display for Vertico.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Grid mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-grid-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-grid" '("vertico-grid-"))

;;;***

;;;### (autoloads nil "vertico/vertico-indexed" "vertico/vertico-indexed.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-indexed.el

(defvar vertico-indexed-mode nil "\
Non-nil if Vertico-Indexed mode is enabled.
See the `vertico-indexed-mode' command
for a description of this minor mode.")

(custom-autoload 'vertico-indexed-mode "vertico/vertico-indexed" nil)

(autoload 'vertico-indexed-mode "vertico/vertico-indexed" "\
Prefix candidates with indices.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Indexed mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-indexed-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-indexed" '("vertico-indexed-"))

;;;***

;;;### (autoloads nil "vertico/vertico-mouse" "vertico/vertico-mouse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-mouse.el

(defvar vertico-mouse-mode nil "\
Non-nil if Vertico-Mouse mode is enabled.
See the `vertico-mouse-mode' command
for a description of this minor mode.")

(custom-autoload 'vertico-mouse-mode "vertico/vertico-mouse" nil)

(autoload 'vertico-mouse-mode "vertico/vertico-mouse" "\
Mouse support for Vertico.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Mouse mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-mouse-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-mouse" '("vertico-mouse-"))

;;;***

;;;### (autoloads nil "vertico/vertico-multiform" "vertico/vertico-multiform.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-multiform.el

(defvar vertico-multiform-mode nil "\
Non-nil if Vertico-Multiform mode is enabled.
See the `vertico-multiform-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-multiform-mode'.")

(custom-autoload 'vertico-multiform-mode "vertico/vertico-multiform" nil)

(autoload 'vertico-multiform-mode "vertico/vertico-multiform" "\
Configure Vertico in various forms per command.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Multiform mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-multiform-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-multiform" '("vertico-multiform-"))

;;;***

;;;### (autoloads nil "vertico/vertico-quick" "vertico/vertico-quick.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-quick.el

(autoload 'vertico-quick-jump "vertico/vertico-quick" "\
Jump to candidate using quick keys." t)

(autoload 'vertico-quick-exit "vertico/vertico-quick" "\
Exit with candidate using quick keys." t)

(autoload 'vertico-quick-insert "vertico/vertico-quick" "\
Insert candidate using quick keys." t)

(register-definition-prefixes "vertico/vertico-quick" '("vertico-quick"))

;;;***

;;;### (autoloads nil "vertico/vertico-repeat" "vertico/vertico-repeat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-repeat.el

(autoload 'vertico-repeat-save "vertico/vertico-repeat" "\
Save Vertico session for `vertico-repeat'.
This function must be registered as `minibuffer-setup-hook'.")

(autoload 'vertico-repeat-next "vertico/vertico-repeat" "\
Repeat Nth next Vertico completion session.
This command must be called from an existing Vertico session
after `vertico-repeat-previous'.

\(fn N)" t)

(autoload 'vertico-repeat-previous "vertico/vertico-repeat" "\
Repeat Nth previous Vertico completion session.
If called from an existing Vertico session, restore the input and
selected candidate for the current command.

\(fn N)" t)

(autoload 'vertico-repeat-select "vertico/vertico-repeat" "\
Select a Vertico session from the session history and repeat it.
If called from an existing Vertico session, you can select among
previous sessions for the current command." t)

(autoload 'vertico-repeat "vertico/vertico-repeat" "\
Repeat last Vertico session.
If prefix ARG is non-nil, offer completion menu to select from session history.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-repeat" '("vertico-repeat-"))

;;;***

;;;### (autoloads nil "vertico/vertico-reverse" "vertico/vertico-reverse.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-reverse.el

(defvar vertico-reverse-mode nil "\
Non-nil if Vertico-Reverse mode is enabled.
See the `vertico-reverse-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-reverse-mode'.")

(custom-autoload 'vertico-reverse-mode "vertico/vertico-reverse" nil)

(autoload 'vertico-reverse-mode "vertico/vertico-reverse" "\
Reverse the Vertico display.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Reverse mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-reverse-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-reverse" '("vertico-reverse-map"))

;;;***

;;;### (autoloads nil "vertico/vertico-suspend" "vertico/vertico-suspend.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-suspend.el

(autoload 'vertico-suspend "vertico/vertico-suspend" "\
Suspend the current completion session.
If the command is invoked from within the Vertico minibuffer, the
current session is suspended.  If the command is invoked from
outside the minibuffer, the active minibuffer is either selected
or the latest completion session is restored." t)

(register-definition-prefixes "vertico/vertico-suspend" '("vertico-suspend--"))

;;;***

;;;### (autoloads nil "vertico/vertico-unobtrusive" "vertico/vertico-unobtrusive.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from vertico/vertico-unobtrusive.el

(defvar vertico-unobtrusive-mode nil "\
Non-nil if Vertico-Unobtrusive mode is enabled.
See the `vertico-unobtrusive-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vertico-unobtrusive-mode'.")

(custom-autoload 'vertico-unobtrusive-mode "vertico/vertico-unobtrusive" nil)

(autoload 'vertico-unobtrusive-mode "vertico/vertico-unobtrusive" "\
Unobtrusive display for Vertico.

This is a global minor mode.  If called interactively, toggle the
`Vertico-Unobtrusive mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='vertico-unobtrusive-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(register-definition-prefixes "vertico/vertico-unobtrusive" '("vertico-unobtrusive--restore"))

;;;***
;;
;;;### (autoloads nil "vlfi/vlf" "vlfi/vlf.el" (0 0 0 0))
;;; Generated autoloads from vlfi/vlf.el

(autoload 'vlf "vlfi/vlf" "\
View Large FILE in batches.  When MINIMAL load just a few bytes.
You can customize number of bytes displayed by customizing
`vlf-batch-size'.
Return newly created buffer.

\(fn FILE &optional MINIMAL)" t)

(register-definition-prefixes "vlfi/vlf" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-base" "vlfi/vlf-base.el" (0 0 0 0))
;;; Generated autoloads from vlfi/vlf-base.el

(register-definition-prefixes "vlfi/vlf-base" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-ediff" "vlfi/vlf-ediff.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from vlfi/vlf-ediff.el

(autoload 'vlf-ediff-files "vlfi/vlf-ediff" "\
Run batch by batch ediff over FILE-A and FILE-B.
Files are processed with VLF with BATCH-SIZE chunks.
Requesting next or previous difference at the end or beginning
respectively of difference list, runs ediff over the adjacent chunks.

\(fn FILE-A FILE-B BATCH-SIZE)" t)

(register-definition-prefixes "vlfi/vlf-ediff" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-follow" "vlfi/vlf-follow.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from vlfi/vlf-follow.el

(register-definition-prefixes "vlfi/vlf-follow" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-occur" "vlfi/vlf-occur.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from vlfi/vlf-occur.el

(autoload 'vlf-occur-load "vlfi/vlf-occur" "\
Load serialized `vlf-occur' results from current buffer." t)

(register-definition-prefixes "vlfi/vlf-occur" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-search" "vlfi/vlf-search.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from vlfi/vlf-search.el

(register-definition-prefixes "vlfi/vlf-search" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-setup" "vlfi/vlf-setup.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from vlfi/vlf-setup.el

(register-definition-prefixes "vlfi/vlf-setup" '("dired-vlf" "vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-tune" "vlfi/vlf-tune.el" (0 0 0 0))
;;; Generated autoloads from vlfi/vlf-tune.el

(register-definition-prefixes "vlfi/vlf-tune" '("vlf-"))

;;;***

;;;### (autoloads nil "vlfi/vlf-write" "vlfi/vlf-write.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from vlfi/vlf-write.el

(register-definition-prefixes "vlfi/vlf-write" '("vlf-"))

;;;***
;;
;;;### (autoloads nil "vundo/vundo" "vundo/vundo.el" (0 0 0 0))
;;; Generated autoloads from vundo/vundo.el

(autoload 'vundo "vundo/vundo" "\
Display visual undo for the current buffer." t)

(register-definition-prefixes "vundo/vundo" '("vundo-"))

;;;***
;;
;;;### (autoloads nil "which-key/which-key" "which-key/which-key.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from which-key/which-key.el

(defvar which-key-mode nil "\
Non-nil if Which-Key mode is enabled.
See the `which-key-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `which-key-mode'.")

(custom-autoload 'which-key-mode "which-key/which-key" nil)

(autoload 'which-key-mode "which-key/which-key" "\
Toggle which-key-mode.

This is a global minor mode.  If called interactively, toggle the
`Which-Key mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='which-key-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(autoload 'which-key-setup-side-window-right "which-key/which-key" "\
Set up side-window on right." t)

(autoload 'which-key-setup-side-window-right-bottom "which-key/which-key" "\
Set up side-window on right if space allows.
Otherwise, use bottom." t)

(autoload 'which-key-setup-side-window-bottom "which-key/which-key" "\
Set up side-window that opens on bottom." t)

(autoload 'which-key-setup-minibuffer "which-key/which-key" "\
Set up minibuffer display.
Do not use this setup if you use the paging commands.  Instead use
`which-key-setup-side-window-bottom', which is nearly identical
but more functional." t)

(autoload 'which-key-add-keymap-based-replacements "which-key/which-key" "\
Replace the description of KEY using REPLACEMENT in KEYMAP.
KEY should take a format suitable for use in `kbd'. REPLACEMENT
should be a cons cell of the form (STRING . COMMAND) for each
REPLACEMENT, where STRING is the replacement string and COMMAND
is a symbol corresponding to the intended command to be
replaced. COMMAND can be nil if the binding corresponds to a key
prefix. An example is

\(which-key-add-keymap-based-replacements global-map
  \"C-x w\" \\='(\"Save as\" . write-file)).

For backwards compatibility, REPLACEMENT can also be a string,
but the above format is preferred, and the option to use a string
for REPLACEMENT will eventually be removed.

\(fn KEYMAP KEY REPLACEMENT &rest MORE)")

(autoload 'which-key-add-key-based-replacements "which-key/which-key" "\
Replace the description of KEY-SEQUENCE with REPLACEMENT.
KEY-SEQUENCE is a string suitable for use in `kbd'. REPLACEMENT
may either be a string, as in

\(which-key-add-key-based-replacements \"C-x 1\" \"maximize\")

a cons of two strings as in

\(which-key-add-key-based-replacements \"C-x 8\"
                                        \\='(\"unicode\" . \"Unicode keys\"))

or a function that takes a (KEY . BINDING) cons and returns a
replacement.

In the second case, the second string is used to provide a longer
name for the keys under a prefix.

MORE allows you to specifcy additional KEY REPLACEMENT pairs.  All
replacements are added to `which-key-replacement-alist'.

\(fn KEY-SEQUENCE REPLACEMENT &rest MORE)")

(autoload 'which-key-add-major-mode-key-based-replacements "which-key/which-key" "\
Functions like `which-key-add-key-based-replacements'.
The difference is that MODE specifies the `major-mode' that must
be active for KEY-SEQUENCE and REPLACEMENT (MORE contains
addition KEY-SEQUENCE REPLACEMENT pairs) to apply.

\(fn MODE KEY-SEQUENCE REPLACEMENT &rest MORE)")

(function-put 'which-key-add-major-mode-key-based-replacements 'lisp-indent-function 'defun)

(autoload 'which-key-reload-key-sequence "which-key/which-key" "\
Simulate entering the key sequence KEY-SEQ.
KEY-SEQ should be a list of events as produced by
`listify-key-sequence'.  If nil, KEY-SEQ defaults to
`which-key--current-key-list'. Any prefix arguments that were
used are reapplied to the new key sequence.

\(fn &optional KEY-SEQ)")

(autoload 'which-key-show-standard-help "which-key/which-key" "\
Call the command in `which-key--prefix-help-cmd-backup'.
Usually this is `describe-prefix-bindings'.

\(fn &optional _)" t)

(autoload 'which-key-show-next-page-no-cycle "which-key/which-key" "\
Show next page of keys or `which-key-show-standard-help'." t)

(autoload 'which-key-show-previous-page-no-cycle "which-key/which-key" "\
Show previous page of keys if one exists." t)

(autoload 'which-key-show-next-page-cycle "which-key/which-key" "\
Show the next page of keys, cycling from end to beginning.

\(fn &optional _)" t)

(autoload 'which-key-show-previous-page-cycle "which-key/which-key" "\
Show the previous page of keys, cycling from beginning to end.

\(fn &optional _)" t)

(autoload 'which-key-show-top-level "which-key/which-key" "\
Show top-level bindings.

\(fn &optional _)" t)

(autoload 'which-key-show-major-mode "which-key/which-key" "\
Show top-level bindings in the map of the current major mode.
This function will also detect evil bindings made using
`evil-define-key' in this map. These bindings will depend on the
current evil state. 

\(fn &optional ALL)" t)

(autoload 'which-key-show-full-major-mode "which-key/which-key" "\
Show all bindings in the map of the current major mode.
This function will also detect evil bindings made using
`evil-define-key' in this map. These bindings will depend on the
current evil state. " t)

(autoload 'which-key-dump-bindings "which-key/which-key" "\
Dump bindings from PREFIX into buffer named BUFFER-NAME.
PREFIX should be a string suitable for `kbd'.

\(fn PREFIX BUFFER-NAME)" t)

(autoload 'which-key-undo-key "which-key/which-key" "\
Undo last keypress and force which-key update.

\(fn &optional _)" t)

(autoload 'which-key-C-h-dispatch "which-key/which-key" "\
Dispatch C-h commands by looking up key in `which-key-C-h-map'.
This command is always accessible (from any prefix) if
`which-key-use-C-h-commands' is non nil." t)

(autoload 'which-key-show-keymap "which-key/which-key" "\
Show the top-level bindings in KEYMAP using which-key.
KEYMAP is selected interactively from all available keymaps.

If NO-PAGING is non-nil, which-key will not intercept subsequent
keypresses for the paging functionality.

\(fn KEYMAP &optional NO-PAGING)" t)

(autoload 'which-key-show-full-keymap "which-key/which-key" "\
Show all bindings in KEYMAP using which-key.
KEYMAP is selected interactively from all available keymaps.

\(fn KEYMAP)" t)

(autoload 'which-key-show-minor-mode-keymap "which-key/which-key" "\
Show the top-level bindings in KEYMAP using which-key.
KEYMAP is selected interactively by mode in
`minor-mode-map-alist'.

\(fn &optional ALL)" t)

(autoload 'which-key-show-full-minor-mode-keymap "which-key/which-key" "\
Show all bindings in KEYMAP using which-key.
KEYMAP is selected interactively by mode in
`minor-mode-map-alist'." t)

(register-definition-prefixes "which-key/which-key" '("evil-state" "which-key-"))

;;;***
;;
;;;### (autoloads nil "xr/xr" "xr/xr.el" (0 0 0 0))
;;; Generated autoloads from xr/xr.el

(autoload 'xr "xr/xr" "\
Convert a regexp string to rx notation; the inverse of `rx'.
Passing the returned value to `rx' (or `rx-to-string') yields a regexp string
equivalent to RE-STRING.  DIALECT controls the choice of keywords,
and is one of:
`verbose'       -- verbose keywords
`brief'         -- short keywords
`terse'         -- very short keywords
`medium' or nil -- a compromise (the default)

\(fn RE-STRING &optional DIALECT)")

(autoload 'xr-skip-set "xr/xr" "\
Convert a skip set string argument to rx notation.
SKIP-SET-STRING is interpreted according to the syntax of
`skip-chars-forward' and `skip-chars-backward' and converted to
a character class on `rx' form.
If desired, `rx' can then be used to convert the result to an
ordinary regexp.
See `xr' for a description of the DIALECT argument.

\(fn SKIP-SET-STRING &optional DIALECT)")

(autoload 'xr-lint "xr/xr" "\
Detect dubious practices and possible mistakes in RE-STRING.
This includes uses of tolerated but discouraged constructs.
Outright regexp syntax violations are signalled as errors.
If PURPOSE is `file', perform additional checks assuming that RE-STRING
is used to match a file name.
Return a list of (OFFSET . COMMENT) where COMMENT applies at OFFSET
in RE-STRING.

\(fn RE-STRING &optional PURPOSE)")

(autoload 'xr-skip-set-lint "xr/xr" "\
Detect dubious practices and possible mistakes in SKIP-SET-STRING.
This includes uses of tolerated but discouraged constructs.
Outright syntax violations are signalled as errors.
The argument is interpreted according to the syntax of
`skip-chars-forward' and `skip-chars-backward'.
Return a list of (OFFSET . COMMENT) where COMMENT applies at OFFSET
in SKIP-SET-STRING.

\(fn SKIP-SET-STRING)")

(autoload 'xr-pp "xr/xr" "\
Convert to `rx' notation and output the pretty-printed result.
This function uses `xr' to translate RE-STRING into DIALECT.
It is intended for use from an interactive elisp session.
See `xr' for a description of the DIALECT argument.

\(fn RE-STRING &optional DIALECT)")

(autoload 'xr-skip-set-pp "xr/xr" "\
Convert a skip set string to `rx' notation and pretty-print.
This function uses `xr-skip-set' to translate SKIP-SET-STRING
into DIALECT.
It is intended for use from an interactive elisp session.
See `xr' for a description of the DIALECT argument.

\(fn SKIP-SET-STRING &optional DIALECT)")

(register-definition-prefixes "xr/xr" '("xr-"))

;;;***
;;
;;;### (autoloads nil "yasnippet/yasnippet" "yasnippet/yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

This is a minor mode.  If called interactively, toggle the `yas
minor mode' mode.  If the prefix argument is positive, enable the
mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `yas-minor-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t)

(put 'yas-global-mode 'globalized-minor-mode t)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the `yas-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive; otherwise,
disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Yas minor mode is enabled in all buffers where `yas-minor-mode-on'
would do it.

See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t)
(autoload 'snippet-mode "yasnippet" "A mode for editing yasnippets" t nil)

(register-definition-prefixes "yasnippet/yasnippet" '("help-snippet-def" "snippet-mode-map" "yas"))

;;;***

;;;### (autoloads nil nil ("avy/avy-test.el" "compat/compat-25.el"
;;;;;;  "compat/compat-26.el" "compat/compat-27.el" "compat/compat-28.el"
;;;;;;  "compat/compat-29.el" "dash/dash-functional.el" "elfeed/elfeed-pkg.el"
;;;;;;  "embark/embark-autoloads.el" "evil/evil-development.el" "evil/evil-keybindings.el"
;;;;;;  "evil/evil-pkg.el" "evil/evil.el" "pyim/pyim-codes.el" "pyim/pyim-imobjs.el"
;;;;;;  "which-key/which-key-tests.el" "xr/xr-test.el" "yasnippet/yasnippet-debug.el"
;;;;;;  "yasnippet/yasnippet-tests.el") (0 0 0 0))

;;;***

;;;### (autoloads nil "achive/achive-utils" "achive/achive-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from achive/achive-utils.el

(register-definition-prefixes "achive/achive-utils" '("achive-"))

;;;***
