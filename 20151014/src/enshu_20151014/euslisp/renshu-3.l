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

;; 
;;(remove nil lst)ではlstからnillを取り除いたものが返り値となるだけで、lstそのものは変更されないため、nilが残って足し算がうまく行かなかった。
;;(defun summit (lst)
;;  (remove nil lst)
;;  (apply #'+ lst))
;;以下のように変更すれば良い。
(defun summit (lst)
  (apply #'+ (remove nil lst)))

(assert (equal (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

;;lstが空になると(null x)がずっとtのままとなり、無限ループに入るため正しく動かない。
;;(defun summit (lst)
;;  (let ((x (car lst)))
;;    (if (null x)
;;        (summit (cdr lst))
;;      (+ x (summit (cdr lst))))))
;;以下のように変更すれば良い。
(defun summit (lst)
  (let ((x (car lst))(y (cdr lst)))
    (if (null x)
        (if y
	     (summit (cdr lst))
	   0)
      (+ x (summit (cdr lst))))))

(assert (equal (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

;;
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)






