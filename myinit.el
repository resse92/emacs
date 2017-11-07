(setq inhibit-starup-message t)
(setq package-enable-at-startup nil)
(setq inhibit-startup-message t) ;; 关闭启动画面
(setq make-backup-files nil) ;; 关闭自动备份
(setq auto-save-default nil) ;; 关闭自动保存
(set-face-attribute 'default nil :height 160) ;; 设置默认字体
(global-linum-mode 1) ;; 打开行数
(tool-bar-mode -1) ;; 关闭工具栏
(global-hl-line-mode t) ;; 高亮显示当前行
(setq initial-frame-alist (quote ((fullscreen . maximized)))) ;; 默认全屏
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

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

(use-package company-tern
  :ensure t
  :config
  (progn
    (add-to-list 'company-backends 'company-tern)
    (add-hook 'js2-mode-hook (lambda ()
			       (tern-mode)))
    (define-key tern-mode-keymap (kbd "M-.") nil)
    (define-key tern-mode-keymap (kbd "M-,") nil)))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark t))

;; 安装flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; 安装flycheck-less支持
(use-package flymake-less
  :ensure t
  :config
  (add-hook 'less-css-mode-hook 'flymake-less-load))

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
  :ensure t
  :config
  (popwin-mode 1))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  ;; 在emacs-lisp中，单引号不成双出现
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil))

(use-package js2-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (setq-default js2-basic-offset 2)
    (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
    (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)))

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(use-package web-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
    (add-hook 'web-mode-hook 'my-web-mode-indent-setup)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)))

(use-package js2-refactor
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c RET"))

(use-package vue-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.wpy\\'" . vue-mode))))

(use-package less-css-mode
  :ensure t
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))
    ;; 这边没生效，需要调整
    (add-hook 'less-css-mode-hook (lambda () (set (make-local-variable 'css-indent-offset) 2)))))

(use-package xref-js2
  :ensure t
  :config
  (progn
    (define-key js-mode-map (kbd "M-.") nil)
    (add-hook 'js2-mode-hook (lambda ()
			       (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))))

(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package iedit
  :ensure t)

(use-package org-page
  :ensure t
  :config
  (progn
    (setq op/repository-directory "~/Documents/myblog/")   ;; the repository location
    (setq op/site-domain "http://your.personal.site.com/")         ;; your domain
;;; the configuration below you should choose one, not both
    (setq op/personal-disqus-shortname "your_disqus_shortname")    ;; your disqus commenting system
    (setq op/hashover-comments t)                  ;; activate hashover self-hosted comment system
    (setq op/site-main-title "zhuruliang")
    (setq op/site-sub-title "I'm a noob, I need to learn! 菜鸟，学特么的！")
    (setq op/personal-github-link "https://www.github.com/zhuruliang/")
    (setq op/theme 'org-page-theme-kactus)
    ))

(use-package nginx-mode
  :ensure t)

(use-package projectile
  :ensure t)

(use-package projectile-speedbar
  :ensure t)

;; 当光标在两个括号中间时，显示当前所在括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
            (ignore-errors (backward-up-list))
            (funcall fn)))))
;; 用于删除win中的换行符^M
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))
