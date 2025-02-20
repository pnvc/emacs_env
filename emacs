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
