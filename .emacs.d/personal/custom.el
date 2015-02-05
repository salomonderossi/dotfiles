;;; package --- Custom changes for prelude

;;; Commentary:
;;; personal/custom.el for prelude


;;; Code:


;; use bash as shell (because of needed stuff in .bashrc)
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

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
(add-hook 'find-file-hooks 'pload-python-template)

(defun pload-python-template () "Add python template file."
  (interactive)
  (when (and
         (string-match "\\.py$" (buffer-file-name))
         (eq 1 (point-max)))
    (insert-file "~/.emacs.d/personal/template.py")))

(provide 'custom)
;;; custom.el ends here
