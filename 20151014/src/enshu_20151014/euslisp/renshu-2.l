#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 1 (+ i 1)))
      ((> i n) 'done)
      (format t ".")))

(defun dot-2 (n)
  (if (> 1 n)
      'done
    (progn (format t ".")
	   (dot-2 (- n 1)))))

;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (let ((i 0))
    (dolist (x lst i)
      (if (eql x 'a)
	  (setq i (+ i 1))))
    i))

(defun hasa-2 (lst)
  (+
   (if (eql (car lst) 'a)
       1
     0)
   (if (consp (cdr lst))
       (hasa-2 (cdr lst))
     0)))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




