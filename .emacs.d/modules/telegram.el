(use-package emojify
  :commands (emojify-mode))

(use-package telega
  :commands (telega)
  :hook ((telega-root-mode . emojify-mode)
	 (telega-chat-mode . emojify-mode)
	 (telega-chat-mode . company-mode))
  :config
  (telega-mode-line-mode 1)
  (setq telega-chat-button-width 28
        telega-cache-dir (expand-file-name "~/Downloads/telega")))

(provide 'telegram)
