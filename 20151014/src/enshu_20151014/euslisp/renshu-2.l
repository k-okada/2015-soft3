#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE


;; 1
(defun dot-1 (num)
  (dotimes (i num) (format t ".")))
(defun dot-2 (num)
  (if (> num 0)
      (progn (format t ".")
      (dot-2 (- num 1))))
  )

;; 
(assert (dot-1 3) "mondai 1")
(assert (dot-2 3) "mondai 1")

;; 2
(defun hasa-1 (list)
  (setq count 0)
  (dolist (x list)
            (if (string-equal x "a")
                (setq count (+ count 1)))) count)

(defun hasa-2 (list)
  (if (not (null list))
  (let ((x (car list)))
    (if (string-equal x "a")
        (+ 1 (hasa-2 (cdr list)))
      (hasa-2 (cdr list)))) 0))
;; 
(assert (eq (hasa-1 '(a b c d a)) 2) "mondai 2")
(assert (eq (hasa-2 '(a b c d a)) 2) "mondai 2")

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




