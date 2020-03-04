(use-package lsp-mode
  :defer t
  :commands (lsp)
  :config
  (setq lsp-file-watch-threshold 3000)
  (use-package lsp-ui)
  (use-package hydra)
  (use-package company-lsp))

(use-package ag  ; needed by projectile
  :defer t)      ; for search 

(use-package projectile
  :defer t
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package magit
  :commands (magit-status
	     magit-commit))

(use-package company
  :commands (company-mode)
  :config
  (setq company-idle-delay 0.1)
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous)))

(use-package company-quickhelp
  :after (company)
  :hook (prog-mode . company-quickhelp-mode))

(provide 'programming)
