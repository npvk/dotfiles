;;; init.el --- My emacs conifg -*- lexical-binding: t -*-
;; Author: Noah Pavuk <pavuk.10@osu.edu>
;;; Commentary:
;;  This is my Emacs init file.  For now it's nothing special - probably pretty bad,
;;  but whatever.

;;; Code:
;; Give a little status when this loads up.
(message "reading emacs init.el!")

;; hides all the extraneous crap
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; no fucking spash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; fix the annoying files from being placed everywhere
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;TODO read about ido mode!!!!!
;;ido-mode
;;(ido-mode 1)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)

;;TODO<http://home.thep.lu.se/~karlf/emacs.html#sec-2> i'll uncomment this later when i figureout what it does.
;; ;;Initialize files----------------------------
;; ;; Where to find external lisp-files, for modes, etc. I put my *el
;; ;; files in "~/.emacs.d/elisp/" where ~/.emacs.d/ is the
;; ;; user-emacs-directory
;; (add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
;; ;;--------------------------------------------

;; some shit i copped from <http://emacsblog.org/2008/12/06/quick-tip-detaching-the-custom-file/>
;; this keeps the streets clean.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;;TODO fix load path??? not too sure about what it does
;; You can change the path here
;;(add-to-list 'load-path "~/.emacs.d/lisp")

;; Ez mode keybinds.
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)
;; window navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


(if (eq system-type 'darwin)
	(progn
	  (setq mac-option-modifier 'meta)
	  (setq mac-command-modifier 'hyper)))

;;TODO unsure if all of these are required!
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(set-face-attribute
 'default nil
 :family "DejaVu Sans Mono for Powerline")
;;TODO get a more sound implementation of emoji!
;;(require 'unicode-fonts)
;;(unicode-fonts-setup)
(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

;;TODO get a good frame title format
(setq frame-title-format '(""
      global-mode-string "     %f" ))
    ;; See also:  `display-time-format' and `mode-line-format'

;;; Melpa install
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;TODO fix this org-mess
;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode
		  (lambda ()
			(defvar org-src-fontify-natively)
			(setq org-src-fontify-natively t)
			))
(add-hook 'org-mode-hook (lambda ()
						   (org-bullets-mode 1)
						   (linum-mode 0)
						   (setq 'org-src-fontify-natively t)))
(setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))

;;TODO fix tab columns tab width of 4 meme
(setq tab-width 4) ; or any other preferred value
(setq-default c-basic-offset 4)
;;TODO fix shitty return thing
;;auto indent to mess with
;; (define-key global-map (kbd "RET") 'newline-and-indent)

;;TODO get my hooks working for the rest of them
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(ac-config-default)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'prog-mode-hook 'flycheck-mode)

;;TODO future shit
;; skewer-mode
;;(add-hook 'js2-mode-hook 'skewer-mode)
;;(add-hook 'css-mode-hook 'skewer-css-mode)
;;(add-hook 'html-mode-hook 'skewer-html-mode)
;; js2-acutocopmlete
;;(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(setq ac-js2-evaluate-calls t)

;;; Themes!
;;I have two installed currently, kinky cyberpunk and super solarized
;; comment out the one not wanting to be used
;;=================================================================================================
;; Solarized theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized") ;; add solarized theme path
;;(load-theme 'solarized t) ;; load solarized theme
;;(set-frame-parameter nil 'background-mode 'dark) ;; make it dark
;;(enable-theme 'solarized) ;;enable theme
;;=================================================================================================
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/cyberpunk-theme.el")
(load-theme 'cyberpunk t)
;;=================================================================================================
;; TODO wtf is this
;; (add-to-list 'jka-compr-compression-info-list
;;              ["\\.plist$"
;;               "converting text XML to binary plist"
;;               "plutil"
;;               ("-convert" "binary1" "-o" "-" "-")
;;               "converting binary plist to text XML"
;;               "plutil"
;;               ("-convert" "xml1" "-o" "-" "-")
;;               nil nil "bplist"])

;;TODO -find out what this is!
;;It is necessary to perform an update!
;;(jka-compr-update)

;;TODO rainbow meme
;;(require 'rainbow-delimiters)

;;TODO org babel dictionary!
;; (org-babel-do-load-languages
;;  'org-babel-load-languages '((C . t)))

;;TODO fix wierd line overflow bug <http://stackoverflow.com/questions/9304192/emacs-linum-mode-and-size-of-font-unreadable-line-numbers>
(global-linum-mode 1)
(linum-relative-mode 1)

;;; gg
;;; init.el ends here
