;;; package --- Custom changes for prelude

;;; Commentary:
;;; personal/custom.el for prelude


;;; Code:


;; start server (if not running already)
(require 'server)
(unless (server-running-p)
    (server-start))

;(setq initial-major-mode 'org-mode)
;
;; change *scratch* buffer message
;(setq initial-scratch-message "\
;#+ This buffer is for notes you don't want to save, and for Ruby code.
;#+ If you want to create a file, visit that file with C-x C-f,
;#+ then enter the text in that file's own buffer.")


;; use bash as shell (because of needed stuff in .bashrc)
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; enable ido mode
(require 'ido)
(ido-mode t)

;; disable flyspell
(setq prelude-flyspell nil)

;; allow movement via arrow keys (old habbits are old...)
(setq prelude-guru nil)

;; use lua-mode
(prelude-require-package 'lua-mode)

;; use snippets via tab-completion
(prelude-require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)

;; show line numbers
(global-linum-mode t)

;; auto-completion via hippie-expand (need to rebind alt-space in the given window-manager!)
(global-set-key "\M- " 'hippie-expand)

;; compile with f5
(global-set-key [f5] 'compile)

;; disable line wrap
(setq-default truncate-lines t)
;; make side by side buffers function the same as the main window
(setq truncate-partial-width-windows nil)

;; highlight lines longer than 110 characters
(setq whitespace-line-column 110) ;; limit line length

;; cua-mode for colum-editing
(cua-mode t)

; switching betweet source/header via "C-c o" in C/C++
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c z") 'ff-find-other-file)))

;; show the name of the current function definition in the modeline
(require 'which-func)
(setq which-func-modes t)
(which-function-mode 1)

;; disable auto saving when mouse leaves the buffer
(remove-hook 'mouse-leave-buffer-hook #'prelude-auto-save-command)


;; TODO: nicer solution via http://www.emacswiki.org/emacs/AutoInsertMode
;; template when creating a new python file
;;(add-hook 'find-file-hooks 'pload-python-template)
;;
;;(defun pload-python-template () "Add python template file."
;;  (interactive)
;;  (when (and
;;         (string-match "\\.py$" (buffer-file-name))
;;         (eq 1 (point-max)))
;;    (insert-file "~/.emacs.d/personal/template.py")))

(auto-insert-mode)  ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/personal/") ;;; Or use custom, *NOTE* Trailing slash important
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(define-auto-insert "\.py" "template.py")
(define-auto-insert "\.org" "template.org")


;; Enable source code evaluation for dot
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

;; Emacs major mode for editing Kivy files
(require 'kivy-mode)
(add-to-list 'auto-mode-alist '("\\.kv$" . kivy-mode))

;; Enable flyspell for org mode
(add-hook 'org-mode-hook 'turn-on-flyspell)

;; Increase error threshold for flake8
(add-hook 'python-mode-hook (lambda ()
                               (flycheck-mode 1)
                               (semantic-mode 1)
                               (setq flycheck-checker 'python-flake8
                                     flycheck-checker-error-threshold 2000)))

(provide 'custom)
;;; custom.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-firefox)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
