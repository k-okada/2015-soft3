#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．

(defclass 7dof-arm
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 l5 l6 l7 l8 j1 j2 j3 j4 j5 j6 j7))
(defmethod 7dof-arm
  (:init ()
	 (let (b)
	   (send-super :init)

	   ;;
	   (setq b (make-cube 20 20 30))
	   (send b :locate #f(0 0 15))
	   (send b :set-color :gray10)
	   (setq l8 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l8))
	   (setq end-coords (make-cascoords :pos #f(0 0 30)))
	   (send l8 :assoc end-coords)
	   (send l8 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray20)
           (setq l7 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l7))
           (send l7 :assoc l8)
           (send l7 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray30)
           (setq l6 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l6))
           (send l6 :assoc l7)
           (send l6 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray40)
           (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l5))
           (send l5 :assoc l6)
           (send l5 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray50)
           (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4))
           (send l4 :assoc l5)
           (send l4 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray60)
           (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3))
           (send l3 :assoc l4)
           (send l3 :locate #f(0 0 50))

           (setq b (make-cube 20 20 50))
           (send b :locate #f(0 0 25))
           (send b :set-color :gray70)
           (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
           (send l2 :assoc l3)
           (send l2 :locate #f(0 0 50))

	   (setq b (body+ (make-cube 20 20 50 :pos #f(0 0 25)) (make-cube 100 100 5)))
	   (send b :set-color :gray80)
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1))
	   (send l1 :assoc l2)

	   (setq j1 (instance rotational-joint :init :name 'j1 :parent-link l1 :child-link l2 :axis :z :min -60 :max 100)
		 j2 (instance rotational-joint :init :name 'j2 :parent-link l2 :child-link l3 :axis :y :min -60 :max 100)
		 j3 (instance rotational-joint :init :name 'j3 :parent-link l3 :child-link l4 :axis :z :min -60 :max 100)
		 j4 (instance rotational-joint :init :name 'j4 :parent-link l4 :child-link l5 :axis :y :min -60 :max 100)
		 j5 (instance rotational-joint :init :name 'j5 :parent-link l5 :child-link l6 :axis :z :min -60 :max 100)
		 j6 (instance rotational-joint :init :name 'j6 :parent-link l6 :child-link l7 :axis :y :min -60 :max 100)
		 j7 (instance rotational-joint :init :name 'j7 :parent-link l7 :child-link l8 :axis :y :min -60 :max 100)
)

	   ;;
	   (setq links (list l1 l2 l3 l4 l5 l6 l7 l8))
	   (setq joint-list (list j1 j2 j3 j4 j5 j6 j7))

	   (send self :init-ending)
	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args))
)

(setq r (instance 7dof-arm :init))
(objects (list r))
(dotimes (i 500)
  (setq c (make-cascoords :pos (float-vector 200 0 100) :rpy (float-vector (+ (* -1 pi) (* (sin (* i 0.01)) (* pi 0.5))) 0 (* -1 pi))))
  (send r :inverse-kinematics c
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:translation-axis t
	:rotation-axis t
	:debug-view nil)
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t)
  (x::window-main-one))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




