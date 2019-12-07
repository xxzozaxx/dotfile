;; -*- mode: emacs-lisp -*-
;;  ____
;; / ___│ _ __   __ _  ___ ___ _ __ ___   __ _  ___ ___
;; \___ \│ '_ \ / _` │/ __/ _ \ '_ ` _ \ / _` │/ __/ __│
;;  ___) │ │_) │ (_│ │ (_│  __/ │ │ │ │ │ (_│ │ (__\__ \
;; │____/│ .__/ \__,_│\___\___│_│ │_│ │_│\__,_│\___│___/
;;       │_│ :Ahmeds' spacemacs config file:
;;           :ahmed_khaledATzohoDoTCoM:
;; ┏┓╻╻ ╻
;; ┃┗┫╺╋╸
;; ╹ ╹╹ ╹ :NIXERS:

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs-base
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation t ;; ask before installing
   dotspacemacs-configuration-layer-path '()
   ;; ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
   ;; List of layers  ••••••••••••••••••••••••••••••••••••••••••••••••
   ;; ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
   dotspacemacs-configuration-layers
   '(;; ---- Languages -----
     ;; shell-scripts  ;NAND nixos
     rust go c-c++ scheme sml racket ruby javascript ; java d  common-lisp
     (haskell :variables
              haskell-completion-backend 'ghci
              haskell-process-type 'stack-ghci)
     (python :variables python-enable-yapf-format-on-save t)
     markdown html graphviz
     (latex :variables latex-enable-auto-fill t
            :variables latex-enable-folding t)

     ;;   ---- Editor -----
     ivy git ;; imenu-list ibuffer dash syntax-checking
     semantic lsp
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     (spell-checking :variables spell-checking-enable-by-default nil)

     ;;   ---- Application -----
     dired media erc org
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/")
     (elfeed :variables
              rmh-elfeed-org-files (list "~/.spacemacs.d/rssfeed.org"))
     (shell :variables shell-default-shell 'eshell)
     )

   dotspacemacs-additional-packages '(;; --- Extra Package ----
                                      carbon-now-sh
                                      nov
                                      keyfreq
                                      ag
                                      visual-fill-column
                                      eyebrowse ; for workspace
                                      edwina ; dwm like window manager
                                      window-layout
                                      calfw calfw-org ; better calendaer view
                                      magic-latex-buffer ; better LaTeX privew
                                      indent-guide
                                      ;; --- Theme ---
                                      nofrils-acme-theme plan9-theme parchment-theme
                                      gruvbox-theme
                                      poet-theme
                                      srcery-theme
                                      tao-theme minimal-theme
                                      gruber-darker-theme
                                      ;; --- Fun ---
                                      speed-type
                                      symon
                                      focus
                                      ;; gopher
                                      )

   dotspacemacs-frozen-packages '(;; ––– Package cannot be updated –––
   )

   dotspacemacs-excluded-packages '(;; Pkgs cannot be installed or loaded
                                    persp-mode
                                    spinner
                                    google-translate
                                    fancy-battery
                                    rainbow-delimiters
                                    org-projectile
                                    company-tern tern
                                    ;; racer
                                    )
   ;; Package install behaviour;
   ;;          - `used-only': install only explicitly used packages
   ;;          - `used-but-keep-unused': install only the used package
   ;; but won't uninstall them if they become unused.
   ;;          - `all'
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 7)
                                (recents . 7)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( nofrils-acme gruber-darker minimal-light parchment tao-yang )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   ;; font test: \/ {} () a* -: <>=&¿? #$#│~`' ‘’,‚ .
   ;; font test: a g l i α λ
   ;; List of fonts that you could use "Monoisome","DejaVu Sans Mono" & "Iosevka"
   ;; dotspacemacs-default-font '("{mplus, FantasqueSansMono} Nerd Font Mono, GoMono Nerd Font"
   dotspacemacs-default-font '("SF Mono"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;    :disabled-for-modes dired-mode
   ;;                        doc-view-mode
   ;;                        markdown-mode
   ;;                        org-mode
   ;;                        pdf-view-mode
   ;;                        text-mode
   ;;    :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  ;; add melpa, which is not in spacemacs for some reason I guss
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))

  ;; Avoid the pitfall of “loading old bytecode instead of newer source”
  (setq load-prefer-newer t)

  ;;; org-mode init
  (setq org-bullets-bullet-list '("◉" "○" "⚫" "❖" )
        org-ellipsis " ⤵ "
        ;; org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "│" "DONE" "CANCELED"))
        org-agenda-custom-commands
        '(("c" "Simple agenda view"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")))
            (agenda "")
            (alltodo ""))))
        org-startup-indented t
        org-pretty-entities t
        org-hide-emphasis-markers t
        ;; show actually italicized text instead of /italicized text/
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

  ;; Org level fonts
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0)))))

  ;;; arabic font
  ;; others: ; "NoName Fixed" "Noto Naskh Arabic"  "Amiri Typewriter"
  ;;(when window-system
  ;;  (set-fontset-font "fontset-default" '(#x600 . #x6ff)
  ;;                    "Noto Kufi Arabic"))

  ;; ESHELL path
  (setq eshell-path-env (getenv "PATH"))

  ;; ----- User init End here ––––
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
   This function is called at the very end of Spacemacs initialization after
   layers configuration."

  ;; lsp-haskell
  ;; (setq lsp-haskell-process-path-hie "hie-wrapper")
  ;; (require 'lsp-haskell)
  ;; (add-hook 'haskell-mode-hook #'lsp)

  ;; emms config
  (setq emms-source-file-default-directory "/home/master/Music")

  ;;Org-bable
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((dot . t)))
  ;; Agenda start with Saturday
  (setq org-agenda-start-on-weekday 6)
  ;; Some agenda calfw config
  (require 'calfw)
  (require 'calfw-org)
  (setq calendar-week-start-day 6)
  (setq cfw:fchar-junction ?╋      ; Unicode borders
        cfw:fchar-vertical-line ?┃
        cfw:fchar-horizontal-line ?━
        cfw:fchar-left-junction ?┣
        cfw:fchar-right-junction ?┫
        cfw:fchar-top-junction ?┯
        cfw:fchar-top-left-corner ?┏
        cfw:fchar-top-right-corner ?┓)

  ;; Some good defaults
  (menu-bar-mode 1)
  (blink-cursor-mode 1)
  (spacemacs/set-leader-keys "l" 'avy-goto-line)

  ;; Scroll one line at a time with mouse scroll wheel, no acceleration
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
  (setq mouse-wheel-progressive-speed nil)
  (setq scroll-margin 0
        scroll-conservatively 100000
        scroll-preserve-screen-position 1)


  ;; My own function(s)
  (defun org-link-at-current-line ()
    (interactive)
    (kill-new (format "[[./%s::%s]]" (buffer-name) (line-number-at-pos))))
  (spacemacs/set-leader-keys "y" 'org-link-at-current-line)

  ;; M-mouse3 don't integrate projetile-ag without asking to may questions
  (defun hrs/search-project-for-symbol-at-point ()
    "Use `projectile-ag' to search the current project for `symbol-at-point'."
    (interactive)
    (projectile-ag (projectile-symbol-at-point)))

  (global-set-key (kbd "<M-mouse-3>") 'hrs/search-project-for-symbol-at-point)
  (global-set-key (kbd "<M-mouse-3>") 'hrs/search-project-for-symbol-at-point)


  ;;(require 'calfw-org)
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  ;; allow aggressive-indent-mode
  ;;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  ;;(add-hook 'scheme-mode-hook #'aggressive-indent-mode)
  ;;(add-hook 'racket-mode-hook #'aggressive-indent-mode)
  ;;(add-hook 'rust-mode-hook #'aggressive-indent-mode)

  ;; Load separated config/eLisp files
  ;;(load-file "~/.spacemacs.d/pretty.el")       ; pretty config
  (load-file "~/.spacemacs.d/mail.el")           ; Mu4e   config
  (load-file "~/.spacemacs.d/gopher.el")         ; Gopher client
  ;;(load-file "~/.spacemacs.d/elpher/elpher.el")  ; Gopher client
  ;;(load-file "~/.spacemacs.d/org-gcal.el") ;
  (use-package telega
    :load-path "~/.spacemacs.d/telega.el"
    :commands (telega)
    :defer t)

  ;; YASnippet by backtab (shift + tab)
  (define-key yas-minor-mode-map (kbd "<S-tab>") #'yas-expand)

  ;; Source: https://dougie.io/coding/tabs-in-emacs/
  ;; Visualize tabs as a pipe character - "││"
  ;; This will also show trailing characters as they are useful to spot.
  (setq whitespace-style '(face tabs tab-mark trailing))
  (custom-set-faces
   '(whitespace-tab ((t (:foreground "#636363")))))
  (setq whitespace-display-mappings
        '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\│'
  ;; (global-whitespace-mode)              ; Enable whitespace mode everywhere

  (add-hook 'prog-mode-hook 'indent-guide)

  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "/usr/bin/surf")

  ;; Some statics to improve keybinding
  (require 'keyfreq)
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)

  ;; IRC:
  ;; (erc-spelling-mode 1)
  (setq erc-log-channels-directory "~/.emacs.d/erc/logs/")
  (setq erc-autojoin-channels-alist '(("rizon.net" . ("#nfo"
                                                     "#/g/sicp"))))
  ;; ----- User config End here ––––
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#1b1818" "#ca4949" "#4b8b8b" "#a06e3b" "#7272ca" "#8464c4" "#7272ca" "#8a8585"] t)
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-generic-program "/usr/bin/firefox")
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(ecb-options-version "2.50")
 '(erc-nick "Ahmedkh")
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
 '(lsp-prefer-flymake nil)
 '(lsp-rust-all-features t)
 '(lsp-rust-full-docs t)
 '(lsp-ui-sideline-ignore-duplicate t t)
 '(lsp-ui-sideline-show-symbol nil t)
 '(magit-diff-use-overlays nil)
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces))
 '(mode-line-in-non-selected-windows t)
 '(mode-line-percent-position '(-3 "%o"))
 '(org-agenda-files '("~/Documents/PIM/gcal.org" "~/Documents/PIM/Agenda.org"))
 '(package-selected-packages
   '(chocolate-theme esxml transient lv carbon-now-sh ox-tufte ebib ox-trac auctex-latexmk inverse-acme-theme plan9-theme xbm-life org-gcal request-deferred spaceline-all-the-icons doom-modeline lsp-ui company-lsp lsp-mode darktooth-theme darkokai-theme flymd company-emacs-eclim eclim badwolf-theme pandoc-mode ox-pandoc latex-math-preview typo olivetti minimap calfw-gcal ascii-art-to-unicode kanban w3 org-timeline calfw calfw-org d-mode company-dcd flycheck-dmd-dub nov nyx-theme graphviz-dot-mode treepy graphql all-the-icons memoize writeroom-mode racer monotropic-theme monokai-alt-theme monokai-theme ranger evil-snipe weechat go-guru go-eldoc company-go go-mode circe org-outline-numbering outshine sqlite esqlite pcsv poet-theme autothemer symon speed-type monochrome-theme ibuffer-sidebar focus zeno-theme ecb fuzzy company-web web-completion-data company-tern tern company-statistics company-shell company-cabal company-c-headers company-auctex company-anaconda common-lisp-snippets auto-yasnippet ac-ispell auto-complete toml-mode flycheck-rust cargo rust-mode challenger-deep-theme night-owl-theme git-gutter smart-tabs-mode volatile-highlights vi-tilde-fringe uuidgen toc-org restart-emacs request rainbow-delimiters persp-mode paradox spinner org-bullets open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete highlight-numbers parent-mode highlight-indentation google-translate golden-ratio flx-ido fill-column-indicator fancy-battery evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight dumb-jump column-enforce-mode clean-aindent-mode auto-highlight-symbol adaptive-wrap ace-link gruvbox-theme web-beautify livid-mode skewer-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode color-theme-modern rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby rcirc-notify rcirc-color eyebrowse spaceline all-the-icons-ivy dracula-theme racket-mode faceup hl-todo highlight-parentheses doom-themes define-word aggressive-indent smartparens plain-theme doom-dracula-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-nixos-options helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag flyspell-correct-helm ace-jump-helm-line expand-region bitlbee stumpwm-mode nand2tetris-assembler company-nand2tetris nand2tetris all-the-icons-dired dired-sidebar dired-k diredfl dired-subtree dired-rainbow dired-quick-sort dired-narrow dired-hacks-utils dired-collapse rich-minority sml-modeline stickyfunc-enhance srefactor selectric-mode insert-shebang fish-mode zoom ws-butler winum zeal-at-point yapfify xterm-color web-mode tagedit smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode rainbow-mode rainbow-identifiers pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pdf-tools tablist orgit org-projectile org-category-capture org-present org-pomodoro org-mime org-download ob-sml sml-mode nixos-options nix-mode multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode less-css-mode intero imenu-list ibuffer-projectile hy-mode htmlize hlint-refactor hindent haskell-snippets yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elfeed-web simple-httpd elfeed-org org-plus-contrib elfeed-goodies ace-jump-mode noflet powerline popwin elfeed disaster cython-mode counsel-dash helm-dash dash-functional company-ghci company-ghc ghc company haskell-mode color-identifiers-mode cmm-mode cmake-mode clang-format auto-dictionary auctex anaconda-mode pythonic f dash s which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy))
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

;; ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
;; (vc-mode vc-mode)
;; "  " mode-line-modes mode-line-misc-info mode-line-end-spaces)
;;
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(ansi-term-color-vector
   [unspecified "#1b1818" "#ca4949" "#4b8b8b" "#a06e3b" "#7272ca" "#8464c4" "#7272ca" "#8a8585"] t)
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-generic-program "/usr/bin/firefox")
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(ecb-options-version "2.50")
 '(erc-modules
   '(button completion hecomplete log menu move-to-prompt smiley spelling image youtube spelling services hl-nicks netsplit fill button match track readonly networks ring autojoin noncommands irccontrols move-to-prompt stamp menu list))
 '(erc-nick "Ahmedkh")
 '(erc-user-full-name "Ahmed Khaled (David Gabriel)")
 '(evil-want-Y-yank-to-eol nil)
 '(eww-form-checkbox-selected-symbol "☑")
 '(eww-form-checkbox-symbol "☐")
 '(eyebrowse-mode t)
 '(fci-rule-color "#010F1D" t)
 '(frame-brackground-mode 'dark)
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
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(line-spacing 0.2)
 '(lsp-prefer-flymake nil)
 '(lsp-rust-all-features t)
 '(lsp-rust-full-docs t)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-symbol nil)
 '(magit-diff-use-overlays nil)
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
     (vc-mode vc-mode)
     "  " mode-line-modes mode-line-misc-info mode-line-end-spaces))
 '(mode-line-in-non-selected-windows t)
 '(mode-line-percent-position '(-3 "%o"))
 '(org-agenda-files '("~/Documents/PIM/Agenda.org" "~/Documents/PIM/Tasks.org"))
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(sicp highlight-indent-guides soundcloud punpun-theme nofrils-acme-theme visual-fill-column magic-latex-buffer calfw-cal gruber-darker-theme minimal-theme colorless-themes commentary-theme laguna-theme inkpot-theme window-layout smooth-scrolling parchment-theme lsp-haskell edwina tao-theme moe-theme lsp-treemacs treemacs treemacs-evil treemacs-icons-dired treemacs-magit treemacs-projectile ag chocolate-theme esxml transient lv carbon-now-sh ox-tufte ebib ox-trac auctex-latexmk inverse-acme-theme plan9-theme xbm-life org-gcal request-deferred spaceline-all-the-icons doom-modeline lsp-ui company-lsp lsp-mode darktooth-theme darkokai-theme flymd company-emacs-eclim eclim badwolf-theme pandoc-mode ox-pandoc latex-math-preview typo olivetti minimap calfw-gcal ascii-art-to-unicode kanban w3 org-timeline calfw calfw-org d-mode company-dcd flycheck-dmd-dub nov nyx-theme graphviz-dot-mode treepy graphql all-the-icons memoize writeroom-mode racer monotropic-theme monokai-alt-theme monokai-theme ranger evil-snipe weechat go-guru go-eldoc company-go go-mode circe org-outline-numbering outshine sqlite esqlite pcsv poet-theme autothemer symon speed-type monochrome-theme ibuffer-sidebar focus zeno-theme ecb fuzzy company-web web-completion-data company-tern tern company-statistics company-shell company-cabal company-c-headers company-auctex company-anaconda common-lisp-snippets auto-yasnippet ac-ispell auto-complete toml-mode flycheck-rust cargo rust-mode challenger-deep-theme night-owl-theme git-gutter smart-tabs-mode volatile-highlights vi-tilde-fringe uuidgen toc-org restart-emacs request rainbow-delimiters persp-mode paradox spinner org-bullets open-junk-file neotree move-text lorem-ipsum linum-relative link-hint indent-guide hungry-delete highlight-numbers parent-mode highlight-indentation google-translate golden-ratio flx-ido fill-column-indicator fancy-battery evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu eval-sexp-fu highlight dumb-jump column-enforce-mode clean-aindent-mode auto-highlight-symbol adaptive-wrap ace-link gruvbox-theme web-beautify livid-mode skewer-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode color-theme-modern rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby rcirc-notify rcirc-color eyebrowse spaceline all-the-icons-ivy dracula-theme racket-mode faceup hl-todo highlight-parentheses doom-themes define-word aggressive-indent smartparens plain-theme doom-dracula-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-nixos-options helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag flyspell-correct-helm ace-jump-helm-line expand-region bitlbee stumpwm-mode nand2tetris-assembler company-nand2tetris nand2tetris all-the-icons-dired dired-sidebar dired-k diredfl dired-subtree dired-rainbow dired-quick-sort dired-narrow dired-hacks-utils dired-collapse rich-minority sml-modeline stickyfunc-enhance srefactor selectric-mode insert-shebang fish-mode zoom ws-butler winum zeal-at-point yapfify xterm-color web-mode tagedit smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode rainbow-mode rainbow-identifiers pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pdf-tools tablist orgit org-projectile org-category-capture org-present org-pomodoro org-mime org-download ob-sml sml-mode nixos-options nix-mode multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode less-css-mode intero imenu-list ibuffer-projectile hy-mode htmlize hlint-refactor hindent haskell-snippets yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elfeed-web simple-httpd elfeed-org org-plus-contrib elfeed-goodies ace-jump-mode noflet powerline popwin elfeed disaster cython-mode counsel-dash helm-dash dash-functional company-ghci company-ghc ghc company haskell-mode color-identifiers-mode cmm-mode cmake-mode clang-format auto-dictionary auctex anaconda-mode pythonic f dash s which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy))
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
)
