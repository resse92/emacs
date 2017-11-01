
(setq inhibit-starup-message t)
(setq package-enable-at-startup nil)
(setq inhibit-startup-message t) ;; 关闭启动画面
(setq make-backup-files nil) ;; 关闭自动备份
(setq auto-save-default nil) ;; 关闭自动保存
(set-face-attribute 'default nil :height 160) ;; 设置默认字体
(global-linum-mode 1) ;; 打开行数
(tool-bar-mode -1) ;; 关闭工具栏
(global-linum-mode 1) ;; 高亮显示当前行
(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 默认全屏

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
       '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

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

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;; org-mode 相关
(require 'org)
(setq org-src-fontify-natively t) ;; 设置orgmode 代码高亮

(use-package popwin
  :config
  (popwin-mode 1))
