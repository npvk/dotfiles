;;; This file loads generic emacs setting

;; hides all the extraneous crap
;;https://github.com/zonuexe/dotfiles/blob/master/.emacs.d/init.el
;; set frindges

(if window-system
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(column-number-mode t)

;;TODO get a good frame title format
;; Currently just hanging with the open file
(setq frame-title-format '(""
      global-mode-string "     %f" ))
    ;; See also:  `display-time-format' and `mode-line-format'

;; no fucking spash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; hover over windows to select them, its nice.
(setq mouse-autoselect-window t)


;; fix the annoying files from being placed everywhere
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))
;; solution, just disable it.
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; Ez mode keybinds.
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper f)] 'toggle-frame-fullscreen)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper g)] [(ctrl g)])
(global-set-key [(hyper w)]
                (lambda () (interactive) (save-buffers-kill-emacs)))
(global-set-key [(hyper z)] 'undo)

;; window navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;;TODO unsure if all of these are required!
;; UTF-8 boys
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; TFW laptop barks
(setq visible-bell 1)

;; Trailing white space buster
(setq-default show-trailing-whitespace nil)
(setq-default indicate-empty-lines nil)


;; ido-mode!
(require 'ido)
(ido-mode t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-relative-mode)

;; a right click menu
;; (global-set-key [down-mouse-3] 'mouse-buffer-menu)
;; C-down-mouse-2 is bound in facemenu.el.
;; (global-set-key [down-mouse-3]
;;   `(menu-item ,(purecopy "Menu Bar") ignore
;;     :filter (lambda (_)
;;               (if (zerop (or (frame-parameter nil 'menu-bar-lines) 0))
;;                   (mouse-menu-bar-map)
;;                 (mouse-menu-major-mode-map)))))



(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; 🅱️rogrammer Holy War
(setq-default indent-tabs-mode t)

;; disable electric-indent-mode (it sucks)
;; (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; line ending resolution
(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))
(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))
(defun mac-file ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))
