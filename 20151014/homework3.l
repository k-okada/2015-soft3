;;(defun summit (lst)
;;  (setq lst (remove nil lst))
;;  (apply #'+ lst))

(defun summit (lst)
  (let ((x (car lst)))
    (if (null (cdr lst))
	0
      (if (null x)
	  (summit (cdr lst))
	(+ x (summit (cdr lst)))))))
