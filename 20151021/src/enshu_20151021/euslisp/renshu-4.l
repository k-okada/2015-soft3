#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．
(defun make-rdoor nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 2 20 40))
    (setq b2 (make-cylinder 1 1.5))
    (send b2 :rotate (/ pi 2) :y)
    (send b2 :locate #f(1 -7.5 0) :world)
    (setq b3 (make-cylinder 1.5 0.5))
    (send b3 :rotate (/ pi 2) :y)
    (send b3 :locate #f(2.5 -7.5 0) :world)
    (setq b2 (body+ b2 b3))
    (setq b1 (body+ b1 b2))
    (send b1 :locate #f(0 -10 0))
    (send b1 :set-color :white)
    b1))

(defun make-ldoor nil
  (let (b1)
    (setq b1 (make-rdoor))
    (send b1 :rotate pi :x)
    (send b1 :locate #f(0 10 0) :world)
    b1))

(defun make-shelf nil
  (let (b1 b2 b3 b4 b5)
    (setq b1 (make-cube 24 44 44))
    (setq b2 (make-cube 2 40 40))
    (send b2 :locate #f(11 0 0))
    (setq b3 (make-cube 20 40 19))
    (send b3 :locate #f(0 0 10.5))
    (setq b4 (make-cube 20 40 19))
    (send b4 :locate #f(0 0 -10.5))
    (setq b1 (body- b1 b2))
    (setq b1 (body- b1 b3))
    (setq b1 (body- b1 b4))
    (send b1 :set-color :brown)
    b1))

(defclass shelf-model
  :super cascaded-link
  )
(defmethod shelf-model
  (:init
   ()
   (let (s1 rd1 ld1 j1 j2)
     (send-super :init)
     (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-shelf))))
     (setq rd1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rdoor))))
     (send rd1 :locate #f(11 20 0)) 
     (setq j1 (instance rotational-joint :init :parent-link s1 :child-link rd1 :axis :z :min-angle 0 :max-angle 90))
     (setq ld1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-ldoor))))
     (send ld1 :locate #f(11 -20 0))
     (setq j2 (instance rotational-joint :init :parent-link s1 :child-link ld1 :axis :z :min-angle -90 :max-angle 0))
     (setq links (list s1 rd1 ld1))
     (setq joint-list (list j1 j2))
     (send self :assoc s1)
     (send s1 :assoc rd1)
     (send s1 :assoc ld1)
     (send self :init-ending)
     self)))


(setq r (instance shelf-model :init))
(send r :rotate (/ pi 2) :z)
(objects (list r))
(dotimes (i 360)
  (if (< i 180)
      (send r :angle-vector (float-vector (* i 0.5) (* i -0.5)))
    (send r :angle-vector (float-vector (+ 90 (* (- i 180) -0.5)) (+ -90 (* (- i 180) 0.5)))))
  (send *irtviewer* :draw-objects))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





