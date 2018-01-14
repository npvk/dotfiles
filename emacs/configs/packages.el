;;; init.el --- My emacs conifg -*- lexical-binding: t -*-
;; Author: Noah Pavuk <pavuk.10@osu.edu>
;;; Commentary:
;;  This is an Emacs init file.

(setq package--init-file-ensured t)
                                        ; list the packages you want
(setq package-list '(linum-relative rainbow-delimiters go-mode))

                                        ; list the repositories containing them
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ;; ("marmalade" . "http://marmalade-repo.org/packages/")
	))

;; https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
                                        ; activate all the packages (in particular autoloads)
(package-initialize)

                                        ; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

                                        ; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; All package customizations should go down here

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(setq org-latex-logfiles-extensions (quote ("tex" "lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
