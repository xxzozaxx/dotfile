;;; packages.el --- smartline layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: master <master@debian.master>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `smartline-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `smartline/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `smartline/pre-init-PACKAGE' and/or
;;   `smartline/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst smartline-packages
  '(smart-mode-line))


;;; packages.el ends here
(defun smartline/post-init-smart-mode-line ()
  (use-package smart-mode-line
   :ensure t
   :config
   (progn
     (setq sml/no-confirm-load-theme t)
     (setq sml/theme 'respectful)
     (add-hook 'after-init-hook (sml/setup)))))
