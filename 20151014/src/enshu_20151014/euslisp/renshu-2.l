#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n) 
  (if(> n 0)
      (progn
	(format t ".")
	(dot-1 (- n 1))))
  t)

(defun dot-2 (n)
  (dotimes (i n)
    (format t "."))
  t)
;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (if(not lst)
      0
    (if(eq (car lst) 'a)
	(+ 1 (hasa-1 (cdr lst)))
      (hasa-1 (cdr lst)))))
(defun hasa-2 (lst)
  (setq count 0)
  (dolist (x lst)
    (if (eq x 'a)
	(setq count (+ count 1))))
  count)
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




