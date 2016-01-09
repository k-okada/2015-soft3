(defun factoral (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
      ((= j 0) f)))
