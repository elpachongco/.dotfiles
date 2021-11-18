;;(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize) < already called
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try :ensure t)

;; Show numbers when doing C-x o
;;  (use-package ace-window
;; :ensure t
;; :init
;;   (global-set-key [remap other-window] 'ace-window)
;;   (custom-set-faces
;;    '(aw-leading-char-face
;;      ((t (:inherit ace-jump-face-foreground :height 3.0)))))
;;   )

(setq scroll-preserve-screen-position 1)
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq ido-enable-flex-matching t)
(setq ido-everywhere 1)
(ido-mode 1)
(icomplete-mode 1) 
(defalias 'list-buffers 'ibuffer) ; Make ibuffer default

(setq initial-buffer-choice "~/Personal/todo.org")

(global-auto-revert-mode t)

(setq use-dialog-box nil)

(fset 'yes-or-no-p 'y-or-n-p)

(setq disabled-command-function nil)

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

(winner-mode 1)

(setq backup-directory-alist
`((".*" . ,"~/.backups-emacs/")))
(setq auto-save-file-name-transforms
`((".*" ,"~/.backups-emacs/" t)))

;; Smartparens
	 (use-package smartparens
	 :ensure t
	 :init)
	 (smartparens-global-mode 1)
	 ;;(show-smartparens-global-mode 1)
	 ;; ^ This is now replaced by highlight-parentheses mode

	 ;; Highlight parens
	 (show-paren-mode -1)
(use-package highlight-parentheses
  :ensure t :init)

;; turn it on when in prog-mode
;;(add-hook 'prog-mode-hook #'highlight-parentheses-mode)

;; Enable for minibuffer
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)
;; Enable global mode
(global-highlight-parentheses-mode 1)

(global-prettify-symbols-mode 1)

(use-package company
:ensure t
:init)
;; Set delay for completion to low
(setq company-tooltip-idle-delay 0.1)
(setq company-idle-delay 0.08)
(add-hook 'after-init-hook 'global-company-mode)

(column-number-mode 1)
(setq-default fill-column 80)
;; Enable automatically on prog mode
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode) 
;;(global-display-fill-column-indicator-mode 80)
;;(display-fill-column-indicator-mode 80)

(setq indent-tabs-mode 1)
(setq-default tab-width 3)

;(use-package eglot :ensure t)

(use-package lsp-mode
	      :ensure t
	      :init
	      ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
	      ;; (setq lsp-keymap-prefix "C-c l")
	      (setq lsp-keymap-prefix "M-l")
	      :hook (
				(go-mode . lsp)
				(typescript-mode . lsp)
				(python-mode . lsp)
				(web-mode . lsp))
	      :commands lsp)

(setq lsp-headerline-breadcrumb-enable nil) 
(use-package which-key
	      :ensure t
	      :config
	      (which-key-mode))

(with-eval-after-load 'lsp-mode
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(setq which-key-idle-delay 0.2)

;; optionally
(use-package lsp-ui :ensure t :commands lsp-ui-mode
:config (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions) 
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
) 
(setq lsp-ui-doc-position "At point")

(use-package evil
:ensure t)
(evil-mode 1)
;; This makes C-[ (escape) work when evil-mode is called
(setq evil-intercept-esc 'always)

;; Set tab to org cycle when in org mode, not evil tab
       (evil-define-key 'normal org-mode-map (kbd "TAB") #'org-cycle) 
       (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle) 
;; Set default state for buffers depending on major mode
       (evil-set-initial-state 'dired-mode 'normal)
       (evil-set-initial-state 'eshell-mode 'emacs)
       (evil-set-initial-state 'shell-mode 'emacs)

;; Set evil to change cursor when in terminal mode 
      (use-package evil-terminal-cursor-changer
      :ensure t)
(unless (display-graphic-p)
		       (require 'evil-terminal-cursor-changer)
		       (evil-terminal-cursor-changer-activate) ; or (etcc-on)
		       )

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq whitespace-style '(face tabs tab-mark))
(custom-set-faces
'(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
'((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

(use-package flycheck
:ensure t
:init (global-flycheck-mode))

(use-package flycheck-pos-tip :ensure t)
(with-eval-after-load 'flycheck
(flycheck-pos-tip-mode))

(add-hook 'prog-mode-hook 'toggle-truncate-lines)

(use-package web-mode
      :ensure t)

;; Web mode when editing html
      (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
      ;; Web mode when editing other formats
      (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(use-package typescript-mode
:ensure t)
;(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;(add-hook 'python-mode-hook 'eglot-ensure)

(use-package go-mode
:ensure t) 
;(add-hook 'go-mode-hook 'eglot-ensure)

;; Allow <s shortcuts
(require 'org-tempo)
 (global-set-key (kbd "C-c l") #'org-store-link)

(global-set-key (kbd "C-c a") #'org-agenda)

(global-set-key (kbd "C-c c") #'org-capture)

(setq org-capture-templates
	 '(("t" "Todo" entry (file+headline "~/Personal/todo.org" "Tasks")
		       "* TODO %?\n  %i\n  %a")
		       ("j" "Journal" entry (file+datetree "~/Personal/journal.org")
		       "* %?\nEntered on %U\n  %i\n  %a")))

(global-hl-line-mode 1)

;;(blink-cursor-mode 0)
(setq blink-cursor-blinks 0)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; DARK
(use-package gruber-darker-theme
:ensure t )
(load-theme 'gruber-darker t)

;; LIGHT
;;(use-package )

;; Set font for all frames
(set-frame-font "IBM Plex Mono:pixelsize=13:slant=normal:width=normal:hinting=true:hintstyle=hintfull\
:scalable=true:autohint=false:antialias=true" :frames t)

(line-number-mode -1)
(column-number-mode 1)

(use-package nyan-mode
      :ensure t)

(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 17)
(setq nyan-animation-frame-interval 0.05)

(if (display-graphic-p)
     (nyan-mode 1)
	  )

;; Notify when /notice to me
(setq erc-echo-notices-in-minibuffer-flag t)

(use-package nov :ensure t)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; Setup font for epubs
(defun my-nov-font-setup ()
(face-remap-add-relative 'variable-pitch :family "Liberation Serif"
														       :height 1.0))
(add-hook 'nov-mode-hook 'my-nov-font-setup)

;; Set text width
(setq nov-text-width 60)

;; Allows annotation
(use-package annotate :ensure t)
(setq annotate-file "~/.backups-emacs/annotations")

;; C-c C-a to annotate or edit existing region
;; C-c ] jump to next or ] to previous

(use-package yasnippet :ensure t)
(use-package yasnippet-snippets :ensure t)
(yas-global-mode)

(use-package centered-cursor-mode
	 :ensure t)
