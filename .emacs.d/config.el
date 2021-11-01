;;(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))
;;(package-initialize) < already called
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try :ensure t)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq backup-directory-alist
`((".*" . ,"~/.backups-emacs/")))
(setq auto-save-file-name-transforms
`((".*" ,"~/.backups-emacs/" t)))

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

(setq scroll-preserve-screen-position 1)
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

(fset 'yes-or-no-p 'y-or-n-p)

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

(setq disabled-command-function nil)

;; Smartparens
	 (use-package smartparens
	 :ensure t
	 :init)
	 (smartparens-global-mode 1)
	 ;;(show-smartparens-global-mode 1)
	 ;; ^ This is now replaced by highlight-parentheses mode
	 
	 ;; Highlight parens
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
(add-hook 'after-init-hook 'global-company-mode)

(column-number-mode 1)
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 80)
(display-fill-column-indicator-mode 80)

(setq indent-tabs-mode 1)
(setq-default tab-width 3)

(use-package eglot
:ensure t)

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
(add-hook 'typescript-mode-hook 'eglot-ensure)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(use-package tide
  :ensure t)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; For editing TSX files
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
     (lambda ()
(when (string-equal "tsx" (file-name-extension buffer-file-name))
(setup-tide-mode))))
	  ;; enable typescript-tslint checker
	  (flycheck-add-mode 'typescript-tslint 'web-mode)

(add-hook 'python-mode-hook 'eglot-ensure)

;; Allow <s shortcuts
(require 'org-tempo)

(use-package gruber-darker-theme
:ensure t  :init)
(load-theme 'gruber-darker t)

;; Set font for all frames
(set-frame-font "IBM Plex Mono-11:hinting=true:hintstyle=hintfull\
:autohint=false:antialias=true" :frames t)
