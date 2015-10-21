<<<<<<< HEAD
#!/usr/bin/env eusgl

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

;; 1
(assert (eq (car (X (cdr '(a (b c) d)))) 'b) "mondai 1")
;; 2
(assert (eq (X 13 (/ 1 0)) 13) "mondai 2")
;; 3
(assert (eq (X #'list 1 nil) '(1)) "mondai 3")
;;
=======
#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
>>>>>>> 60c076c14d771e7645afe09990ec5e7b35035a68
(exit 1)




