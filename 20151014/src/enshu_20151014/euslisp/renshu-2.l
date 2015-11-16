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
  (setq tmp lst)
  (setq cnt 0)
  (do ((i 1 (+ i 1)))
      ((> i (length lst)) 'done)
      (progn (if (eq (car tmp) 'a)
		 (setq cnt (+ cnt 1)))
	     (setq tmp (cdr tmp))))
  cnt)
(defun hasa-2 (lst)
  (if (not (eq (car (cdr (cdr lst))) 0))
      (setq buf (cons lst '(0 0)))
    (setq buf lst))
  
  (if (eq (car buf) nil)
      (car (cdr buf))
    (if (eq (car (car buf)) 'a)
	(progn
	  (setq buf (cons (cdr (car buf)) (list (+ 1 (car (cdr buf))) 0)))
	  (hasa-2 buf))
      (progn
	(setq buf (cons (cdr (car buf)) (list (car (cdr buf)) 0)))
	(hasa-2 buf)))))
  

	
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
;;(exit 1)




