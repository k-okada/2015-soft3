#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (dotimes (i n) 
    (format t "."))
  t)
(defun dot-2 (n)
  (when (> n 0)
    (format t ".")
    (dot-1 (- n 1)))
  t)
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2

(defun hasa-1 (lst)
  (let (cnt)
    (setq cnt 0)
    (dolist (lstcmp lst)
      (if (eq lstcmp 'a) (setq cnt (+ cnt 1))))
  cnt))

(defun hasa-2 (lst)
  (if (eq lst nil) 0
    (unless (eq lst nil)
      (if (eq (car lst) 'a)
	  (+ 1 (hasa-2 (cdr lst)))
	(hasa-2 (cdr lst))))))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




