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
  (if (= n 0)
      'done
    (progn (format t ".")
	   (dot-2 (- n 1)))))
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (if lst
        (+ (if (eq (car lst) 'a) 1 0) (hasA-rec (cdr lst)))
        0))
(defun hasa-2 (lst)
   (do ((cplst lst (cdr cplst))
         (n 0 (+ n (if (eq (car cplst) 'a) 1 0))))
        ((not cplst) n)))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




