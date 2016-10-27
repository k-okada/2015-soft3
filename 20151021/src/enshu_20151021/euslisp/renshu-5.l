#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．
(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
	(b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))


(defclass hinji-servo-robot
  :super cascaded-link)
(defmethod hinji-servo-robot
  (:init
   ()
   (let (h1 s1 h2 s2 h3 h4 h5 h6 s3 s4 s5 s6 l1 l2 l3 l4 l5 l6 l7)
     (send-super :init)
     (setq h1 (make-hinji))
     (setq h2 (make-hinji))
     (setq h3 (make-hinji))
     (setq h4 (make-hinji))
     (setq h5 (make-hinji))
     (setq h6 (make-hinji))
     (setq s1 (make-servo))
     (setq s2 (make-servo)) 
     (setq s3 (make-servo))
     (setq s4 (make-servo))
     (setq s5 (make-servo))
     (setq s6 (make-servo))
     
     (send h2 :locate #f(42 0 0))
     (send s1 :assoc h2)
     (send s2 :locate #f(42 0 0))

     (send s2 :assoc h3)
     (send s3 :locate #f(84 0 0))
     (send h3 :locate #f(84 0 0))

     (send s3 :assoc h4)
     (send h4 :locate #f(126 0 0))
     (send s4 :locate #f(126 0 0))

     (send s4 :assoc h5)
     (send h5 :locate #f(168 0 0))
     (send s5 :locate #f(168 0 0))
     
      (send s5 :assoc h6)
      (send h6 :locate #f(210 0 0))
      (send s6 :locate #f(210 0 0))



      (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
      (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list s1 h2)))
      (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list s2 h3)))
      (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list s3 h4)))
      (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list s4 h5)))     
      (setq l6 (instance bodyset-link :init (make-cascoords) :bodies (list s5 h6)))
      (setq l7 (instance bodyset-link :init (make-cascoords) :bodies (list s6)))
      (send l7 :locate #f(0 0 0))
     
     (send self :assoc l1)
     (send l1 :assoc l2)
     (send l2 :assoc l3)
     (send l3 :assoc l4)
     (send l4 :assoc l5)
     (send l5 :assoc l6)
     (send l6 :assoc l7)

     (setq joint-list
	   (list 
	    (instance rotational-joint
		      :init :parent-link l1 :child-link l2  :axis :z)
	    (instance rotational-joint
		      :init :parent-link l2 :child-link l3  :axis :z)
	    (instance rotational-joint
		      :init :parent-link l3 :child-link l4  :axis :z)
	    (instance rotational-joint
		      :init :parent-link l4 :child-link l5  :axis :z)
	    (instance rotational-joint
		      :init :parent-link l5 :child-link l6  :axis :z) 
	    (instance rotational-joint
		      :init :parent-link l6 :child-link l7  :axis :z))) 
     
     (setq links (list l1 l2 l3 l4 l5 l6 l7))
     (send self :init-ending)
     )))

;(setq r (instance hinji-servo-robot :init))
;(objects (list r))

;(dotimes (i 10000)
;  (send r :angle-vector (float-vector (* 90 (sin (/ i 500.0))) (* 90 (sin (/ i 1000.0)))))
;  (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




