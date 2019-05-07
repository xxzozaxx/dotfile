;; __  ___     _           _ _
;; \ \/ / |__ (_)_ __   __| | | _____ _   _ ___
;;  \  /| '_ \| | '_ \ / _` | |/ / _ \ | | / __|
;;  /  \| |_) | | | | | (_| |   <  __/ |_| \__ \
;; /_/\_\_.__/|_|_| |_|\__,_|_|\_\___|\__, |___/
;;                                    |___/ :Ahmed's xbindkeysrc config:
;; ┏┓╻╻ ╻
;; ┃┗┫╺╋╸
;; ╹ ╹╹ ╹

;; To specify a key, you can use 'xbindkeys --key' or
;; 'xbindkeys --multikey' and put one of the two lines in this file.

;; List of modifier:
;;   Release, Control, Shift, Mod1 (Alt), Mod2 (NumLock),
;;   Mod3 (CapsLock), Mod4, Mod5 (Scroll).

;;;;; Scheme API reference
;;;;
;; Optional modifier state:
;; (set-numlock! #f or #t)
;; (set-scrolllock! #f or #t)
;; (set-capslock! #f or #t)
;;
;; Shell command key:
;; (xbindkey key "foo-bar-command [args]")
;; (xbindkey '(modifier* key) "foo-bar-command [args]")
;;
;; Other functions:
;; (remove-xbindkey key)
;; (run-command "foo-bar-command [args]")
;; (grab-all-keys)
;; (ungrab-all-keys)
;; (remove-all-keys)
;; (debug)

;; list of cons contain keyseq and function as follow:
;; (list '(key seq here) "function here")
(define keyLst (list
                ;; Example (cons '(control shift q) "xbindkeys_show")
                ;; ––– •non char key• –––
                ;; -- •Functional key• ––
                (cons '(XF86MonBrightnessDown) "xbacklight -dec 5")
                (cons '(XF86MonBrightnessUp) "xbacklight -inc 5")
                (cons '(XF86AudioRaiseVolume) "pactl set-sink-volume @DEFAULT_SINK@ +1000")
                (cons '(XF86AudioLowerVolume) "pactl set-sink-volume @DEFAULT_SINK@ -1000")
                (cons '(XF86AudioMute) "pactl set-sink-mute @DEFAULT_SINK@ toggle")
                (cons '(Print) "scrot  '%Y-%m-%d_%H:%M:%S_$wx$h.png' -q 100 -e 'mv $f ~/Pictures/'")
                (cons '(mod4 Print) "scrot  '%Y-%m-%d_%H:%M:%S_$wx$h.png' -u -q 100 -e 'mv $f ~/Pictures/'")
                ;; (cons '(mod4 Return) "st") ;Moved to dwm config. for safty reasons
                (cons '(mod4 shift Return) "konsole")
                ;; ––– •char number• –––
                ;; (cons '(SEQ 1) "BIND")
                ;; (cons '(SEQ shift 1) "BIND")
                ;; (cons '(SEQ 2) "BIND")
                ;; (cons '(SEQ shift 2) "BIND")
                ;; (cons '(SEQ 3) "BIND")
                ;; (cons '(SEQ shift 3) "BIND")
                ;; (cons '(SEQ 4) "BIND")
                ;; (cons '(SEQ shift 4) "BIND")
                ;; (cons '(SEQ 5) "BIND")
                ;; (cons '(SEQ shift 5) "BIND")
                ;; (cons '(SEQ 6) "BIND")
                ;; (cons '(SEQ shift 6) "BIND")
                ;; (cons '(SEQ 7) "BIND")
                ;; (cons '(SEQ shift 7) "BIND")
                ;; (cons '(SEQ 8) "BIND")
                ;; (cons '(SEQ shift 8) "BIND")
                ;; (cons '(SEQ 9) "BIND")
                ;; (cons '(SEQ shift 9) "BIND")
                ;; (cons '(SEQ 0) "BIND")
                ;; (cons '(SEQ shift 0) "BIND")
                ;; XXX char char
                ;; (cons '(SEQ q) "BIND")
                ;; (cons '(SEQ shift q) "BIND")
                ;; (cons '(SEQ w) "BIND")
                ;; (cons '(SEQ shift w) "BIND")
                (cons '(mod4 e) "emacsclient -c")
                (cons '(mod4 shift e) "emacs")
                (cons '(mod4 r) "st -t dropdown -e ranger")
                (cons '(mod4 shift r) "xterm -title dropdown -e ranger")
                ;; (cons '(SEQ shift r) "BIND")
                ;; (cons '(SEQ t) "BIND")
                ;; (cons '(SEQ shift t) "BIND")
                ;; (cons '(SEQ y) "BIND")
                ;; (cons '(SEQ shift y) "BIND")
                ;; (cons '(mod4 u)       "st -t dropdown -e abduco -A dropdown mksh")
                ;; (cons '(mod4 u) "st -t dropdown -e tmux attach")
                (cons '(mod4 shift u) "st -t dropdown -e abduco -A dropdown")
                (cons '(mod4 i) "st -e htop")
                ;; (cons '(SEQ shift i) "BIND")
                ;; (cons '(SEQ o) "BIND")
                ;; (cons '(SEQ shift o) "BIND")
                ;; (cons '(SEQ p) "BIND")
                ;; (cons '(SEQ shift p) "BIND")
                (cons '(mod4 a) "a")
                (cons '(mod4 shift a) "pavucontrol")
                ;; (cons '(SEQ s) "BIND")
                ;; (cons '(SEQ shift s) "BIND")
                ;; (cons '(SEQ d) "BIND")
                ;; (cons '(SEQ shift d) "BIND")
                ;; (cons '(SEQ f) "BIND")
                ;; (cons '(SEQ shift f) "BIND")
                ;; (cons '(SEQ g) "BIND")
                ;; (cons '(SEQ shift g) "BIND")
                ;; (cons '(SEQ h) "BIND")
                ;; (cons '(SEQ shift h) "BIND")
                ;; (cons '(SEQ j) "BIND")
                ;; (cons '(SEQ shift j) "BIND")
                ;; (cons '(SEQ k) "BIND")
                ;; (cons '(SEQ shift k) "BIND")
                ;; (cons '(SEQ l) "BIND")
                ;; (cons '(SEQ shift l) "BIND")
                ;; (cons '(SEQ z) "BIND")
                ;; (cons '(SEQ shift z) "BIND")
                (cons '(mod4 shift x) "i3lock -i ~/.config/i3/web.png")
                ;; (cons '(SEQ shift x) "BIND")
                ;; (cons '(SEQ c) "BIND")
                ;; (cons '(SEQ shift c) "BIND")
                ;; (cons '(SEQ v) "BIND")
                ;; (cons '(SEQ shift v) "BIND")
                (cons '(mod4 b) "xlinks2")
                ;; (cons '(SEQ shift b) "BIND")
                ;; (cons '(SEQ n) "BIND")
                ;; (cons '(SEQ shift n) "BIND")
                ;; (cons '(SEQ m) "BIND")
                ;; (cons '(SEQ shift m) "BIND")
                ))

;; map over list and apply xbindkey
(map (lambda (x)
       (xbindkey (car x) (cdr x)))
     keyLst)



;; Extra features
;; (xbindkey-function '(control a)
;;                    (lambda ()
;;                      (display "Hello from Scheme!")
;;                      (newline)))

;; (xbindkey-function '(shift p)
;;                    (lambda ()
;;                      (run-command "xterm")))


;; ;; Double click test
;; (xbindkey-function '(control w)
;;                    (let ((count 0))
;;                      (lambda ()
;;                        (set! count (+ count 1))
;;                        (if (> count 1)
;;                            (begin
;;                              (set! count 0)
;;                              (run-command "xterm"))))))

;; ;; Time double click test:
;; ;;  - short double click -> run an xterm
;; ;;  - long  double click -> run an rxvt
;; (xbindkey-function '(shift w)
;;                    (let ((time (current-time))
;;                          (count 0))
;;                      (lambda ()
;;                        (set! count (+ count 1))
;;                        (if (> count 1)
;;                            (begin
;;                              (if (< (- (current-time) time) 1)
;;                                  (run-command "xterm")
;;                                  (run-command "rxvt"))
;;                              (set! count 0)))
;;                        (set! time (current-time)))))


;; ;; Chording keys test: Start differents program if only one key is
;; ;; pressed or another if two keys are pressed.
;; ;; If key1 is pressed start cmd-k1
;; ;; If key2 is pressed start cmd-k2
;; ;; If both are pressed start cmd-k1-k2 or cmd-k2-k1 following the
;; ;;   release order
;; (define (define-chord-keys key1 key2 cmd-k1 cmd-k2 cmd-k1-k2 cmd-k2-k1)
;;   "Define chording keys"
;;   (let ((k1 #f) (k2 #f))
;;     (xbindkey-function key1 (lambda () (set! k1 #t)))
;;     (xbindkey-function key2 (lambda () (set! k2 #t)))
;;     (xbindkey-function (cons 'release key1)
;;                        (lambda ()
;;                          (if (and k1 k2)
;;                              (run-command cmd-k1-k2)
;;                              (if k1 (run-command cmd-k1)))
;;                          (set! k1 #f) (set! k2 #f)))
;;     (xbindkey-function (cons 'release key2)
;;                        (lambda ()
;;                          (if (and k1 k2)
;;                              (run-command cmd-k2-k1)
;;                              (if k2 (run-command cmd-k2)))
;;                          (set! k1 #f) (set! k2 #f)))))


;; ;; Example:
;; ;;   Shift + b:1                   start an xterm
;; ;;   Shift + b:3                   start an rxvt
;; ;;   Shift + b:1 then Shift + b:3  start gv
;; ;;   Shift + b:3 then Shift + b:1  start xpdf

;; (define-chord-keys '(shift "b:1") '(shift "b:3")
;;   "xterm" "rxvt" "gv" "xpdf")

;; ;; Here the release order have no importance
;; ;; (the same program is started in both case)
;; (define-chord-keys '(alt "b:1") '(alt "b:3")
;;   "gv" "xpdf" "xterm" "xterm")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of xbindkeys guile configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
