#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 0 (+ i 1)))
      ((eq i n))
      (princ '.))
  t
  )

(defun dot-2 (n)
  (cond ((eq n 1) )
	((null (eq n 0))  (dot-2 (- n 1)) (princ '.))
  )
  t
)

;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (setq n 0)
  (while (null (null lst))
    (cond ((eq (car lst) 'a)
	   (setq n (+ n 1))
	   (setq lst (cdr lst)))
	  ((null (eq (car lst) 'a))
	   (setq lst (cdr lst)))
      )
    )
  n)

(defun hasa-2 (lst)
  (cond ((null lst) 0)
	((null (null lst))
	 (cond ((eq (car lst) 'a)
		(+ 1 (hasa-2 (cdr lst))))
	       ((null (eq (car lst) 'a))
		(hasa-2 (cdr lst))))
	 )
	)
  )
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
