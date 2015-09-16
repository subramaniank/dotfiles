(setq org-agenda-files '("~/org"))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq ns-right-alternate-modifier nil)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(add-to-list 'load-path "~/.emacs.d/yaml/")

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'load-path "~/.emacs.d/md-mode/")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; autopep8 configuration. Credits : @scriptdevil
(setq autopep8-comand "/usr/local/bin/autopep8")

    (defun my-pep8 ()
      (interactive)

      ;; run autopep8 on file
      (shell-command (concat autopep8-path " -i " f) nil t)
      ;; load back the changes
      (revert-buffer t t))

    (if (file-exists-p autopep8-path)
        (add-hook 'after-save-hook
              (lambda ()
            (let ((f (buffer-file-name)))
              (if (string-suffix-p ".py" f)
                  (my-pep8))))))
