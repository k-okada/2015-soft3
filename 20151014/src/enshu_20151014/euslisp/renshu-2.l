#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 0 (+ i 1)))
      ((= i n ) nil)
      (print '.)
      )
  )
(defun dot-2 (n)
  (cond ((= n 0 ) nil)
	(t (print '.)
	   (test2 (- n 1))
	   ))
  )
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (let( (count 0))
    (do ((i 0 (+ i 1)))
	((= i (length lst)) count)
	(cond ((eq (nth i lst) 'a) (setq count (+ count 1)))))
    count
    )
  )
(defun hasa-2 (lst)
  (cond ((null (car lst) ) 0)
	((eq (car lst) 'a) (+ 1  (test4 (cdr lst))))
	(t (test4 (cdr lst)))
	)
  )
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




