#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．

(defclass 7dof-robot
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 l5 l6 l7 j1 j2 j3 j4 j5 j6))
(defmethod 7dof-robot
  (:init ()
	 (let (b)
	   (send-super :init)

	   ;;l7
	   (setq b (make-cube 10 10 20))
	   (send b :locate #f(0 0 10))
	   (send b :set-color :red)
	   (setq l7 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l7))
	   (setq end-coords (make-cascoords :pos #f(0 0 20)))
	   (send l7 :assoc end-coords)
	   (send l7 :locate #f(0 0 60))
	   ;;l6
	   (setq b (make-cube 10 10 60))
	   (send b :locate #f(0 0 30))
	   (send b :set-color :green)
	   (setq l6 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l6))
	   (send l6 :assoc l7)
	   (send l6 :locate #f(0 0 40))
	   ;;l5
	   (setq b (make-cube 10 10 40))
	   (send b :locate #f(0 0 20))
	   (send b :set-color :blue)
	   (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l5))
	   (send l5 :assoc l6)
	   (send l5 :locate #f(0 0 50))
	   ;;l4
	   (setq b (make-cube 10 10 50))
	   (send b :locate #f(0 0 25))
	   (send b :set-color :yellow)
	   (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4))
	   (send l4 :assoc l5)
	   (send l4 :locate #f(0 0 40))
	   ;;l3
	   (setq b (make-cube 10 10 40))
	   (send b :locate #f(0 0 20))
	   (send b :set-color :orange)
	   (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3))
	   (send l3 :assoc l4)
	   (send l3 :locate #f(0 0 50))
	   ;;l2
	   (setq b (make-cube 10 10 50))
	   (send b :locate #f(0 0 25))
	   (send b :set-color :purple)
	   (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
	   (send l2 :assoc l3)
	   (send l2 :locate #f(0 0 20))
	   ;;l1
	   (setq b (body+ (make-cube 10 10 20 :pos #f(0 0 10)) (make-cube 300 300 2)))
	   (send b :set-color :white)
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
	   (send l1 :assoc l2)
	   ;;joints
	   (setq j1 (instance rotational-joint :init :name 'j1
			      :parent-link l1 :child-link l2 :axis :y :min -100 :max 100)
		 j2 (instance rotational-joint :init :name 'j2
			      :parent-link l2 :child-link l3 :axis :y :min -100 :max 100)
		 j3 (instance rotational-joint :init :name 'j3
			      :parent-link l3 :child-link l4 :axis :y :min -100 :max 100)
		 j4 (instance rotational-joint :init :name 'j4
			      :parent-link l4 :child-link l5 :axis :y :min -100 :max 100)
		 j5 (instance rotational-joint :init :name 'j5
			      :parent-link l5 :child-link l6 :axis :y :min -100 :max 100)
		 j6 (instance rotational-joint :init :name 'j6
			      :parent-link l6 :child-link l7 :axis :y :min -100 :max 100)
		 )
	   ;;
	   (setq links (list l1 l2 l3 l4 l5 l6 l7))
	   (setq joint-list (list j1 j2 j3 j4 j5 j6))
	   ;;
	   (send self :init-ending)
	   self))
  (:end-coords (&rest args) (forward-message-to end-coords args))
)
(setq r (instance 7dof-robot :init))
(objects (list r))
(send r :angle-vector #f(10 10 10 10 10 10))
(objects (list r (send r :end-coords)))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




