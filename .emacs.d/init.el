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

(defun user/gui-frame () ; disable GUI-stuff
  (scroll-bar-mode -1)
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

(defun init () 
  (user/gui-frame)
  ;;(user/evil-init)
  (user/acme-search-init)
  (user/require))

;; Init world
(init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   '("6731049cee8f7cbd542d7b3e1c551f3fab716a92119bd7c77f0bd1ef20849fb8" default))
 '(inhibit-startup-echo-area-message "master")
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(dracula-theme company-lsp hydra lsp-clangd lsp-go lsp-python lsp-rust lsp-sh rust-mode dash use-package))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :box nil :strike-through nil :overline nil :underline nil :slant normal :height 100 :width normal :family "Go Mono"))))
 '(isearch ((t (:background "wheat" :foreground "black"))))
 '(window-divider ((t nil)))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))
