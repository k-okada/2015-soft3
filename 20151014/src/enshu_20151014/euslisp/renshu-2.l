#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (do ((i 0 (+ i 1)))
      ((> i (- n 1)) 'done)
      (print "."))
  t)
(defun dot-2 (n)
  (setq j 0)
  (if (> j (- n 1))
      'done
    (progn (print ".")
	   (+ j 1)
	   (dot-2 (- n 1))))
  t)
;; 
;(assert (dot-1 3) "mondai 1")
;(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (setq num 0)
  (dolist (i lst)
    (if (equal i 'a)
	(setq num (+ num 1))
      )
    )
  num
  )

(defun hasa-2 (lst)
  (cond ((null (car lst)) 0)
	((equal (car lst) 'a) (+ 1 (hasa-2 (cdr lst))))
	(t (hasa-2 (cdr lst)))
	)
  )
;  (if lst
;      (+ (if (eq (car lst) 'a) 1 0) (hasa-1 (cdr lst)))))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




