#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 0 (+ i  1)))
      ((> i n) 'done)
      (print '.)))

(defun dot-2 (n)
  (cond ((= n 0) 'done)
	((> n 0) (print '.)
	   (dot-2 (- n 1)))))

;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (let ((num 0))
    (do ((i  0 (+ i 1)))
	((= i (length lst)) 
	 num)
	(cond ((eq (nth i lst) 'a)
	       (setq num (+ num 1)))))
  num))


(defun hasa-2 (lst)
  (cond ((null (car lst)) 
	 0)
	((eq (car lst) 'a)
	 (+ (hasa-2 (cdr lst)) 1))
	(t (hasa-2 (cdr lst)))))
	 

;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




