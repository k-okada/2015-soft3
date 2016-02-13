;; call after sample1.l
(objects (list r))
(print (send r :joint-list))
(print t)
(print (send r :links))
(print t)
(print (send r :angle-vector))
(print t)
(print (send r :angle-vector (float-vector 30)))
