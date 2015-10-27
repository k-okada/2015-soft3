#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (dotimes (i n) (format t ".")))
(defun dot-2 (n)
  (if (> n 0)       
    (progn (format t ".")
	   (dot-2 (- n 1)))))
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (setq num 0)
  (dolist (x lst)
    (if (= x ?a)
	(setq num (+ num 1))))
  num)
(defun hasa-2 (lst)
  (setq x (car lst))
  (cond ((null x)
	 0)
	((= x ?a)
	 (+ 1 (hasa-2 (cdr lst))))
	(t (hasa-2 (cdr lst)))))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)

