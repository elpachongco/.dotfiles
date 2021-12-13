;;; init.el --- Summary

;;; Commentary:
;; Loads config from the org babel file ~/.dotfiles/.emacs.d/config.org

;;; Code:
(package-initialize)
(org-babel-load-file "~/.dotfiles/.emacs.d/config.org")



;; ========================================================
;; customization variables set by emacs in the following lines:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	'("6bf841f77d5eb01455d82ae436e3e25277daaef4ee855a3572589dad1b3ac4b3" "7152ab5bf548cc6215efc513442e7bb59de9eff4b5737eaed3a1a4f42789612c" "9271c0ad73ef29af016032376d36e8aed4e89eff17908c0b578c33e54dfa1da1" "5dbdb4a71a0e834318ae868143bb4329be492dd04bdf8b398fb103ba1b8c681a" default))
 '(org-agenda-files
	'("~/hdd1/Programming/Projects/Chezemacs/README.org" "/home/norm/.dotfiles/.emacs.d/config.org" "/home/norm/Personal/cv.org" "/home/norm/Personal/todo.org"))
 '(package-selected-packages
	'(centered-cursor-mode https://raw\.githubusercontent\.com/andre-r/centered-cursor-mode\.el/master/centered-cursor-mode\.el solarized-theme yasnippet-snippets yasnippet which-key lsp-mode flycheck-pos-tip flycheck annotate nov nyan-mode go-mode evil web-mode use-package try tide smartparens highlight-parentheses helpful gruvbox-theme gruber-darker-theme eglot company ace-window))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(whitespace-tab ((t (:foreground "#636363")))))
