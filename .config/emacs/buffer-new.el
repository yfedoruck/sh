(defun xah-new-empty-buffer ()
  "Open a new empty buffer."
  (interactive)
  (let ((buf (generate-new-buffer "untitled")))
    (switch-to-buffer buf)
    (funcall (and initial-major-mode))
    (setq buffer-offer-save t)))

(setq initial-major-mode (quote text-mode))
(global-set-key (kbd "C-t") 'xah-new-empty-buffer)