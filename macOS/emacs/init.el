;;; Package --- Summary

;;; Commentary:
;; my init file

;;; Code:
;; Keybonds
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)


;; Setting English Font
;;(set-face-attribute
;;  'default nil :stipple nil :height 130 :width 'normal :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant 'normal :weight 'normal :foundry "outline" :family "DejaVu Sans Mono for Powerline")

(set-face-attribute
  'default nil  :family "DejaVu Sans Mono for Powerline")


(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))







;; Keybonds
  (setq frame-title-format '(""
      global-mode-string "     %f" ))
    ;; See also:  `display-time-format' and `mode-line-format'

;; Melpa install
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)




;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))

(add-hook 'org-mode-hook (lambda ()
						   (org-bullets-mode 1)
						   (linum-mode 0)
						   (setq org-src-fontify-natively t)

						   
						   ))


(setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"))






;; tab width of 4 meme
(setq tab-width 4) ; or any other preferred value
(setq-default c-basic-offset 4)

;; rainbow delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; auto-complete
(ac-config-default)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; flycheck
(add-hook 'prog-mode-hook 'flycheck-mode)


(add-hook 'org-mode
		  (lambda ()
			(defvar org-src-fontify-natively)
			(setq org-src-fontify-natively t)
			))




;; skewer-mode
;;(add-hook 'js2-mode-hook 'skewer-mode)
;;(add-hook 'css-mode-hook 'skewer-css-mode)
;;(add-hook 'html-mode-hook 'skewer-html-mode)

;; js2-acutocopmlete
;;(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(setq ac-js2-evaluate-calls t)




;; You can change the path here
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Solarized theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized") ;; add solarized theme path
;;(load-theme 'solarized t) ;; load solarized theme
;;(set-frame-parameter nil 'background-mode 'dark) ;; make it dark
;;(enable-theme 'solarized) ;;enable theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/cyberpunk-theme.el")
(load-theme 'cyberpunk t)

;; Allow editing of binary .plist files.
(add-to-list 'jka-compr-compression-info-list
             ["\\.plist$"
              "converting text XML to binary plist"
              "plutil"
              ("-convert" "binary1" "-o" "-" "-")
              "converting binary plist to text XML"
              "plutil"
              ("-convert" "xml1" "-o" "-" "-")
              nil nil "bplist"])

;;It is necessary to perform an update!
(jka-compr-update)

;; TODO: rainbow meme
;;(require 'rainbow-delimiters)

;; hides all the extraneous crap
;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; enable line numbers
;;fix
(global-linum-mode 1)


;; no fucking spash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; fix the annoying files from being placed everywhere
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; window navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;;auto indent to mess with
;; (define-key global-map (kbd "RET") 'newline-and-indent)

;; disable auto-save and auto-backup
;;(setq auto-save-default nil)
;;(setq make-backup-files nil)
;; prevents auto-save-list directory
;;(setq auto-save-list-file-prefix nil)

;;ido-mode
;;(ido-mode 1)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)

;;(require 'unicode-fonts)
;;(unicode-fonts-setup)
(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (org-bullets linum-relative unicode-fonts font-utils fontawesome persistent-soft ucs-utils smooth-scroll smooth-scrolling rainbow-delimiters ac-js2 skewer-mode auto-complete js2-mode paradox exec-path-from-shell flycheck)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))



;;; init.el ends here
