;; quick-sort2.l
(defun quick-sort2 (l &optional (comp #'>=))
  (if (null l) nil
    (labels ((bigger-el (x) (funcall comp x (car l))))
	    (let ((smaller (remove-if #'bigger-el (cdr l)))
		  (bigger  (remove-if-not #'bigger-el (cdr l))))
	      (append (quick-sort2 smaller comp) (list (car l))
		      (quick-sort2 bigger comp))))))
