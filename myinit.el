
(setq inhibit-starup-message t)
(setq package-enable-at-startup nil)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; avy has many splash features
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))
(load-theme 'leuven t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
