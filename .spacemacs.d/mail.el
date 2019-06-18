;; -*- mode: emacs-lisp -*-
;; __  __       _  _
;;|  \/  |_   _| || |   ___
;;| |\/| | | | | || |_ / _ \
;;| |  | | |_| |__   _|  __/ :Mu4e Config:
;;|_|  |_|\__,_|  |_|  \___| :ahmed_khaledAtzohoDoTCom:
;;
;; mu4e mode config
(setq mu4e-maildir "~/Mail/Gmail"
      mu4e-drafts-folder "/[Gmail].Drafts"
      mu4e-sent-folder   "/[Gmail].Sent Mail"
      mu4e-trash-folder  "/[Gmail].Trash"
      mu4e-maildir-shortcuts '( ("/INBOX"             . ?i)
                                ("/[Gmail].Sent Mail" . ?s)
                                ("/[Gmail].Trash"     . ?t)
                                ("/[Gmail].All Mail"  . ?a))
      mu4e-get-mail-command "offlineimap"
      mu4e-html2text-command "elinks -dump"
      mu4e-mu-binary "/usr/bin/mu"
      mu4e-attachment-dir "~/Downloads/Mu")

(setq user-mail-address "xxzeroxxah@gmail.com"
      user-full-name  "Ahmed Khaled (David Gabriel)"
      message-signature
      (concat "A.k    Ahmed Khaled\n"
              ;; "\n"
              ;; "My empty blog: xxzozax.gitlab.io/org-mode \n"
              ;; "Reddit : u/XxZozaxX\n"
              ;; "\n"
              ;; "|_|0|_|\n"
              ;; "|_|_|0|\n"
              ;; "|0|0|0|\n"
              "\n" ))

;; Send mail
(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(provide 'mail)
;; mail.el end here
