;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;; Increase gc-cons-threshold, depending on your system you may set it back to a
;; lower value in your dotfile (function `dotspacemacs/user-config')
(setq gc-cons-threshold 100000000)

(defconst spacemacs-version         "0.200.13" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.4" "Minimal version of Emacs.")

(if (not (version<= spacemacs-emacs-min-version emacs-version))
    (error (concat "Your version of Emacs (%s) is too old. "
                   "Spacemacs requires Emacs version %s or above.")
           emacs-version spacemacs-emacs-min-version)
  (load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs-buffer/display-startup-note)
  (spacemacs/setup-startup-hook)
  (require 'server)
  (unless (server-running-p) (server-start)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#1b1818" "#ca4949" "#4b8b8b" "#a06e3b" "#7272ca" "#8464c4" "#7272ca" "#8a8585"] t)
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(ecb-options-version "2.50")
 '(evil-want-Y-yank-to-eol nil)
 '(eww-form-checkbox-selected-symbol "☑")
 '(eww-form-checkbox-symbol "☐")
 '(fci-rule-color "#010F1D" t)
 '(highlight-changes-colors '("#EF5350" "#7E57C2"))
 '(highlight-tail-colors
   '(("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100)))
 '(line-spacing 0.2)
 '(magit-diff-use-overlays nil)
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces))
 '(mode-line-in-non-selected-windows t)
 '(mode-line-percent-position '(-3 "%o"))
 '(org-agenda-files '("~/Documents/PIM/gcal.org" "~/Documents/PIM/Agenda.org"))
 '(package-selected-packages
   '(esxml transient lv carbon-now-sh ox-tufte ebib ox-trac auctex-latexmk inverse-acme-theme plan9-theme xbm-life org-gcal request-deferred spaceline-all-the-icons doom-modeline lsp-ui company-lsp lsp-mode darktooth-theme darkokai-theme flymd company-emacs-eclim eclim badwolf-theme pandoc-mode ox-pandoc latex-math-preview typo olivetti minimap calfw-gcal ascii-art-to-unicode kanban w3 org-timeline calfw calfw-org d-mode company-dcd flycheck-dmd-dub nov nyx-theme graphviz-dot-mode treepy graphql all-the-icons memoize writeroom-mode racer monotropic-theme monokai-alt-theme monokai-theme ranger evil-snipe weechat go-guru go-eldoc company-go go-mode circe org-outline-numbering outshine sqlite esqlite pcsv poet-theme autothemer symon speed-type monochrome-theme ibuffer-sidebar focus zeno-theme ecb fuzzy company-web web-completion-data company-tern tern company-statistics company-shell company-cabal company-c-headers company-auctex company-anaconda common-lisp-snippets auto-yasnippet ac-ispell auto-complete toml-mode flycheck-rust cargo rust-mode challenger-deep-theme night-owl-theme git-gutter smart-tabs-mode volatile-highlights vi-tilde-fringe uuidgen toc-org restart-emacs request rainbow-delimiters persp-mode paradox spinner org-bullets open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete highlight-numbers parent-mode highlight-indentation google-translate golden-ratio flx-ido fill-column-indicator fancy-battery evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight dumb-jump column-enforce-mode clean-aindent-mode auto-highlight-symbol adaptive-wrap ace-link gruvbox-theme web-beautify livid-mode skewer-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode color-theme-modern rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby rcirc-notify rcirc-color eyebrowse spaceline all-the-icons-ivy dracula-theme racket-mode faceup hl-todo highlight-parentheses doom-themes define-word aggressive-indent smartparens plain-theme doom-dracula-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-nixos-options helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag flyspell-correct-helm ace-jump-helm-line expand-region bitlbee stumpwm-mode nand2tetris-assembler company-nand2tetris nand2tetris all-the-icons-dired dired-sidebar dired-k diredfl dired-subtree dired-rainbow dired-quick-sort dired-narrow dired-hacks-utils dired-collapse rich-minority sml-modeline stickyfunc-enhance srefactor selectric-mode insert-shebang fish-mode zoom ws-butler winum zeal-at-point yapfify xterm-color web-mode tagedit smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode rainbow-mode rainbow-identifiers pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pdf-tools tablist orgit org-projectile org-category-capture org-present org-pomodoro org-mime org-download ob-sml sml-mode nixos-options nix-mode multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode less-css-mode intero imenu-list ibuffer-projectile hy-mode htmlize hlint-refactor hindent haskell-snippets yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elfeed-web simple-httpd elfeed-org org-plus-contrib elfeed-goodies ace-jump-mode noflet powerline popwin elfeed disaster cython-mode counsel-dash helm-dash dash-functional company-ghci company-ghc ghc company haskell-mode color-identifiers-mode cmm-mode cmake-mode clang-format auto-dictionary auctex anaconda-mode pythonic f dash s which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors '("#282828" . "#f9f5d7"))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t nil)))
 '(custom-set ((t nil)))
 '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(vc-state-base ((t nil)))
 '(whitespace-tab ((t (:foreground "#636363")))))
