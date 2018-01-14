;;; init.el --- My emacs conifg -*- lexical-binding: t -*-
;; Author: Noah Pavuk <pavuk.10@osu.edu>
;;; Commentary:
;;  This is an Emacs init file.
;; ✌️(◕‿-)✌️


(load (concat user-emacs-directory "configs/packages.el"))

(load (concat user-emacs-directory "configs/generic.el"))

(cond ((eq system-type 'darwin)
       (load (concat user-emacs-directory "configs/macOS.el")))
      ((eq system-type 'windows-nt)
       (load (concat user-emacs-directory "configs/windows.el"))))

;;TODO set make setting themes ez
;; commented out linum mode style due to it scaling really porly
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/theme.el")
(load-theme 'cyberpunk t)

;; to save future customizations from 'm-x customize'
(setq custom-file (concat user-emacs-directory "configs/custom.el"))
     (load custom-file)

;; edgy font
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-20" ))
;; (set-face-attribute 'default t :font "Source Code Pro-20" )
;; (put 'upcase-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)

;; fuck
(ac-config-default)
;; (fringe-mode 3)
(setq multi-term-program "/bin/zsh")


(setq org-startup-with-inline-images t)
