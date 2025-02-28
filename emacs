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

;;;; F1-7 frames
(defun switch-to-frame-n (n)
  "set active frame number n"
  (interactive "nFrame number: ")
  (let* ((frames (frame-list))
	 (frame-count (length frames))
	 (adjusted-n (- frame-count n)))
    (if (or (< n 1) (> n frame-count))
	(message "no frame with %d! number. Frames count: %d" n frame-count)
      (let ((target-frame (nth adjusted-n frames)))
	(select-frame-set-input-focus target-frame)
	(message "set frame %d from %d count" n frame-count)))))
(global-set-key (kbd "<f1>") (lambda () (interactive) (switch-to-frame-n 1)))
(global-set-key (kbd "<f2>") (lambda () (interactive) (switch-to-frame-n 2)))
(global-set-key (kbd "<f3>") (lambda () (interactive) (switch-to-frame-n 3)))
(global-set-key (kbd "<f4>") (lambda () (interactive) (switch-to-frame-n 4)))
(global-set-key (kbd "<f5>") (lambda () (interactive) (switch-to-frame-n 5)))
(global-set-key (kbd "<f6>") (lambda () (interactive) (switch-to-frame-n 6)))
(global-set-key (kbd "<f7>") (lambda () (interactive) (switch-to-frame-n 7)))

;;;; set every frame directory
(defun set-frame-working-directory (dir)
  "Установить рабочую директорию для текущего фрейма."
  (interactive "DSet working directory: ")
  (let ((frame (selected-frame)))
    (set-frame-parameter frame 'working-directory dir)
    (dolist (window (window-list frame))
      (with-current-buffer (window-buffer window)
	(set (make-local-variable 'default-directory) dir)))))

;; Синхронизация default-directory при переключении фреймов или окон
(defun sync-frame-directory ()
  "Синхронизировать default-directory с директорией текущего фрейма."
  (let ((frame (selected-frame)))
    (let ((frame-dir (frame-parameter frame 'working-directory)))
      (dolist (window (window-list frame))
	(with-current-buffer (window-buffer window)
	  (set (make-local-variable 'default-directory)
	       (if frame-dir
		   frame-dir
		 (expand-file-name "~/"))))))))

;; Хуки для синхронизации
(add-hook 'after-make-frame-functions
	  (lambda (frame)
	    (with-selected-frame frame
	      (sync-frame-directory))))
(add-hook 'select-frame-hook 'sync-frame-directory)
(add-hook 'window-configuration-change-hook 'sync-frame-directory)

;; Привязка команды для установки директории
(global-set-key (kbd "C-c d") 'set-frame-working-directory)

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
