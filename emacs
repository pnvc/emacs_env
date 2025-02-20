(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1711947b59ea934e396f616b81f8be8ab98e7d57ecab649a97632339db3a3d19" default))
 '(package-selected-packages '(auto-header)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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

