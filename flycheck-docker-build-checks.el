;;; flycheck-docker-build-checks.el --- Flycheck: docker build checks support  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 SAITOU Keita <keita44.f4@gmail.com>

;; Author: SAITOU Keita <keita44.f4@gmail.com>
;; URL: https://github.com/yonta/flycheck-docker-build-checks.git
;; Keywords: convenience, tools, languages
;; Version: 0.1
;; Package-Requires: ((emacs "24.1") (flycheck "0.22"))

;;; Commentary:

;; This is flycheck extension for Docker Build Checks.

;;; Code:

(require 'flycheck)

(flycheck-define-checker docker-build-checks
  "A Dockerfile linter using Docker Build Checks."
  :command ("docker" "build" "--check" "--file" source ".")
  :error-patterns
  ((error line-start "ERROR: " (message) "\n"
          (file-name) ":" line line-end)
   (warning line-start "WARNING: " (id (+ not-newline)) "\n"
            (message) "\n"
            (file-name) ":" line line-end))
  :modes (dockerfile-mode dockerfile-ts-mode))

;;;###autoload
(defun flycheck-docker-build-checks-setup ()
  "Setup flycheck-docker-build-checks."
  (add-to-list 'flycheck-checkers 'docker-build-checks))

(provide 'flycheck-docker-build-checks)
;;; flycheck-docker-build-checks.el ends here
