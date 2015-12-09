(format t "~A plus ~A equals ~A.~%" 2 3 (+ 2 3))

(defun ask (string)
  (format t "~A" string)
  (finish-output)
  (read))

(ask "How old are you ? ")
