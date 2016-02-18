#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．
(load "irteus/demo/sample-arm-model.l")
(load "irteus/pqp.l")

(defun make-drawer (x y z &key (pos #f(0 0 0)))
  (let ((b1 (make-cube x y z))
	(b2 (make-cube (- x 10) (- y 10) z :pos #f(0 0 10))))
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
	   (setq f (make-cube 1800 900 2300 :pos #f(0 0 1150)))
	   (send f :set-color :gray80)
	   ;;
	   (setq d1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 700 800 400))))
	   (send d1 :locate #f(-450 50 1900))
	   (setq b (make-cube 700 900 400 :pos #f(-450 100 1900)))
	   (setq f (body- f b))
	   ;;
	   (setq d2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 700 800 400))))
	   (send d2 :locate #f(450 50 1900))
	   (setq b (make-cube 700 900 400 :pos #f(450 100 1900)))
	   (setq f (body- f b))
	   ;;
	   (setq d3 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 700 800 400))))
	   (send d3 :locate #f(-450 50 1400))
	   (setq b (make-cube 700 900 400 :pos #f(-450 100 1400)))
	   (setq f (body- f b))
	   ;;
	   (setq d4 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 700 800 400))))
	   (send d4 :locate #f(450 50 1400))
	   (setq b (make-cube 700 900 400 :pos #f(450 100 1400)))
	   (setq f (body- f b))
	   ;;
	   (setq d5 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 1600 800 400))))
	   (send d5 :locate #f(0 50 900))
	   (setq b (make-cube 1600 900 400 :pos #f(0 100 900)))
	   (setq f (body- f b))
	   ;;
	   (setq d6 (instance bodyset-link :init (make-cascoords) :bodies (list (make-drawer 1600 800 400))))
	   (send d6 :locate #f(0 50 400))
	   (setq b (make-cube 1600 900 400 :pos #f(0 100 400)))
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
	   (send j1 :max-angle 780)
	   (send j2 :min-angle 0)
	   (send j2 :max-angle 780)
	   (send j3 :min-angle 0)
	   (send j3 :max-angle 780)
	   (send j4 :min-angle 0)
	   (send j4 :max-angle 780)
	   (send j5 :min-angle 0)
	   (send j5 :max-angle 780)
	   (send j6 :min-angle 0)
	   (send j6 :max-angle 780)
	   
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

(defclass chest-arm-model
  :super cascaded-link
  :slots (c1 a1)
  )

(defmethod chest-arm-model
  (:init ()
	 (send-super :init)
	 (setq c1 (instance chest :init))
	 (setq a1 (instance sarmclass :init))
	 (send a1 :rotate #d90 :z)
	 (send a1 :locate #f(410 0 2300))
	 (send a1 :reset-pose)
	 (send self :assoc c1)
	 (send c1 :assoc a1) 
	 (setq links (list c1 a1))
	 (send self :init-ending))
  (:c1 (&rest args) (forward-message-to c1 args))
  (:a1 (&rest args) (forward-message-to a1 args))
  )


;;
(setq *model* (instance chest-arm-model :init))
(send *model* :c1 :j1 :joint-angle 700)
(setq *target* (instance bodyset-link :init (make-cascoords) :bodies (list (make-sphere 30))))
(send *target* :locate #f(500 420 2330))

(objects (list *model* *target*))
(print "Push Enter")
(do-until-key
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)
;;reach
(let (begin next)
  (setq begin (send *model* :a1 :end-coords :worldpos))
  (dotimes (i 100)
    (setq next (make-coords :pos (v+ (scale (/ i 100.0) (send *target* :pos))
				     (scale (/ (- 100 i) 100.0) begin))))
    (send *model* :a1 :inverse-kinematics next
	  :link-list (send *model* :a1 :link-list (send *model* :a1 :end-coords :parent))
	  :move-target (send *model* :a1 :end-coords)
	  :translation-axis t
	  :rotation-axis nil
	  :revert-if-fail nil)
    (if (pqp-collision-check-objects (list (send *model* :a1 :joint-fr :child-link) (send *model* :a1 :joint-fl :child-link)) (list *target*))
	(progn
	  (print "Hit!")
	  (dotimes (j 100)
	    (send *model* :a1 :joint-fl :joint-angle (* 0.42 j))
	    (send *model* :a1 :joint-fr :joint-angle (* 0.42 j))
	    (send *irtviewer* :draw-objects)
	    (unix::usleep (* 1000 10)))))
    (unix::usleep (* 1000 10))
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    ))
;;grasp
(let ((a 42))
  (while (> 0 a)
    (if (pqp-collision-check-objects
	 (list (send *model* :a1 :joint-fr :child-link)
	       (send *model* :a1 :joint-fl :child-link))
	 (list *target*))
	(return))
    (decf a 0.1)
    (send *irtviewer* :draw-objects)
    (unix::usleep (* 1000 10))
    (send *model* :a1 :move-fingers a)
    (x::window-main-one)))
(send *model* :a1 :end-coords :assoc *target*)
;;move
(let (begin next end)
  (setq begin (send *model* :a1 :end-coords :worldpos))
  (setq end (v+ (send ((send *model* :c1) . d1) :worldpos) #f(0 200 430)))

  (dotimes (i 100)
    (setq next (make-coords :pos (v+ (scale (/ i 100.0) end)
				     (scale (/ (- 100 i) 100.0) begin))))
    (send *model* :a1 :inverse-kinematics next
	  :link-list (send *model* :a1 :link-list (send *model* :a1 :end-coords :parent))
	  :move-target (send *model* :a1 :end-coords)
	  :translation-axis t
	  :rotation-axis nil
	  :revert-if-fail nil)
    (unix::usleep (* 1000 10))
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    ))
;;release
(send *model* :a1 :end-coords :dissoc *target*)
(let ((begin (send *model* :a1 :angle-vector))
      next
      (end #f(0 0 90 0 90 0 0 0)))
  (dotimes (i 100)
    (setq next (v+ (scale (/ i 100.0) end)
		  (scale (/ (- 100 i) 100.0) begin))) 
    (send *model* :a1 :move-fingers (* 0.42 i))
    (send *model* :a1 :angle-vector next)
    (if (pqp-collision-check-objects
	 (list ((send *model* :c1) . d1))
	 (list *target*))
	(send *target* :spacial-velocity #f(0 0 0))
      (send *target* :spacial-velocity (v+ (send *target* :spacial-velocity) (transform (sr-inverse (send *target* :rot)) (scale 0.01 #f(0 0 -9800))))))
    (send *target* :locate (scale 0.01 (send *target* :spacial-velocity)))
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    (unix::usleep (* 1000 10))))
(send ((send *model* :c1) . d1) :assoc *target*)

(unix::sleep 1)
;;close
(setq time 0)
(do-until-key
 (setq time (+ time 0.001))
 (setq theta (reduce #'* `(2 ,pi 2 ,time)))
 (if (<= theta pi)
     (send *model* :c1 :j1 :joint-angle (+ 350 (* 350 (cos theta)))))
 
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





