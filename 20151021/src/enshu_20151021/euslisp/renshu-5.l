#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．
(defun make-link-red nil
  (let  (b1 b2 b3 c1)
    (setq b1 (make-cube 10 10 60))
    (setq b2 (make-cube 7 10 15))
    (setq b3 (make-cube 10 6 20))
    (setq c1 (make-cylinder 2 12))
    (send b2 :locate #f(0 0 22.5))
    (setq b1 (body- b1 b2))
    (send b3 :locate #f(0 0 -35))
    (setq b1 (body+ b1 b3))
    (send c1 :locate #f(0 6 -40))
    (send c1 :rotate (deg2rad 90) :x)
    (setq b1 (body+ b1 c1))
    (send b1 :locate #f(0 0 40))
    (send b1 :set-color :red)
    b1))

;;axis :x -> axis :y (z)
(defun make-link-blue nil
  (let  (b1 b2 b3 c1)
    (setq b1 (make-cube 10 10 60))
    (setq b2 (make-cube 7 10 15))
    (setq b3 (make-cube 10 6 20))
    (setq c1 (make-cylinder 2 12))
    (send b2 :locate #f(0 0 22.5))
    (setq b1 (body- b1 b2))
    (send b3 :locate #f(0 0 -35))
    (setq b1 (body+ b1 b3))
    (send c1 :locate #f(0 6 -40))
    (send c1 :rotate (deg2rad 90) :x)
    (setq b1 (body+ b1 c1))
    (send b1 :locate #f(0 0 40))
    (send b1 :rotate (deg2rad 90) :z)
    (send b1 :set-color :blue)
    b1))

;;axis :y -> axis :x (y)
(defun make-link-yellow nil
  (let (b1 b2 c1)
    (setq b1 (make-cube 10 10 64))
    (setq b2 (make-cube 7 10 15))
    (setq c1 (make-cylinder 2 14))
    (send b2 :locate #f(0 0 24.5))
    (setq b1 (body- b1 b2))
    (send c1 :locate #f(0 0 -44))
    (setq b1 (body+ b1 c1))
    (send b1 :rotate (deg2rad 90) :x)
    (send b1 :locate #f(0 0 38))
    (send b1 :set-color :yellow)
    b1))

;;axis :z -> axis :y
(defun make-link-green nil
  (let (b1 b2 c1)
    (setq b1 (make-cube 10 10 64))
    (setq b2 (make-cube 7 10 15))
    (setq c1 (make-cylinder 2 14))
    (send b2 :locate #f(0 0 24.5))
    (setq b1 (body- b1 b2))
    (send c1 :locate #f(0 0 -44))
    (setq b1 (body+ b1 c1))
    (send b1 :rotate (deg2rad 90) :z)
    (send b1 :locate #f(0 0 38))
    (send b1 :set-color :green)
    b1))

(defun make-link-white nil
  (let (b1 c1)
    (setq b1 (make-cube 20 20 20))
    (setq c1 (make-cylinder 2 15))
    (send b1 :locate #f(0 0 10))
    (send c1 :locate #f(0 0 5))
    (setq b1 (body- b1 c1))
    (send b1 :set-color :white)
    b1))

(defclass 6dof-model
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 l5 l6 l7 j1 j2 j3 j4 j5 j6))
(defmethod 6dof-model
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-white))))
	   (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-green))))
	   (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-red))))
	   (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-blue))))
	   (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-yellow))))
	   (setq l6 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-blue))))
	   (setq l7 (instance bodyset-link :init (make-cascoords) :bodies (list (make-link-red))))
	   (setq end-coords (make-cascoords :pos #f(0 0 70)))
	   (send l7 :assoc end-coords)

	   (send l2 :locate #f(0 0 15))
	   (send l1 :assoc l2)
	   (send l3 :locate #f(0 0 80))
	   (send l2 :assoc l3)
	   (send l4 :locate #f(0 0 145))
	   (send l3 :assoc l4)
	   (send l5 :locate #f(0 0 210))
	   (send l4 :assoc l5)
	   (send l6 :locate #f(0 -65 210))
	   (send l5 :assoc l6)
	   (send l7 :locate #f(0 -65 275))
	   (send l6 :assoc l7)
	   
	   (setq j1 (instance rotational-joint :init :name 'j1 :parent-link l1 :child-link l2 :axis :z :min -180 :max 180))
	   (setq j2 (instance rotational-joint :init :name 'j2 :parent-link l2 :child-link l3 :axis :y :min -90 :max 90))
	   (setq j3 (instance rotational-joint :init :name 'j3 :parent-link l3 :child-link l4 :axis :x :min -90 :max 90))
	   (setq j4 (instance rotational-joint :init :name 'j4 :parent-link l4 :child-link l5 :axis :y :min -180 :max 180))
	   (setq j5 (instance rotational-joint :init :name 'j5 :parent-link l5 :child-link l6 :axis :x :min 0 :max 180))
	   (setq j6 (instance rotational-joint :init :name 'j6 :parent-link l6 :child-link l7 :axis :y :min -90 :max 90))

	   (setq joint-list (list j1 j2 j3 j4 j5 j6))
	   (setq links (list l1 l2 l3 l4 l5 l6 l7))
	   (send self :init-ending)
	   ))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  )

(x::window-main-one)
(setq r (instance 6dof-model :init))
(objects (list r (send r :end-coords)))

(dotimes (i 400)
  (setq c (make-cascoords 
	   :pos (float-vector (+ 150 (* 50 (sin (/ i 100.00)))) 0 0)
	   :rpy (float-vector 0 0 0)))
  (send r :inverse-kinematics c
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:translation-axis t
	:rotation-axis nil
	:debug-view t)
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t)
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




