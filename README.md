# flycheck-docker-build-checks

Flycheck extension for Docker Build Checks

## Requirement

- Docker
- Emacs
- flycheck

## Install

1. Install Docker
1. Place `flycheck-docker-build-checks.el` in a location included in the Emacs load path.
1. Add the fllowing code to your `init.el`.

```emacs-lisp
(add-hook 'dockerfile-mode #'flycheck-docker-build-checks-setup)
;; or
(add-hook 'dockerfile-ts-mode #'flycheck-docker-build-checks-setup))
```

or, with leaf,

```emacs-lisp
(leaf flycheck-docker-build-checks
  :el-get (flycheck-docker-build-checks
           :url "https://github.com/yonta/flycheck-docker-build-checks.git")
  :hook (dockerfile-ts-mode-hook . flycheck-docker-build-checks-setup))
```

### Use with dockerfile-hadolint

dockerfile-hadolint is also useful checker for dockerfile-mode.
You can use dockerfile-hadolint and flycheck-docker-build-checks together, like this.

```emacs-lisp
(defvar-local my/flycheck-next-local-cache nil)
(leaf my/flycheck-next
  :url "https://github.com/flycheck/flycheck/issues/1762"
  :leaf-autoload nil
  :leaf-path nil
  :defun my/flycheck-next-checker-get
  :preface
  (defun my/flycheck-next-checker-get (fn checker property)
    (or (alist-get property (alist-get checker my/flycheck-next-local-cache))
        (funcall fn checker property)))
  :advice (:around flycheck-checker-get my/flycheck-next-checker-get))

(leaf flycheck-docker-build-checks
  :defun flycheck-docker-build-checks-setup
  :el-get (flycheck-docker-build-checks
           :url "https://github.com/yonta/flycheck-docker-build-checks.git")
  :hook
  (dockerfile-ts-mode-hook
   . (lambda ()
       (setq my/flycheck-next-local-cache
             '((docker-build-checks
                . ((next-checkers . (dockerfile-hadolint))))))
       (flycheck-docker-build-checks-setup))))
```
