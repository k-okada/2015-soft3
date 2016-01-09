(defun periods_rec (n)
  (if (> n 0)
      (progn
	(format t ".")
	(periods_rec (- n 1)))
    (format t "~%")))
