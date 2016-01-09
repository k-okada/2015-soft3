#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．
(defclass 3dof-robot
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 j1 j2 j3))
(defmethod 3dof-robot
  (:init ()
	 (let (b)
	   (send-super :init)

	   (setq b (make-cube 10 10 20))
	   (send b :locate #f(0 0 10))
	   (send b :set-color :red)
	   (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b)))
	   (setq end-coords (make-cascoords :pos #f(0 0 20)))
	   (send l4 :assoc end-coords)
	   (send l4 :locate #f(0 0 100))

	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :green)
	   (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b)))
	   (send l3 :assoc l4)
	   (send l3 :locate #f(0 0 100))

	   (setq b (make-cube 10 10 100))
	   (send b :locate #f(0 0 50))
	   (send b :set-color :blue)
	   (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b)))
	   (send l2 :assoc l3)
	   (send l2 :locate #f(0 0 20))

	   (setq b (body+ (make-cube 10 10 20 :pos #f(0 0 10)) (make-cube 300 300 2)))
	   (send b :set-color :white)
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b)))
	   (send l1 :assoc l2)
	   (setq j1 (instance sphere-joint :init
			      :parent-link l1 :child-link l2)
		 j2 (instance sphere-joint :init
			      :parent-link l2 :child-link l3)
		 j3 (instance sphere-joint :init
			      :parent-link l3 :child-link l4))
	   ;;
	   (setq links (list l1 l2 l3 l4))
	   (setq joint-list (list j1 j2 j3))
	   ;;
	   (send self :init-ending)
	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  )

(setq r (instance 3dof-robot :init))
(objects (list r))
(dotimes (i 200)
  (setq c (make-cascoords :pos 
			  (float-vector (* (- 150 (/ i 2.0)) (cos (/ i 100.0)))
					(* (- 150 (/ i 2.0)) (sin (/ i 100.0)))
					0)))
  (send r :inverse-kinematics c
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:translation-axis t
	:rotation-axis nil
	:debug-view t)
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




