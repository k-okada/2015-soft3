# HOMEWORK 20151014

##オペレータx

1) (car (x (cdr '(a (b c) d))))
  b
  *x = car*

2) (x 13 (/ 1 0))
  13
  *x = quote*

3) (x #'list 1 nil)
  (1)
  *x = apply*

##反復と再帰

1)
 (反復)
    (defun periods_iter (n)
      (do ((i n (- i 1)))
          ((= i 0) (format t "~%"))
          (format t ".")))

 (再帰)
    (defun periods_rec (n)
      (if (> n 0)
          (progn
    	    (format t ".")
    	    (periods_rec (- n 1)))
        (format t "~%")))



