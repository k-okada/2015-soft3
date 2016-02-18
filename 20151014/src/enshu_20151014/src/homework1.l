(defun periods_iter (n)
  (do ((i n (- i 1)))
      ((= i 0) (format t "~%"))
      (format t ".")))
