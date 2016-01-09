;; quick-sort.l
(defun quick-sort (l)
  (if (null l) nil
    (labels ((bigger-el (x) (>= x (car l))))                     ; t if x > first
	    (let ((smaller (remove-if #'bigger-el (cdr l)))      ; all < first
		  (bigger  (remove-if-not #'bigger-el (cdr l)))) ; all > first
	      (append (quick-sort smaller) (list (car l))
		      (quick-sort bigger))))))
