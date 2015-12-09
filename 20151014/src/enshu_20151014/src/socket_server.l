(open-server 1234 #'(lambda (s) (print (eval (read s)) s)))
