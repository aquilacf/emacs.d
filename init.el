;;; init.el --- EMACS
;;; Commentary:
;;; Code:

; Load core
(load (concat user-emacs-directory "configs/core"))

(load-directory dir-modes)



;; Requires >v24.4
;; Install package repositories
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Start package manager
(eval-when-compile
  (require 'use-package))

;; Enable line numbers >v26
(global-display-line-numbers-mode)


;; Monokai theme >v26
(use-package monokai-theme
	:ensure t
	:init
		(load-theme 'monokai t))

;; GIT gutter
;@TODO: all lines show as modified when idle, update-interval is off meanwhile
(use-package git-gutter
	:ensure t
	:init
		(custom-set-variables '(git-gutter:added-sign " +")
				      '(git-gutter:deleted-sign " -")
				      '(git-gutter:modified-sign " \u2502")
				      '(git-gutter:separator-sign nil)
				      '(git-gutter:unchanged-sign nil)

				      '(git-gutter:lighter " GitG")
				      '(git-gutter:window-width 2)
				      '(git-gutter:update-interval 0)
				      '(git-gutter:visual-line t))
		'(git-gutter:hide-gutter t)
		(global-git-gutter-mode t)

	:config
		(set-face-background 'git-gutter:added nil)
		(set-face-background 'git-gutter:deleted nil)
		(set-face-background 'git-gutter:modified nil)
		(set-face-background 'git-gutter:unchanged nil)

		(set-face-foreground 'git-gutter:added "green")
		(set-face-foreground 'git-gutter:deleted "red")
		(set-face-foreground 'git-gutter:modified "yellow")
		(set-face-foreground 'git-gutter:unchanged nil))


;; .editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; Flycheck @todo:finish this
(use-package flycheck
	:ensure t
	:init
		(global-flycheck-mode))


;; Company @todo: finish this
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-dabbrev-downcase nil
	company-tooltip-align-annotations t
	;; Navigation with M-<n>
	company-show-numbers t))





;; Load lisp files by context
; C languages
;(load (concat user-emacs-directory "c/init"))

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added-sign " +")
 '(git-gutter:deleted-sign " -")
 '(git-gutter:lighter " GitG")
 '(git-gutter:modified-sign " │")
 '(git-gutter:separator-sign nil)
 '(git-gutter:unchanged-sign nil)
 '(git-gutter:update-interval 0)
 '(git-gutter:visual-line t)
 '(git-gutter:window-width 2)
 '(package-selected-packages
   (quote
    (flycheck-google-cpplint use-package monokai-theme git-gutter flycheck editorconfig company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
