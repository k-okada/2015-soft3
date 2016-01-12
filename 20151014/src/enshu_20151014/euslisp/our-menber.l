
(defun our-menber(obj lst)
  (if (null lst)
      nil
    (if (eql (car lst) obj)
	lst
      (our-menber obj (cdr lst)))))
