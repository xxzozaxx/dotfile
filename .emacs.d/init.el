;; Don't play with functions that doesn't call in Init function
;; which is the same as functions start ``user/''
;;; Code:
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(eval-when-compile ; Use-package, from it's repo ddg: !git use-package
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))

(defun user/evil-init ()
  (add-to-list 'load-path "~/.emacs.d/evil")
  (require 'evil)
  (evil-mode 1))

(defun user/gui-frame ()      ; disable GUI-stuff
  (scroll-bar-mode t)         ; My little mini-map :P
  (set-scroll-bar-mode 'left)
  ;; (menu-bar-mode -1)
  (tool-bar-mode -1))

(defun user/acme-search-init ()
  (add-to-list 'load-path "~/.emacs.d/acme")
  (require 'acme-search)
  (global-set-key [(mouse-3)] 'acme-search-forward)
  (global-set-key [(shift mouse-3)] 'acme-search-backward))

(defun user/require ()
  (setq modules-dir
	(expand-file-name "modules" user-emacs-directory)
	use-package-always-ensure t)
  (add-to-list 'load-path modules-dir)
  (require 'programming)
  (require 'prog_sml)
  (require 'telegram)
  (require 'emms))
(defun user/scroll ()
  (setq scroll-step            1      ; Scroll line by line via C-n, C-p
	scroll-conservatively  10000) ; IDK

  (defun scroll-down-in-place (n)
    (interactive "p")
    (previous-line n)
    (scroll-down n))

  (defun scroll-up-in-place (n)
    (interactive "p")
    (next-line n)
    (scroll-up n))

  (global-set-key [mouse-4] 'scroll-down-in-place)
  (global-set-key [mouse-5] 'scroll-up-in-place)
  (global-set-key [C-up] 'scroll-down-in-place)
  (global-set-key [C-down] 'scroll-up-in-place))

(defun init () 
  (user/gui-frame)
  ;;(user/evil-init)
  (user/acme-search-init)
  (user/require)
  (user/scroll))

;; Init world
(init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "8f5b54bf6a36fe1c138219960dd324aad8ab1f62f543bed73ef5ad60956e36ae" "d0fd069415ef23ccc21ccb0e54d93bdbb996a6cce48ffce7f810826bb243502c" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "5f1bd7f67dc1598977e69c6a0aed3c926f49581fdf395a6246f9bc1df86cb030" "6731049cee8f7cbd542d7b3e1c551f3fab716a92119bd7c77f0bd1ef20849fb8" default))
 '(inhibit-startup-echo-area-message "master")
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(almost-mono-themes color-theme-gruber-darker gruber-darker-theme ag minimal-theme dracula-theme company-lsp hydra lsp-clangd lsp-go lsp-python lsp-rust lsp-sh rust-mode dash use-package))
 '(visible-bell t)
 '(whitespace-display-mappings
   '((space-mark 32
		 [8226]
		 [8226])
     (space-mark 160
		 [164]
		 [95])
     (tab-mark 9
	       [9475 32 32 32]
	       [92 9])))
 '(whitespace-line-column 120)
 '(whitespace-space-after-tab-regexp '("	+\\(\\( \\{%d,\\}\\)+\\)" . "\\(	+\\) \\{%d,\\}")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :box nil :strike-through nil :overline nil :underline nil :slant normal :height 100 :width normal :family "Go Mono"))))
 '(isearch ((t (:background "wheat" :foreground "black"))))
 '(whitespace-big-indent ((t (:foreground "firebrick"))))
 '(whitespace-empty ((t (:background "yellow"))))
 '(whitespace-indentation ((t (:foreground "firebrick"))))
 '(whitespace-line ((t (:foreground "violet"))))
 '(whitespace-space ((t (:foreground "darkgray"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "darkgray"))))
 '(whitespace-trailing ((t (:foreground "yellow" :weight bold))))
 '(window-divider ((t nil)))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))
