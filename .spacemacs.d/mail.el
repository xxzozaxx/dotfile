;; -*- mode: emacs-lisp -*-
;; mu4e mode config
(setq mu4e-maildir "~/Mail/Gmail"
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder   "/[Gmail].Sent Mail"
      mu4e-trash-folder  "/[Gmail].Trash"
      mu4e-maildir-shortcuts '( ("/INBOX"               . ?i)
                                ("/[Gmail].Sent Mail"   . ?s)
                                ("/[Gmail].Trash"       . ?t)
                                ("/[Gmail].All Mail"    . ?a))
      mu4e-get-mail-command "offlineimap")

(setq user-mail-address "xxzeroxxah@gmail.com"
      user-full-name  "Ahmed Khaled"
      message-signature
      (concat "Ahmed Khaled\n"
              "\n"
              ;; "My empty blog: xxzozax.gitlab.io/org-mode \n"
              ;; "Reddit : u/XxZozaxX\n"
              ;; "\n"
              "|_|0|_|\n"
              "|_|_|0|\n"
              "|0|0|0|\n"
              "\n") )

;; Send mail
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(provide 'mail)
;; mail.el end here
