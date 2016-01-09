;; my-pop.l
(defmacro my-pop (a)
  `(let ((x (car ,a)))
     (setf ,a (cdr ,a)) x))

(setq a (list 1 2 3))
(print a)
(my-pop a)
(print a)
