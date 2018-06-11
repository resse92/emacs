;;; init.el --- Summary: 配置文件
;;; Commentary: 初始化，调用myinit.org
;;; code:
(require 'package)
(setq package-enable-at-startup nil)
;; (package-initialize)

;; 设置melpa中国源
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("org" . "http://elpa.emacs-china.org/org/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

;; 缩写模式
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("zrl" "zhuruliang")
					    ))

;; set backuo files to one dictionary
;; (setq backup-directory-alist
;;       `(("." . , (concat user-emacs-directory "backups"))))
;; disable backup
(setq backup-inhibited t)
(setq auto-save-default nil)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory)) ;; 把custom group file放到另外一个文件
(load-file custom-file)

