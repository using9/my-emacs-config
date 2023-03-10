ESUP - Emacs Start Up Profiler
==============================

[![Build Status][actions badge]][actions link]
[![MELPA][melpa badge]][melpa link]
[![MELPA Stable][melpa-s badge]][melpa-s link]

Benchmark Emacs Startup time without ever leaving your Emacs.

<p align="center">
  <img src="./esup-screenshot.png" width="512" height="504"/>
</p>

Installation
============

Known to work with GNU Emacs 25.1 and later. Esup may work with
older versions of Emacs, but this is NOT guaranteed. Bug reports
for problems related to using Esup with older versions of
Emacs will most like not be addressed.

**With MELPA**

First, add the package repository:

```lisp
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
```

Then install esup:

<kbd>M-x package-install RET esup RET</kbd>

**El-Get**

`esup` is included in the El-Get repository

Install esup:

<kbd>M-x el-get-install RET esup RET</kbd>

**Manually**

Download `esup.el` and place the download directory on your
`load-path` like so:

```lisp
(add-to-list 'load-path "~/.emacs.d/path/to/esup")
(autoload 'esup "esup" "Emacs Start Up Profiler." nil)
```

Usage
=====

To start Esup, run <kbd>M-x esup</kbd>, and watch the magic happen.

## Profile a custom file with esup

By default, esup will profile `user-init-file`.  To profile a custom
file, call `esup` with a prefix argument.  That is, <kbd>C-u M-x esup</kbd>.


Developing
==========

Patches are always welcome.  To submit a patch, use something like the following
workflow.

``` sh
git clone https://github.com/jschaf/esup.git
cd esup
git checkout -b MY-NEW-FIX
```

Implement your fix.  Please use [angular-style commit messages](https://github.com/angular/angular.js/blob/master/CONTRIBUTING.md#-git-commit-guidelines).

Ensure that all elisp code is lint-clean with flycheck.

Test your fix with [Cask](https://github.com/cask/cask).  You can install cask with:

``` sh
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
export PATH="/home/joe/.cask/bin:$PATH"

```

Test your fixes with the Emacs Regression Test runner.


```
make test
```

Send your commits for review.

```
git push origin MY-NEW-FIX
```

Create a pull request with the normal Github user interface.

[actions badge]: https://github.com/jschaf/esup/workflows/build/badge.svg
[actions link]: https://github.com/jschaf/esup/actions
[melpa badge]: http://melpa.org/packages/esup-badge.svg
[melpa link]: http://melpa.org/#/esup
[melpa-s badge]: https://stable.melpa.org/packages/esup-badge.svg
[melpa-s link]: https://stable.melpa.org/#/esup
