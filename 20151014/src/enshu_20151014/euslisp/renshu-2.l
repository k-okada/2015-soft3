#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i n (- i 1)))
      ((eq i 0) t)
      (format t "~A" ".")))
;  t)
(defun dot-2 (n)
  (format t "~A" ".")
  (if (eq n 1)
      t
    (dot-2 (- n 1))))
;  t)
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (let ((cnt 0))
    (dolist (i lst)
      (if (equal i 'a)
	  (setq cnt (+ cnt 1))))
    cnt))

;  0)
(defun hasa-2 (lst)
  (labels 
   ((hma (c list)
	 (cond ((equal (car list) 'a) (hma (+ c 1) (cdr list)))
	       ((null list) c)
	       (t (hma c (cdr list))))))
   (hma 0 lst)))
;  0)
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




