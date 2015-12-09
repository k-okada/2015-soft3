;; my-popback.l
(defmacro my-popback (a) `(let ((x ,a))
			    (while (consp (cddr x)) (setq x (cdr x)))
			    (prog1 (cadr x) (setf (cdr x) nil))))

(setq a (list 0 1 2 3))
(print a)
(my-popback a)
(print a)
