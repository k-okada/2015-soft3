#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
(dotimes (i n)(princ "\."))
  t)
(defun dot-2 (n)
(if (= n 0) nil (progn (princ "\.") (dot-2 (1- n))))
  t)
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)(setq num 0)
  (dotimes (i 5)
    (if (equal (car lst) (quote a))(setq num (+ 1 num)))
    (setq lst (cdr lst)))
num)

(defun hasa-2 (lst)
(setq   num 0)
  (if (= (length lst) 0) 0 (progn
                                (if (equal (quote a) (car lst)) (setq num (+ 1 num)) num)
                                (setq num (+ num (hasa-2 (cdr lst)) ))
                                )
      )
num)

;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




