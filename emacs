;;;; nixan's .emacs
;; 2025.02.19

(load-theme 'wombat)
(setq-default ident-tabs-mode t)
(setq-default tab-width 8)
(defvaralias 'c-basic-offset 'tab-width)
(global-set-key (kbd "C-M-o") 'other-frame)
(setq-default column-number-mode t)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq visible-cursor nil)
(when (>= emacs-major-version 21)
  (blink-cursor-mode 0))
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages '(company-irony flycheck-irony irony magit)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)

;;;; MELPA
(require 'package)
(add-to-list 'package-archives
	                  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;;; Irony auto complete
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-irony)
(require 'company-irony-c-headers)
(require 'company-clang)
(eval-after-load 'company '(add-to-list 'company-backends 'company-clang))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony-c-headers))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))

;;(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;;;; backup
(setq backup-directory-alist `(("." . "~/.emacs.backups")))
(setq version-control t)
(setq delete-old-versions t)
