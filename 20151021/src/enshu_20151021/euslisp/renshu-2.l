#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defclass linear-module
  :super cascaded-link
  :slots (g1 p1 j1))

(defmethod linear-module
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq g1 (instance bodyset-link :init (make-cascoords) :bodies
			      (list
			       (let (b1 b2) 
				 (setq b1 (make-cylinder 40 120))
				 (setq b2 (make-cylinder 34 120))
				 (send b2 :locate #f(0 0 10))
				 (setq b1 (body- b1 b2))
				 (send b1 :set-color :gray20)
				 b1))))
	   (setq p1 (instance bodyset-link :init (make-cascoords) :bodies
			      (list
			       (let ((b1 (make-cylinder 34 110))
				     (b2 (make-cube 80 80 90)))
				 (send b2 :locate #f(0 0 155))
				 (setq b1 (body+ b1 b2))
				 (send b1 :set-color :gray80)
				 (send b1 :locate #f(0 0 10))
				 b1))))
	   (setq j1 (instance linear-joint :init :parent-link g1 :child-link p1 :axis :z))
	   (send j1 :max-angle 100)
	   (send j1 :min-angle 0)
	   
	   (setq links (list g1 p1))
	   (setq joint-list (list j1))
	   (send self :assoc g1)
	   (send g1 :assoc p1)
	   (send self :init-ending)
	   self))
  (:j1 (&rest args) (forward-message-to j1 args))
  )

(setq *model* (instance linear-module :init))					

(objects (list *model*))
(setq time 0)
(do-until-key
 (setq time (+ time 0.001))
 (send *model* :j1 :joint-angle (+ 50 (* 50 (sin (reduce #'* `(2 ,pi 2 ,time))))))  
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




