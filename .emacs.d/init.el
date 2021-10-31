;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-faces-vector
;; 	[default default default italic underline success warning error])
;;  '(custom-safe-themes
;; 	'("6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
;;  '(package-selected-packages
;; 	'(helpful company smartparens smart-parens ace-window which-key try use-package)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Boostrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))                                     

(use-package try :ensure t)

;;(use-package which-key
;;	     :ensure t
;;	     :config
;;	     (which-key-mode))

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere 1)
(ido-mode 1)
(icomplete-mode 1) 
(defalias 'list-buffers 'ibuffer) ; Make ibuffer default

;; Show numbers when doing C-x o
(use-package ace-window
  :ensure t
  :init
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    )

;; Use the variable "~/.backups-emacs" to store backup files
(setq backup-directory-alist
      `((".*" . ,"~/.backups-emacs")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.backups-emacs" t)))


;; Enable scrolling by line, without moving pointer M-n M-p
(setq scroll-preserve-screen-position 1)
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;; type y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Smartparens
(use-package smartparens
  :ensure t
  :init)
(smartparens-global-mode 1)
;;(show-smartparens-global-mode 1)
;; ^ This is now replaced by highlight-parentheses mode

;; Prettify symbols
(global-prettify-symbols-mode 1)

;; Comp any
(use-package company
  :ensure t
  :init)
(add-hook 'after-init-hook 'global-company-mode)

(scroll-bar-mode -1)

;; Theme
(use-package gruber-darker-theme
  :ensure t  :init)
(load-theme 'gruber-darker t)

;; Set font for all frames
(set-frame-font "IBM Plex Mono-11:hinting=true:hintstyle=hintfull\
:autohint=false:antialias=true" :frames t)

;; Set column rule
(column-number-mode 1)
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 80)
(display-fill-column-indicator-mode 80)

;; Set indents to tab
(setq indent-tabs-mode 1)
(setq-default tab-width 3)


;; HELPFUL ======================
(use-package helpful
  :ensure t)

(global-set-key (kbd "C-h f") #'helpful-callable)
;; (global-set-key (kbd "C-h f") #'helpful-function)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)

;; Set help buffers to display in current buffer
(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))
;; Lookup the current symbol at point. C-c C-d is a common keybinding
;; for this in lisp modes.
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Look up *F*unctions (excludes macros).
;;
;; By default, C-h F is bound to `Info-goto-emacs-command-node'. Helpful
;; already links to the manual, if a function is referenced there.
(global-set-key (kbd "C-h F") #'helpful-function)

;; Look up *C*ommands.
;;
;; By default, C-h C is bound to describe `describe-coding-system'. I
;; don't find this very useful, but it's frequently useful to only
;; look at interactive functions.
(global-set-key (kbd "C-h C") #'helpful-command)


;; HIGLIGHT-PARENS =============================
;; Add paren highlight when cursor enclosed in paren
(use-package highlight-parentheses
  :ensure t :init)

;; turn it on when in prog-mode
;;(add-hook 'prog-mode-hook #'highlight-parentheses-mode)

;; Enable for minibuffer
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)
;; Enable global mode
(global-highlight-parentheses-mode 1)


;; LSP ========================
;;Eglot lsp
(use-package eglot
  :ensure t)


