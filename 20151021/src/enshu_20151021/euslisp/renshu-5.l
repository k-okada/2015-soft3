#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 5)
;; 6自由度以上のアームを作りrotation-axis（や冗長自由度）を利用したサンプルプログラムを書いてみよ．

(defun make-base ()
  (let ((b1) (b2))
    (setq b1 (make-cube 50 50 10))
    (setq b2 (make-cylinder 20 40))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-l1 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 50 50 30))
    (setq b2 (make-cylinder 10 30))
    (send b2 :rotate (/ pi -2) :x)
    (setq b1 (body+ b1 b2))
    (send b1 :translate #f(0 0 55))
    (send b1 :set-color :gray60)
    b1))
(defun make-l2 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 120 10 30))
    (send b1 :translate #f(45 0 0))
    (setq b2 (make-cylinder 10 20))
    (send b2 :rotate (/ pi 2) :x)
    (send b2 :translate #f(90 0 0))
    (setq b1 (body+ b1 b2))
    (send b1 :translate #f(0 35 0))
    (send b1 :set-color :red)   
    b1))
(defun make-l3 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 60 30 30))
    (send b1 :translate #f(15 0 0))
    (setq b2 (make-cylinder 10 20))
    (send b2 :translate #f(35 0 0))
    (send b2 :rotate (/ pi 2) :y)
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :cyan)
    b1))
(defun make-l4 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 60 30 30))
    (send b1 :translate #f(15 0 0))
    (setq b2 (make-cube 50 30 40))
    (send b2 :translate #f(30 10 0))
    (setq b1 (body- b1 b2))
    (setq b2 (make-cylinder 10 15))
    (send b2 :translate #f(30 5 0))
    (send b2 :rotate (/ pi 2) :x)
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :green)    
    b1))
(defun make-l5 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 60 30 30))
    (send b1 :translate #f(15 0 0))
    (setq b2 (make-cube 50 30 40))
    (send b2 :translate #f(0 -10 0))
    (setq b1 (body- b1 b2))
    (setq b2 (make-cylinder 10 10))
    (send b2 :translate #f(40 0 0))
    (send b2 :rotate (/ pi 2) :y)
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :yellow)
    b1))
(defun make-l6 ()
  (let ((b1) (b2))
    (setq b1 (make-cube 50 50 30))
    (setq b2 (make-cube 50 30 50))
    (send b2 :translate #f(10 0 0))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :blue)
    b1))



(defclass armrobot
  :super cascaded-link)
(defmethod armrobot
  (:init
   ()
   (let (base l1 l2 l3 l4 l5 l6)
     (send-super :init)
     (setq base (instance bodyset-link :init (make-cascoords) :bodies (list (make-base))))
     (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l1))))
     (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l2))))
     (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l3))))
     (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l4))))
     (setq l5 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l5))))
     (setq l6 (instance bodyset-link :init (make-cascoords) :bodies (list (make-l6))))
     (setq end-coords (make-cascoords))

     (send l2 :locate #f(0 0 55))
     (send l3 :locate #f(90 0 55))
     (send l4 :locate #f(160 0 55))
     (send l5 :locate #f(190 0 55))
     (send l6 :locate #f(265 0 55))
     (send end-coords :locate #f(270 0 55))

     (send self :assoc base)
     (send base :assoc l1)
     (send l1 :assoc l2)
     (send l2 :assoc l3)
     (send l3 :assoc l4)
     (send l4 :assoc l5)
     (send l5 :assoc l6)
     (send l6 :assoc end-coords)
     
     (setq joint-list
	   (list
	    (instance rotational-joint
		      :init :parent-link base :child-link l1
		      :axis :z)
	    (instance rotational-joint
		      :init :parent-link l1 :child-link l2
		      :axis :y)
	    (instance rotational-joint
		      :init :parent-link l2 :child-link l3
		      :axis :y)
	    (instance rotational-joint
		      :init :parent-link l3 :child-link l4
		      :axis :x)
	    (instance rotational-joint
		      :init :parent-link l4 :child-link l5
		      :axis :y)
	    (instance rotational-joint
		      :init :parent-link l5 :child-link l6
		      :axis :x)))
     (setq links (list base l1 l2 l3 l4 l5 l6))
     (send self :init-ending)
     ))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  )

(setq r (instance armrobot :init))
(objects (list r))





;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




