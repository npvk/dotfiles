;; not much in here because windows fucking sucks with emacs, ffs
;; mostly shit from dicking around @ work

;; unicode boys
;; put ur own shit in here
(define-key key-translation-map (kbd "<f9> i") (kbd "∞"))
(define-key key-translation-map (kbd "<f9> <right>") (kbd "→"))

;; for windows users whom unintentionally exit emacs
(setq kill-emacs-query-functions
  (list (function (lambda ()
                    (ding)
                    (y-or-n-p "Really quit? ")))))

;; Cause the region to be highlighted and prevent region-based commands
;; from running when the mark isn't active.
;; (pending-delete-mode t)
;;  (setq transient-mark-mode t)

;; Fonts are automatically highlighted.  For more information
;; type M-x describe-mode font-lock-mode
(global-font-lock-mode t)

(defun newline-indents ()
  "Bind Return to `newline-and-indent' in the local keymap."
  (local-set-key "\C-m" 'newline-and-indent))

;; This function is used in various programming language mode hooks below.  It
;; does indentation after every newline when writing a program.

;; Tell Emacs to use the function above in certain editing modes.

(add-hook 'lisp-mode-hook             (function newline-indents))
(add-hook 'emacs-lisp-mode-hook       (function newline-indents))
(add-hook 'lisp-interaction-mode-hook (function newline-indents))
(add-hook 'scheme-mode-hook           (function newline-indents))
(add-hook 'c-mode-hook                (function newline-indents))
(add-hook 'c++-mode-hook              (function newline-indents))
(add-hook 'java-mode-hook             (function newline-indents))
