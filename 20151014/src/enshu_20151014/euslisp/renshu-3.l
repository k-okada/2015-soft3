#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

(defun unittest-error (code msg1 form &optional (msg2))
  (format *error-output* "~C[1;3~Cm~A unittest-error: ~A"
	  #x1b (+ 1 48)   *program-name* msg1)
  (if msg2 (format *error-output* " ~A" msg2))
  (if form (format *error-output* " in ~s" form))
  (format *error-output* ", exitting...~C[0m~%"  #x1b)
  (when code
    (format *error-output* "~C[3~Cm[ERROR] test ~A failed" #x1b 49 form)
    (format *error-output* " ... (~A ~A)" msg1 code)
    (format *error-output* ".~C[0m~%" #x1b))
  (exit 1))

(lisp::install-error-handler 'unittest-error)

;; removeでの返り値を変数に保存してやればよい。
(defun summit (lst)
  (setq newlst (remove nil lst))
  (apply #'+ newlst))

(assert (equal (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

;; リストの最後まで数え終わった時の動作を書いてやればよい。
(defun summit (lst)
  (let ((x (car lst)))
    (if (null lst)
	0
      (if (null x)
	  (summit (cdr lst))
	(+ x (summit (cdr lst)))))))

(assert (equal (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

;;
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)






