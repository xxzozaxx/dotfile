;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; UI λ () {} [] :;,. __-- 0oO
(setq display-line-numbers-type nil)    ; no line number unless I want
(setq fancy-splash-image "~/Pictures/Logo2.png") ; custom banner.
(setq doom-font (font-spec :family "Monospace" :weight 'bold :size 13))

;; Apps
(after! elfeed
       (setq rmh-elfeed-org-files (list "~/.spacemacs.d/rssfeed.org")))

(after! mu4e
  (setq mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/"
        +mu4e-backend 'offlineimap)
  (load-file "~/.spacemacs.d/mail.el"))

(use-package! emojify :defer t)
