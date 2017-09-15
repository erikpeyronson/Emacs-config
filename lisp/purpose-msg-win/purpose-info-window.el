;;; purpose-info-windows -- purpopse plugin for persistent window for special buffers

;;; Commentary:
;; 

;;; Code:

;;; *Ido completions*

(defvar piw-window nil)
(defvar piw-close-hook nil)

(defvar piw-max-height 20)
(defvar piw-min-height 10)

(defvar piw--is-expanded nil)
(defvar piw--is-open nil)
(defvar piw--is-selected nil)

(defvar piw-last-window nil)
(defvar piw--last-bottom-buffer nil)

(defvar piw-info-window nil)
(defvar piw-term-window nil)
(defvar piw-docs-window nil)


(global-set-key (kbd "C-c i") 'piw-map)
(define-prefix-command 'piw-map)

;;(define-key piw-map (kbd "o") 'piw-open)
(define-key piw-map (kbd "c") 'piw-close)
(define-key piw-map (kbd "i") 'piw-toggle-height)
(define-key piw-map (kbd "o") 'piw-toggle)
(define-key piw-map (kbd "s") 'piw-select-or-deselect)

(defun piw-toggle()
  (interactive)
  (if piw--is-open
      (piw-close)
    (piw-open)))

(defun piw-open()
  (interactive)
  (when (not piw--is-open)
    (setq piw-last-window (selected-window))
    ;; (setq ignore-window-parameters t)
    (setq piw-window (split-window (frame-root-window (selected-frame)) 'below nil))
    ;; (setq ignore-window-parameters nil)
    (piw--set-window-height piw-window piw-min-height)
    (set-window-parameter piw-window 'delete-window 'piw--delete-window)
    (set-window-parameter piw-window 'no-other-window t)
    (setq piw--is-expanded nil)
    ;;(piw-shrink)
    
    (select-window piw-window)
    (purpose-set-window-purpose 'info)
    (select-window piw-last-window)
    (setq piw--is-open t)))

;; (set-window-parameter piw delete-window piw-close-hook)
(defun piw-select-or-deselect()
  (interactive)
  (if (not piw--is-selected)
      (progn
        (setq piw-last-window (selected-window))
        (piw-expand)
        (setq piw--is-selected t)
        (select-window piw-window))
    
    (progn
      (select-window piw-last-window)
      (piw-shrink)
      (setq piw--is-selected nil))))


(defun piw-close()
  (interactive)
  (when piw--is-open
    (setq piw-last-window (selected-window))
    (select-window piw-window)
    (setq piw--last-bottom-buffer (current-buffer))
    
    (select-window piw-last-window)
    
    (delete-window piw-window)
    (setq piw--is-open nil)))


(defun piw-toggle-height()
  (interactive)
  (when piw--is-open
    (if piw--is-expanded
        (piw-shrink)
      (piw-expand))))

(defun piw--delete-window(window)
  (setq piw-last-window (selected-window))
  (select-window window)
  (setq piw--last-bottom-buffer (current-buffer))
  (set-window-parameter window 'delete-window nil)
  (delete-window)
  (setq piw--is-open nil))


(defun piw-expand()
  (interactive)
  (when piw--is-open
    (piw--set-window-height piw-window piw-max-height)
    (setq piw--is-expanded t)))


(defun piw-shrink()
  (interactive)
  (when piw--is-open
    (piw--set-window-height piw-window piw-min-height)
    (setq piw--is-expanded nil)))

(defun piw--set-window-height(window height)
  (if ( > (window-size window) height)
      (shrink-window (- height (window-size window)))
    (enlarge-window (- (window-size window) height))))




;; (defun piw-hide-info-window()
;;   (setq piw-last-window (selected-window))

;;   (select-window piw-piwile-window)

;;   )

;;(provide 'purpose-info-window)
;;; purpose-info-window.el ends here
