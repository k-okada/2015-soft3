#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (n)
  (dotimes (i n)
    (format t ".")
    )
  t)
(defun dot-2 (n)
  (if (> n 0)
      (progn (format t ".") (dot-2 (- n 1)))
    nil
    )
  t)  


;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (lst)
  (setq count 0)
  (dolist (val lst)
    (if (equal val 'a)
	(setq count (+ count 1))
      )
    )
  (setq result count)
  ) 

(defun hasa-2 (lst)
  (if (null lst)
      0
    (if (equal 'a (car lst))
	(+ 1 (hasa-2 (cdr lst)))
      (hasa-2 (cdr lst))
      )
    )
  )
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




