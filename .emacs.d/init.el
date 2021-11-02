;; Load org babel config
(package-initialize)
(org-babel-load-file "~/.dotfiles/.emacs.d/config.org")

;; ========================================================
;; What follows are customization variables set in emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/.dotfiles/.emacs.d/config.org" "~/Personal/todo.org"))
 '(package-selected-packages
	'(evil web-mode use-package try tide smartparens highlight-parentheses helpful gruvbox-theme gruber-darker-theme eglot company ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
