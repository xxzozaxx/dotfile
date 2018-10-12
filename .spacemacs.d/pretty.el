;; -*- mode: emacs-lisp -*-
;; prettify symbols mode config
(global-prettify-symbols-mode t)
(add-hook 'prog-mode-hook
          (lambda ()
            (push '("!=" . ?≠) prettify-symbols-alist)
            (push '("<=" . ?≤) prettify-symbols-alist)
            (push '(">=" . ?≥) prettify-symbols-alist)
            ;; composition notation ◦
            (push '("."  . ?•) prettify-symbols-alist)
            (push '("==" . ?≡) prettify-symbols-alist)

            ;; Type
            ;; (push '("int"     . ?ℤ) prettify-symbols-alist)
            ;; (push '("float"   . ?ℝ) prettify-symbols-alist)
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

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (push '("nil"   . ?Ø) prettify-symbols-alist)))

(add-hook 'scheme-mode-hook
          (lambda ()
            (push '("lambda" . ?λ) prettify-symbols-alist)))
(setq prettify-symbols-unprettify-at-point t)

(provide 'pretty)
;; pretty.el end here
