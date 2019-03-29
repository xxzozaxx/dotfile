;; Don't play with functions that doesn't call in Init function
;; which is the same as functions start e' ``user/''

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;(add-to-list 'load-path "<path where use-package is installed>")
(add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))


(defun user/evil-init ()
  (add-to-list 'load-path "~/.emacs.d/evil")
  (require 'evil)
  (evil-mode 1))

(defun user/disable-stuff ()
  ; disable GUI-stuff
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  )

(defun user/viper-init ()
  "viper is VI PERil, a vi-emulator build-in emacs"
  (setq viper-mode t
	viper-auto-indent t
	viper-emacs-state-cursor-color "Blue"
	viper-syntax-perference 'strict-vi)
  (require 'viper))

(defun user/acme-search-init ()
  (add-to-list 'load-path "~/.emacs.d/acme")
  (require 'acme-search)
  (global-set-key [(mouse-3)] 'acme-search-forward)
  (global-set-key [(shift mouse-3)] 'acme-search-backward))

(use-package lsp-mode
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)

(defun init () 
  (user/disable-stuff)
  ;(user/viper-init)
  (user/evil-init)
  (user/acme-search-init))

;; Init world
(init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-echo-area-message "master")
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages '(use-package))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#ffffdd" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 100 :width normal :foundry "    " :family "verily Serif Mono"))))
 '(isearch ((t (:background "wheat" :foreground "black"))))
 '(window-divider ((t nil)))
 '(window-divider-first-pixel ((t nil)))
 '(window-divider-last-pixel ((t nil))))