;; selection-sort.l
(defun selection-sort (l)
  (labels ((min-list (l)
		     (let ((best (car l)))
		       (dolist (el l best)
			 (if (<= el best) (setf best el))))))
	  (do* ((so-far nil (push (min-list lis) so-far))
		(lis l (remove (min-list lis) lis :count 1)))
	       ((null lis) (reverse so-far)))))
