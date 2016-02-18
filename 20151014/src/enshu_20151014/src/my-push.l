;; my-push.l
(defmacro my-push (x a)
  `(setf ,a (cons ,x ,a)))

(setq a (list 1 2 3))
(print a)
(my-push 0 a)
(print a)
(macroexpand `(my-push 0 a))
