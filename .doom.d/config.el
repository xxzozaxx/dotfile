;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; UI
(setq display-line-numbers-type nil)    ; no line number unless I want
(setq doom-font (font-spec :family "Neep" :size 16)
      doom-variable-pitch-font (font-spec :family "Go Mono" :size 12)
      doom-big-font (font-spec :family "Go Mono" :size 19))

;; Apps
(after! elfeed
       (setq rmh-elfeed-org-files (list "~/.spacemacs.d/rssfeed.org")))

(after! mu4e
  (setq mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/"
        +mu4e-backend 'offlineimap)
  (load-file "~/.spacemacs.d/mail.el"))

(use-package! emojify :defer t)
