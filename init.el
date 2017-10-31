(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

;; 设置melpa中国源
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(global-linum-mode 1)
(tool-bar-mode -1)
(use-package try
  :ensure t)
(setq inhibit-startup-message t) ;; 关闭启动画面
(setq make-backup-files nil) ;; 关闭自动备份
(set-face-attribute 'default nil :height 160) ;; 设置默认字体
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck zenburn-theme which-key use-package try org-bullets counsel company ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
