;;; packages.el --- NAND layer packages file for Spacemacs.
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
;; added to `NAND-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `NAND/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `NAND/pre-init-PACKAGE' and/or
;;   `NAND/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst NAND-packages
  '(nand2tetris
    nand2tetris-assembler
    ;;company-nand2tetris
    ))

(defun NAND/init-nand2tetris ()
  (use-package nand2tetris
    :ensure t
    :mode (("\\.hdl\\'" . nand2tetris-mode))
    :init (setq nand2tetris-core-base-dir "~/Documents/Technical/Computer_Arch_&_Critic_Eng/NAND2Tetris/nand2tetris")))

(defun NAND/init-nand2tetris-assembler ()
  (use-package nand2tetris-assembler
    :ensure t))

;;; packages.el ends here
