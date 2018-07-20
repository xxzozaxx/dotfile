;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; mode line format
;; ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification mode-line-position evil-mode-line-tag (vc-mode vc-mode) mode-line-modes mode-line-misc-info )


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ---- Languages -----
     emacs-lisp shell-scripts
     haskell common-lisp python scheme
     c-c++ html sml racket ;nixos
     markdown
     (latex :variables latex-enable-auto-fill t
            :variables latex-enable-folding t)

     ;;  ---- Editor -----
     ivy syntax-checking imenu-list ibuffer dash git
     semantic
     (spell-checking :variables spell-checking-enable-by-default nil)
     (colors :variables colors-colorize-identifiers 'variables)

     ;;  ---- Application -----
     org pdf-tools dired ;jabber ;vinegar
     (elfeed :variables
             rmh-elfeed-org-files (list "~/.spacemacs.d/rssfeed.org"))

     (erc :variables
          erc-server-list
          '(("irc.freenode.net"
             :port "6697"
             :ssl t
             :nick "Ahmedkh"
             :password "123ahmed123")))

     (mu4e :variables mu4e-installation-path "run/current-system/sw/share/emacs/site-lisp/"
           :variables mu4e-enable-mode-line t)

     ;; fun stuff
     graphviz ;selectric ; exwm
     (shell :variables shell-enable-smart-eshell t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(;; --- External Package ----
                                      zoom
                                      smart-mode-line
                                      all-the-icons-ivy
                                        ; --- NAND2Tetris packages ---
                                      nand2tetris
                                      nand2tetris-assembler
                                      company-nand2tetris
                                        ; --- NAND2Tetris End here ---
                                      ;; --- Theme ---
                                      ;; doom-themes
                                      ;; base16-theme
                                      ;; cyberpunk-theme
                                      nyx-theme
                                      dracula-theme
                                      sexy-monochrome-theme
                                      ;; --- Fun ---
                                      speed-type
                                      ;; pretty-symbols
                                      elscreen
                                      symon
                                      focus
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(spaceline)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
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
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         nyx
                         dracula
                         ;;cyberpunk
                         ;; doom-molokai
                         ;; spacemacs-dark
                         ;; spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; font test: \/ {} () a* -: <>=&¿? #$|~`' ‘’,‚ .
   ;; font test: a g l i α λ

   ;; List of fonts that you could use "Monoisome""DejaVu Sans Mono""Iosevka"
   dotspacemacs-default-font '("Mononoki"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
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

  ;; load my theme
  (load "~/.emacs.d/private/local/simple-monochrome-theme.el")

  ;;; org-mode init
  (setq org-bullets-bullet-list '("◉" "○" "⚫" "❖" )
        org-ellipsis "⤵")

  ;; Org level fonts
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   )

  ;;; Jabber account list
  (setq jabber-account-list '(("DavidGabriel@jabberd.tk"
                               (:password . "123ahmed123"))))

  ;;; arabic font
  (when window-system
    (set-fontset-font "fontset-default" '(#x600 . #x6ff)
                      "Amiri"))

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (use-package all-the-icons-ivy
    :config
    (all-the-icons-ivy-setup))

  ;; modeline
  ;; (setq sml/no-confirm-load-theme t)
  ;; (sml/setup)


  ;; time in power line
  (display-time-mode 1)

  ;; 6. prettify mode
  (global-prettify-symbols-mode t)
  ;; for prog mode 
  (add-hook 'prog-mode-hook
            (lambda ()
              (push '("!=" . ?≠) prettify-symbols-alist)
              (push '("<=" . ?≤) prettify-symbols-alist)
              (push '(">=" . ?≥) prettify-symbols-alist)
              (push '("."  . ?•) prettify-symbols-alist)
              (push '("==" . ?≡) prettify-symbols-alist)

              ;; Type
              (push '("int"     . ?ℤ) prettify-symbols-alist)
              (push '("float"   . ?ℝ) prettify-symbols-alist)
              ;; (push '("str"     . ?𝕊) prettify-symbols-alist)
              (push '("True"    . ?𝕋) prettify-symbols-alist)
              (push '("False"   . ?𝔽) prettify-symbols-alist)
              ;; (push '("null"    . ?∅) prettify-symbols-alist)

              ;; common variable
              ;; (push '("empty"    . ?Ø) prettify-symbols-alist)

              ;; Greek
              (push '("alpha"   . ?α) prettify-symbols-alist)
              (push '("beta"    . ?𝛃) prettify-symbols-alist)
              ;; (push '("gamma"   . ?γ) prettify-symbols-alist)
              ;; (push '("zeta"    . ?ζ) prettify-symbols-alist)
              ;; (push '("eta"     . ?𝛈) prettify-symbols-alist)
              ;; (push '("delta"   . ?𝚫) prettify-symbols-alist)
              ;; (push '("epsilon" . ?ε) prettify-symbols-alist)
              (push '("theta"   . ?𝝷) prettify-symbols-alist)
              (push '("pi"      . ?𝝿) prettify-symbols-alist)

              ;; Math operation
              (push '("sqrt"    . ?√) prettify-symbols-alist)))

  ;; for python mode .⁚:
  ;; command insert-char for add char at point
  (add-hook 'python-mode-hook
            (lambda ()
              (push '("None"  . ?Ø) prettify-symbols-alist)
              (push '("def"   . ?ƒ) prettify-symbols-alist)
              (push '("in"    . ?∈) prettify-symbols-alist)
              (push '("not in". ?∉) prettify-symbols-alist)
              (push '("yield" . #x27fb) prettify-symbols-alist)
              (push '("and"   . (?\s (Br . Bl) ?\s (Br . Bl) ?\s (Bc . Bc) ?∧)) prettify-symbols-alist)
              (push '("or"    . (?\s (Br . Bl) ?\s (Bc . Bc) ?∨)) prettify-symbols-alist)
              (push '("for"   . ?∀) prettify-symbols-alist)
              (push '("sum"   . ?∑) prettify-symbols-alist)
              (push '("**2"   . ?²) prettify-symbols-alist)
              (push '("**3"   . ?³) prettify-symbols-alist)))

  ;; for emacs-lisp mode
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (push '("nil"   . ?Ø) prettify-symbols-alist)))

  ;; for scheme mode
  (add-hook 'scheme-mode-hook
            (lambda ()
              (push '("lambda" . ?λ) prettify-symbols-alist)))
  ;; Unprettify at point
  (setq prettify-symbols-unprettify-at-point t)

  ;; Browser setting
  (setq browse-url-generic-program (executable-find "qutebrowser"))
  (setq browse-url-browser-function #'eww-browse-url)
  ;; re-name buffer with page title in eww
  (unless (version< emacs-version "24.4")
    (defadvice eww-tag-title (after rrix/eww-rename-buffer-ad (cont))
      "Update EWW buffer title with new page load."
      (let ((eww-current-title
             (if (version< emacs-version "25.0")
                 eww-current-title
               (plist-get eww-data :title))))
        (rename-buffer (format "*eww : %s *" (cce/str-chomp eww-current-title)) t)))
    (ad-activate 'eww-tag-title))
  ;; Open in new windows if possible
  (setq browse-url-new-window-flag nil)


  ;; Youtube
  ;; (defun elfeed-play-with-mpv ()
  ;;   "Play entry link with mpv."
  ;;   (interactive)
  ;;   (let ((entry (if (eq major-mode 'elfeed-show-mode) elfeed-show-entry (elfeed-search-selected :single)))
  ;;         (quality-arg "")
  ;;         (quality-val (completing-read "Max height resolution (0 for unlimited): " '("0" "360" "480" "720") nil nil)))
  ;;     (setq quality-val (string-to-number quality-val))
  ;;     (message "Opening %s with height≤%s with mpv..." (elfeed-entry-link entry) quality-val)
  ;;     (when (< 0 quality-val)
  ;;     (setq quality-arg (format "--ytdl-format=[height<=?%s]" quality-val)))
  ;;     (start-process "elfeed-mpv" nil "mpv" quality-arg (elfeed-entry-link entry))))

  ;; (defvar elfeed-mpv-patterns
  ;;   '("youtu\\.?be")
  ;;   "List of regexp to match against elfeed entry link to know whether to use mpv to visit the link.")

  ;; (defun elfeed-visit-or-play-with-mpv ()
  ;;   "Play in mpv if entry link matches `elfeed-mpv-patterns', visit otherwise. See `elfeed-play-with-mpv'."
  ;;   (interactive)
  ;;   (let ((entry (if (eq major-mode 'elfeed-show-mode) elfeed-show-entry (elfeed-search-selected :single)))
  ;;         (patterns elfeed-mpv-patterns))
  ;;     (while (and patterns (not (string-match (car elfeed-mpv-patterns) (elfeed-entry-link entry))))
  ;;       (setq patterns (cdr patterns)))
  ;;     (if patterns
  ;;         (elfeed-play-with-mpv)
  ;;       (if (eq major-mode 'elfeed-search-mode)
  ;;           (elfeed-search-browse-url)
  ;;         (elfeed-show-visit)))))

  ;; --- NAND2Tetris init here ---
  (use-package nand2tetris
    :defer t
    ;; :init
    ;; (setq nand2tetris-core-base-dir "~/Documents/Technical/Computer_Arch_&_Critic_Eng/NAND2Tetris/nand2tetris")
    :config
    (use-package nand2tetris-assembler
      :defer t)
    (use-package company-nand2tetris
      :defer t))
  ;; --- NAND2Tetris init End here ---


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#1b1818" "#ca4949" "#4b8b8b" "#a06e3b" "#7272ca" "#8464c4" "#7272ca" "#8a8585"] t)
 '(evil-want-Y-yank-to-eol nil)
 '(mode-line-format
   (quote
    ("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-frame-identification mode-line-directory mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
     (vc-mode vc-mode)
     (flycheck-mode flycheck-mode-line)
     "   " mode-line-modes
     (which-func-mode
      ("" which-func-format "--"))
     (global-mode-string
      ("--" global-mode-string))
     "-%-")))
 '(package-selected-packages
   (quote
    (eyebrowse spaceline all-the-icons-ivy dracula-theme racket-mode faceup hl-todo highlight-parentheses doom-themes define-word aggressive-indent smartparens plain-theme doom-dracula-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-nixos-options helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-ag flyspell-correct-helm ace-jump-helm-line expand-region bitlbee stumpwm-mode nand2tetris-assembler company-nand2tetris nand2tetris all-the-icons-dired dired-sidebar dired-k diredfl dired-subtree dired-rainbow dired-quick-sort dired-narrow dired-hacks-utils dired-collapse smart-mode-line rich-minority sml-modeline stickyfunc-enhance srefactor selectric-mode insert-shebang fish-mode zoom ws-butler winum zeal-at-point yapfify xterm-color web-mode tagedit smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode rainbow-mode rainbow-identifiers pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pdf-tools tablist orgit org-projectile org-category-capture org-present org-pomodoro org-mime org-download ob-sml sml-mode nixos-options nix-mode multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode less-css-mode intero imenu-list ibuffer-projectile hy-mode htmlize hlint-refactor hindent haskell-snippets yasnippet haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md geiser flyspell-correct-ivy flyspell-correct flycheck-pos-tip pos-tip flycheck-haskell flycheck evil-magit magit magit-popup git-commit ghub let-alist with-editor eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elfeed-web simple-httpd elfeed-org org-plus-contrib elfeed-goodies ace-jump-mode noflet powerline popwin elfeed disaster cython-mode counsel-dash helm-dash dash-functional company-ghci company-ghc ghc company haskell-mode color-identifiers-mode cmm-mode cmake-mode clang-format auto-dictionary auctex anaconda-mode pythonic f dash s which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed async ace-window avy)))
 '(sml/numbers-separator ":")
 '(sml/show-eol t)
 '(sml/show-frame-identification t)
 '(sml/theme (quote respectful))
 '(symon-sparkline-width 80))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:background "#000000" :foreground "#f8f8f8"))))
 '(eyebrowse-mode-line-separator ((t (nil nil))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.6))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.4))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(vc-state-base ((t nil))))
