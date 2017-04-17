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

;; 
(defun summit (lst)
  (remove nil lst)
  (apply #'+ lst))

(assert (eq (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

(defun summit (lst)
  (let ((x (car lst)))
    (if (null x)
        (summit (cdr lst))
      (+ x (summit (cdr lst))))))

(assert (eq (summit '(1 2 nil 3 4 nil)) 10) "mondai 1")

;;
=======
#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
>>>>>>> 60c076c14d771e7645afe09990ec5e7b35035a68
(exit 1)




