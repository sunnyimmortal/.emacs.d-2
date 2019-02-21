;;; dylan-magit.el --- summary -*- lexical-binding: t -*-

;; Author: Dylan Yang
;; Maintainer: Dylan Yang

;;; Commentary:
;;; Code:

(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  (when sys/winntp
    (setenv "GIT_ASKPASS" "git-gui--askpass"))

  ;; Access Git forges from Magit
  ;; https://github.com/skeeto/emacsql#windows-issues
  (unless sys/winntp
    (use-package forge :demand))

  ;; Show tasks
  (use-package magit-todos
    :init (magit-todos-mode 1)))

;; Walk through git revisions of a file
(use-package git-timemachine
  :bind (:map vc-prefix-map
              ("t" . git-timemachine)))

;; Highlighting regions by last updated time
(use-package smeargle
  :bind (:map vc-prefix-map
              ("S" . smeargle)
              ("C" . smeargle-commits)
              ("R" . smeargle-clear)))

;; Git related modes
(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)

(provide 'dylan-magit)
;;; dylan-magit.el ends here
