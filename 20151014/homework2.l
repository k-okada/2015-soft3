(defun show-period1 (x)
  (do ((i 1 (+ i 1)))
      ((> i x) 'done)
      (format t ".")))

(defun show-period2 (x)
  (if (> 1 x)
      'done
    (progn (format t ".")
	   (show-period2 (- x 1)))))

(defun find-a1 (list)
  (let ((i 0))
    (dolist (x list i)
      (if (eql x 'a)
	  (setq i (+ i 1))))
  (format t "~A" i)))

(defun hasa-2 (lst)
    (+ 
     (if (eql (car lst) 'a)
	 1
       0)
     (if (consp (cdr lst))
	 (hasa-2 (cdr lst))
       0)))
