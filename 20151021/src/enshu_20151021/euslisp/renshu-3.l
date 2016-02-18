#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(defun make-drawer (x y z &key (pos #f(0 0 0)))
  (let ((b1 (make-cube x y z))
	(b2 (make-cube (- x 4) (- y 4) z :pos #f(0 0 4))))
    (setq b1 (body- b1 b2))
    (send b1 :locate pos)
    (send b1 :set-color :gray20)
    b1))

(defclass chest
  :super cascaded-link
  :slots (frame d1 d2 d3 d4 d5 d6 j1 j2 j3 j4 j5 j6)
  )
(defmethod chest
  (:init ()
	 (let (b f)
	   (send-super :init)
	   (setq f (make-cube 180 90 230 :pos #f(0 0 115)))
	   (send f :set-color :gray80)
	   ;;
	   (setq d1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 70 80 40 :pos #f(-45 5 190)))))
	   (setq b (make-cube 70 80 40 :pos #f(-45 5 190)))
	   (setq f (body- f b))
	   ;;
	   (setq d2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 70 80 40 :pos #f(45 5 190)))))
	   (setq b (make-cube 70 80 40 :pos #f(45 5 190)))
	   (setq f (body- f b))
	   ;;
	   (setq d3 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 70 80 40 :pos #f(-45 5 140)))))
	   (setq b (make-cube 70 80 40 :pos #f(-45 5 140)))
	   (setq f (body- f b))
	   ;;
	   (setq d4 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 70 80 40 :pos #f(45 5 140)))))
	   (setq b (make-cube 70 80 40 :pos #f(45 5 140)))
	   (setq f (body- f b))
	   ;;
	   (setq d5 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 160 80 40 :pos #f(0 5 90)))))
	   (setq b (make-cube 160 80 40 :pos #f(0 5 90)))
	   (setq f (body- f b))
	   ;;
	   (setq d6 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 160 80 40 :pos #f(0 5 40)))))
	   (setq b (make-cube 160 80 40 :pos #f(0 5 40)))
	   (setq f (body- f b))
	   ;;
	   (setq frame (instance bodyset-link :init (make-cascoords) :bodies (list f)))
	   (setq j1 (instance linear-joint :init :parent-link frame :child-link d1 :axis :y))
	   (setq j2 (instance linear-joint :init :parent-link frame :child-link d2 :axis :y))
	   (setq j3 (instance linear-joint :init :parent-link frame :child-link d3 :axis :y))
	   (setq j4 (instance linear-joint :init :parent-link frame :child-link d4 :axis :y))
	   (setq j5 (instance linear-joint :init :parent-link frame :child-link d5 :axis :y))
	   (setq j6 (instance linear-joint :init :parent-link frame :child-link d6 :axis :y))
	   (send j1 :min-angle 0)
	   (send j2 :min-angle 0)
	   (send j3 :min-angle 0)
	   (send j4 :min-angle 0)
	   (send j5 :min-angle 0)
	   (send j6 :min-angle 0)
	   
	   (send self :assoc frame)
	   (send frame :assoc d1)
	   (send frame :assoc d2)
	   (send frame :assoc d3)
	   (send frame :assoc d4)
	   (send frame :assoc d5)
	   (send frame :assoc d6)
	   (setq links (list frame d1 d2 d3 d4 d5 d6))
	   (setq joint-list (list j1 j2 j3 j4 j5 j6))
	   (send self :init-ending)
	   self
	   ))
  (:j1 (&rest args) (forward-message-to j1 args))
  (:j2 (&rest args) (forward-message-to j2 args))
  (:j3 (&rest args) (forward-message-to j3 args))
  (:j4 (&rest args) (forward-message-to j4 args))
  (:j5 (&rest args) (forward-message-to j5 args))
  (:j6 (&rest args) (forward-message-to j6 args))
  )

(setq *model* (instance chest :init))

(objects (list *model*))
(setq time 0)
(do-until-key
 (setq time (+ time 0.001))
 (send *model* :j1 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 0 6.0))))))) 
 (send *model* :j2 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 1 6.0)))))))
 (send *model* :j3 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 2 6.0)))))))
 (send *model* :j4 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 3 6.0)))))))
 (send *model* :j5 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 4 6.0)))))))
 (send *model* :j6 :joint-angle (+ 35 (* 35 (sin (+ (reduce #'* `(2 ,pi 2 ,time)) (* pi (/ 5 6.0)))))))
				   
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




