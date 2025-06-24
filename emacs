;;;; nixan's .emacs
;; 2025.02.19

(load-theme 'wombat)
(setq-default ident-tabs-mode t)
(setq-default tab-width 8)
(defvaralias 'c-basic-offset 'tab-width)
;(global-set-key (kbd "C-M-o") 'other-frame)
(setq-default column-number-mode t)
(setq-default fill-column 80)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq visible-cursor nil)
(when (>= emacs-major-version 21)
  (blink-cursor-mode 0))

;;; set work dir and pwd shortcuts
(global-set-key (kbd "C-c C-d") 'cd)
(global-set-key (kbd "C-c C-p") 'pwd)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-p") 'previous-line)
(global-set-key (kbd "C-x C-o") 'other-frame)

;;;; backup
(setq backup-directory-alist `(("." . "~/.emacs.backups")))
(setq version-control t)
(setq delete-old-versions t)

;;;; lisp tabs width and always min 4
(add-hook 'lisp-mode-hook
	#'(lambda () (setq tab-width 4) (setq lisp-indent-offset 4)))

;;;; select frames by F1-F8
(defun _select-frame-by-name (name current-frame-name flag)
  (cond
   ((string-equal (frame-parameter nil 'name) name) (message "selected frame")) ; if cathced - enough
   ((and flag (string-equal (frame-parameter nil 'name) current-frame-name)) ; endless loop prevent
    (message "no frame with this name"))
   (t (other-frame 1) (_select-frame-by-name name current-frame-name t)) ; select next frame
  )
)

(defun select-frame-by-name (namee)
  (_select-frame-by-name namee (frame-parameter nil 'name) nil))

(global-set-key [f1] (lambda () (interactive) (select-frame-by-name "F1")))
(global-set-key [f2] (lambda () (interactive) (select-frame-by-name "F2")))
(global-set-key [f3] (lambda () (interactive) (select-frame-by-name "F3")))
(global-set-key [f4] (lambda () (interactive) (select-frame-by-name "F4")))
(global-set-key [f5] (lambda () (interactive) (select-frame-by-name "F5")))
(global-set-key [f6] (lambda () (interactive) (select-frame-by-name "F6")))
(global-set-key [f7] (lambda () (interactive) (select-frame-by-name "F7")))
(global-set-key [f8] (lambda () (interactive) (select-frame-by-name "F8")))
