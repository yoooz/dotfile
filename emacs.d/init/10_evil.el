(use-package undo-tree
  :config
  (global-undo-tree-mode t))

(use-package evil
  :init
  (setq evil-cross-lines t)
  (setq evil-search-module 'isearch)
  (setq evil-want-fine-undo t)
  (setq evil-esc-delay 0)
  (setq evil-insert-state-cursor (let ((color (doom-color 'red))) (list color 'bar)))
  (setq evil-normal-state-cursor (let ((color (doom-color 'green))) (list color 'box)))
  (setq evil-disable-insert-state-bindings t)
  :config
  (evil-set-undo-system 'undo-tree)
  (evil-mode)
  :custom
  (evil-splitt-window-below t)
  (evil-vsplit-window-right t))


(global-set-key "\C-g" 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-r") `counsel-M-x)
(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

(use-package key-chord
  :commands (key-chord-mode)
  :init
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state))

(use-package evil-goggles
  :straight (evil-goggles :type git :host github :repo "edkolev/evil-goggles")
  :ensure t
  :config
  (evil-goggles-mode))

(evil-define-command evil-tab-sensitive-quit (&optional bang)
  :repeat nil
  (interactive "<!>")
  (if (> (length (tab-bar-tabs)) 1)
      (tab-bar-close-tab)
    (evil-quit bang)))

(evil-ex-define-cmd "q[uit]" 'evil-tab-sensitive-quit)
(evil-ex-define-cmd "tabnew" 'tab-bar-new-tab)
