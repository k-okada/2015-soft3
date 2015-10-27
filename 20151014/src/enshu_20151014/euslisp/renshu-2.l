#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 1 (+ i 1)))
      ((> i n) 'done)
      0)))

(defun dot-2 (n)
  (if (= n 0)
      'done
    (progn
      (format t ".")
      (dot-2 (- n 1)))))
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (setq x lst)
  (setq cnt 0)
  (do ((x lst (cdr x)))
      ((null x) cnt)
	(if (eq (car x) 'a)
	    (setq cnt (+ cnt 1))
	  0)))

(defun hasa-2 (lst)
  (if (null lst)
      0
    (let ((x (car lst)))
      (if (eq x 'a)
	  (+ (hasa-2 (cdr lst)) 1)
	(hasa-2 (cdr lst))))))
;; 
(assert (equal (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (equal (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




