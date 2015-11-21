#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．


(defclass 6dof-robot
  :super cascaded-link
  :slots (end-coords endef base
		     l1-1 l1-2 e-1 j1-1 j1-2
		     l2-1 l2-2 e-2 j2-1 j2-2
		     l3-1 l3-2 e-3 j3-1 j3-2
		     l4-1 l4-2 e-4 j4-1 j4-2
		     l5-1 l5-2 e-5 j5-1 j5-2
		     l6-1 l6-2 e-6 j6-1 j6-2))
(defmethod 6dof-robot
  (:init ()
	 (let (b)
	   (send-super :init)
	   (setq arm_length 550)
	   (setq arm_length2 250)
	   (setq upper_r 150)

	   ;base
	   (setq b (make-cylinder upper_r 2))
	   (dotimes (i 6)
	    ; (setq c (make-cylinder 20 30 :pos (float-vector upper_r 0 0) :axis :x :angle (deg2rad 90)))
	     ;(setq b (body+ b c))
	     ;(send b :rotate (deg2rad 60) :z)
	     )
	   (setq base (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'base))

	   ;;link1 
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq c1 (make-sphere 20 :pos (float-vector 0 0 (- arm_length))))

	   (setq l1-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1-1))
	   (send l1-1 :locate (float-vector upper_r 0 0))
	   (send l1-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2)))
	   (setq l1-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1-2))
	   (send l1-2 :locate (float-vector upper_r 0 0))
	   (send l1-2 :assoc l1-1)
	   (setq e-1 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l1-1 :assoc e-1)
	   (send base :assoc l1-2)	   	   
	   
	   (setq j1-1 (instance sphere-joint :init :name 'j1-1 :parent-link l1-2 :child-link l1-1))
	   (setq j1-2 (instance rotational-joint :init :name 'j1-2 :parent-link base :child-link l1-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)

	   ;;link2
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq l2-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2-1))
	   (send l2-1 :locate (float-vector upper_r 0 0))
	   (send l2-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2)))
	   (setq l2-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2-2))
	   (send l2-2 :locate (float-vector upper_r 0 0))
	   (send l2-2 :assoc l2-1)
	   (setq e-2 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l2-1 :assoc e-2)	   
	   (send base :assoc l2-2)	   	   
	   
	   (setq j2-1 (instance sphere-joint :init :name 'j2-1 :parent-link l2-2 :child-link l2-1))
	   (setq j2-2 (instance rotational-joint :init :name 'j2-2 :parent-link base :child-link l2-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)

	   ;;link3
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq l3-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3-1))
	   (send l3-1 :locate (float-vector upper_r 0 0))
	   (send l3-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2)))
	   (setq l3-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3-2))
	   (send l3-2 :locate (float-vector upper_r 0 0))
	   (send l3-2 :assoc l3-1)
	   (setq e-3 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l3-1 :assoc e-3)	   
	   (send base :assoc l3-2)	   	   
	   
	   (setq j3-1 (instance sphere-joint :init :name 'j3-1 :parent-link l3-2 :child-link l3-1))
	   (setq j3-2 (instance rotational-joint :init :name 'j3-2 :parent-link base :child-link l3-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)

	   ;;link4
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq l4-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4-1))
	   (send l4-1 :locate (float-vector upper_r 0 0))
	   (send l4-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2)))
	   (setq l4-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4-2))
	   (send l4-2 :locate (float-vector upper_r 0 0))
	   (send l4-2 :assoc l4-1)
	   (setq e-4 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l4-1 :assoc e-4)	   
	   (send base :assoc l4-2)	   	   
	   
	   (setq j4-1 (instance sphere-joint :init :name 'j4-1 :parent-link l4-2 :child-link l4-1))
	   (setq j4-2 (instance rotational-joint :init :name 'j4-2 :parent-link base :child-link l4-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)

	   ;;link5
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq l5-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2-1))
	   (send l5-1 :locate (float-vector upper_r 0 0))
	   (send l5-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2))) 
	   (setq l5-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l5-2))
	   (send l5-2 :locate (float-vector upper_r 0 0))
	   (send l5-2 :assoc l5-1)
	   (setq e-5 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l5-1 :assoc e-5)	   
	   (send base :assoc l5-2)	   	   
	   
	   (setq j5-1 (instance sphere-joint :init :name 'j5-1 :parent-link l5-2 :child-link l5-1))
	   (setq j5-2 (instance rotational-joint :init :name 'j5-2 :parent-link base :child-link l5-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)
	   
	   ;;link6
	   (setq b (make-cube 10 10 arm_length))
	   (send b :locate (float-vector 0 0 (/ arm_length -2)))
	   (setq l6-1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l6-1))
	   (send l6-1 :locate (float-vector upper_r 0 0))
	   (send l6-1 :locate (float-vector 0 0 (* -1 arm_length2)))

	   (setq b (make-cube 10 10 arm_length2))
	   (send b :locate (float-vector 0 0 (/ arm_length2 -2)))
	   (setq l6-2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l6-2))
	   (send l6-2 :locate (float-vector upper_r 0 0))
	   (send l6-2 :assoc l6-1)
	   (setq e-6 (make-cascoords :pos (float-vector upper_r 0 (- (+ arm_length arm_length2)))))
	   (send l6-1 :assoc e-6)	   
	   (send base :assoc l6-2)	   	   
	   
	   (setq j6-1 (instance sphere-joint :init :name 'j6-1 :parent-link l6-2 :child-link l6-1))
	   (setq j6-2 (instance rotational-joint :init :name 'j6-2 :parent-link base :child-link l6-2 :axis :y :min -180))
	   (send base :rotate (deg2rad 60) :z)
	   	   
	   (setq b (make-cylinder 40 10))
	   (send b :locate #f(0 0 -10))
	   (send b :set-color :red)
	   ;(setq c (make-cube 40 10 20 :pos #f(0 0 -10)))
	   ;(setq b (body+ b c))
	   ;(setq d (make-cube 10 10 10 :pos #f(0 0 -15)))
	   ;(setq b (body- b d))
	   (setq endef (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'endef))

	   (setq end-coords (make-cascoords :pos #f(0 0 -60)))
	   
	   (setq endef1 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef1)
	   (send endef :rotate (deg2rad 60) :z)
	   (setq endef2 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef2)
	   (send endef :rotate (deg2rad 60) :z)
	   (setq endef3 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef3)
	   (send endef :rotate (deg2rad 60) :z)
	   (setq endef4 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef4)
	   (send endef :rotate (deg2rad 60) :z)
	   (setq endef5 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef5)
	   (send endef :rotate (deg2rad 60) :z)
	   (setq endef6 (make-cascoords :pos #f(40 0 0)))
	   (send endef :assoc endef6)
	   (send endef :rotate (deg2rad 60) :z)

	   (send endef :assoc end-coords)
	   (send endef :locate (float-vector 0 0 -400))
	   

	   (setq links (list l1-1 l1-2 l2-1 l2-2 l3-1 l3-2 l4-1 l4-2 l5-1 l5-2 l6-1 l6-2 endef base))
	   (setq joint-list (list j1-1 j1-2 j2-1 j2-2 j3-1 j3-2 j4-1 j4-2 j5-1 j5-2 j6-1 j6-2))
	   (send self :init-ending)
	   (send self :inv_arms)

	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  (:endef (&rest args) (forward-message-to endef args))
  (:e-1 (&rest args) (forward-message-to e-1 args))
  (:inv_arms nil
	     (send self :inverse-kinematics endef1
		   :link-list (list l1-2 l1-1)
		   :move-target e-1
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     (send self :inverse-kinematics endef2
		   :link-list (list l2-2 l2-1)
		   :move-target e-2
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     (send self :inverse-kinematics endef3
		   :link-list (list l3-2 l3-1)
		   :move-target e-3
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     (send self :inverse-kinematics endef4
		   :link-list (list l4-2 l4-1)
		   :move-target e-4
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     (send self :inverse-kinematics endef5
		   :link-list (list l5-2 l5-1)
		   :move-target e-5
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     (send self :inverse-kinematics endef6
		   :link-list (list l6-2 l6-1)
		   :move-target e-6
		   :translation-axis t
		   :rotation-axis nil
		   :revert-if-fail nil)
	     )
  (:moveto (xyz)
	   (send endef :locate (v+ xyz #f(0 0 60)) :world-coords)
	   ;(send endef :orient rpy :world-coords)
	   (send self :inv_arms)
	   )
  (:moveandrot (coords)
	       (send endef :coords)
	       (send endef :reset-coords)
	       (send endef :transform coords :world)
	       (send endef :locate #f(0 0 60))
	       (send self :inv_arms)
	       )
  )

(defun moveto (dest speed)
  (let (i per src dist tovect dividenum)
    (setq src (send (send r :end-coords :copy-worldcoords) :pos))
    (setq dist (distance src dest))
    (setq dividenum (floor (/ dist speed)))
    (setq tovect (v- dest src))
    (dotimes (i (- dividenum 1))
      (setq per (/ (* 1.0 (+ i 1)) dividenum))
      (send r :moveto (v+ (scale per tovect) src))
      (send *irtviewer* :draw-objects)
      (x::window-main-one)
      )
    (send r :moveto dest)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    ))

(defun move_rot(dest speed)
  (let (i per dest_pos src_pos dist tovect dividenum)
    (setq src_pos (send (send r :end-coords :copy-worldcoords) :pos))
    (setq src_rot (send (send r :end-coords :copy-worldcoords) :rot))
    (setq dest_pos (send dest :pos))
    (setq dest_rot (send dest :rot))
    (setq dist (distance src_pos dest_pos))
    (setq dividenum (floor (/ dist speed)))
    (setq tovect (v- dest_pos src_pos))
    (setq rot_matrix (m* dest_rot (transpose src_rot)))
    (setq rot_ang (rotation-angle rot_matrix))
    (if rot_ang
	(progn
	  (setq rot_angle_theta (elt rot_ang 0))
	  (setq rot_angle_vect (elt rot_ang 1)))
      (progn
	(setq rot_angle_theta 0)
	(setq rot_angle_vect #f(1 0 0)))
      )
    (if (< dist (* rot_angle_theta 200))
	(setq dividenum (floor (/ (* 200 rot_angle_theta) speed))))
    (setq des (make-coords))
    (dotimes (i (- dividenum 1))
      (setq per (/ (* 1.0 (+ i 1)) dividenum))
      (setq tovect_tmp (v+ src_pos (scale per tovect)))
      (setq torot (* rot_angle_theta per))
      (send des :reset-coords)
      (setq des (make-coords :pos tovect_tmp :rot (copy-matrix src_rot)))
      (send des :rotate torot rot_angle_vect)
      (send r :moveandrot des)
      (send *irtviewer* :draw-objects)
      (x::window-main-one)
      )
    (send r :moveandrot dest)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    ))


(setq rsize 500)
(setq height 420)
(setq dai (make-cylinder rsize 5))
(send dai :locate (float-vector 0 0 (- -12.5 height)))

(setq numofcubes 10)
(setq cubes '())

(dotimes (i numofcubes)
  (push (make-cube 20 20 20 :pos (float-vector (- (random rsize) (/ rsize 2)) (- (random rsize) ( / rsize 2)) (- height))) cubes)
  (send (elt cubes 0) :set-color :yellow)
  )

(setq r (instance 6dof-robot :init))

(setq hand (make-cylinder 20 45))
(send hand :set-color :red)
(send hand :locate (send r :endef :worldpos))
(send hand :locate #f(0 0 -50))
(send (send r :endef) :assoc hand)
(setq objs (append (list r dai hand) cubes))
(objects objs)


(setq xyspeed 30)
(setq zspeed 8)

(setq flag 0)


(dotimes (i 2)
 ;(send r :moveto (float-vector (* 170 (sin time) ) (* 170 (cos time)) (+ (* 20 (sin (* time 5))) -375)))
 ;(setq time (+ time 0.1))
  (setq dest (make-coords))
  (setq flag 0)
  (dotimes (i 120)
   (setq dest_pos #f(400 0 -350))
   (setq rot_mat (make-coords))
   (send rot_mat :rotate (deg2rad (* i 3)) :z)
   (setq dest_pos (send rot_mat :transform-vector dest_pos))
   (send dest :reset-coords)
   (send dest :locate dest_pos)
   (send dest :rotate (deg2rad -60) (rotate-vector dest_pos (deg2rad 90) :z))
   (if (= flag 1)
       (send r :moveandrot dest)
     (move_rot dest xyspeed)
     )
   (setq flag 1)
   (send *irtviewer* :draw-objects)
   (x::window-main-one)
   )
 (send dest :reset-coords)
 (send dest :locate (send r :end-coords :worldpos))
  (dotimes (i numofcubes)
   (setq destcube (elt cubes i))
   (setq destcube_pos (send destcube :pos))
   (setq dest (make-coords :pos (v+ destcube_pos #f(0 0 50))))
   (move_rot dest xyspeed)
   ;(moveto (v+ destcube_pos #f(0 0 50)) xyspeed)
   (moveto destcube_pos zspeed)
   (send (send r :end-coords) :assoc (elt cubes i))
   (moveto (v+ destcube_pos #f(0 0 50)) zspeed)
   
   (setq dest (float-vector (/ rsize -2)  (+ (/ rsize -2)  (* i 22) ) (+ (elt destcube_pos 2) 50)))
   (moveto dest xyspeed)
   (moveto (v+ dest #f(0 0 -50)) zspeed)
   (send (send r :end-coords) :dissoc (elt cubes i))
   (moveto dest zspeed)
      
   (send *irtviewer* :draw-objects)
   (x::window-main-one)
   )
  (moveto dest xyspeed)
(dotimes (i 120)
  (setq phase (deg2rad (* i 3)))
  (setq x (* 440 (cos phase)))
  (setq y (* 440 (sin phase)))
  (setq z (+ -370 (* 80 (sin (* 4 phase)))))
  (setq dest (float-vector x y z))
  (moveto dest xyspeed)
  )
 (dotimes (i numofcubes)

   (setq destcube (elt cubes i))
   (setq destcube_pos (send destcube :pos))
   (moveto (v+ destcube_pos #f(0 0 50)) xyspeed)
   (moveto destcube_pos zspeed)
   (send (send r :end-coords) :assoc (elt cubes i))
   (moveto (v+ destcube_pos #f(0 0 50)) zspeed)
  

   (setq rand_theta (random 360))
   (setq rand_r (random rsize))
   (setq dest (float-vector (* rand_r (cos rand_theta)) (* rand_r (sin rand_theta)) (elt destcube_pos 2)))
   (moveto (v+ dest #f(0 0 50)) xyspeed)
   (moveto dest zspeed)
   (send (send r :end-coords) :dissoc (elt cubes i))
   (moveto (v+ dest #f(0 0 50)) zspeed)
   )
 
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




