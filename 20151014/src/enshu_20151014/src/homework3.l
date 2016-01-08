(defun count_a_iter (lst)
  (setq count 0)
  (dolist (x lst)
    (if (eql x 'a) (setq count (+ count 1)) nil))
  count)

