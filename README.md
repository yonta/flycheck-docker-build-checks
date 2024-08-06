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
(add-hook 'dockerfile-ts-mode #'flycheck-docker-build-checks-setup))
```

or, with leaf,

```emacs-lisp
(leaf flycheck-docker-build-checks
  :el-get (flycheck-docker-build-checks
           :url "https://github.com/yonta/flycheck-docker-build-checks.git")
  :hook ((dockerfile-mode dockerfile-ts-mode) . flycheck-docker-build-checks-setup))
```

### Use with flycheck-hadolint
