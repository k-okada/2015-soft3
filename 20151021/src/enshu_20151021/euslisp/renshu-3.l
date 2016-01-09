#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(defun make-horse nil
  (let (h1 n1 b1 l1)
    (setq l1 (make-cube 40 30 80))
    (setq b1 (make-cube 40 110 35))
    (send b1 :locate #f(0 40 35))
    (setq n1 (make-cube 40 30 150))
    (send n1 :locate #f(0 80 35))
    (setq h1 (make-cube 40 60 40))
    (send h1 :locate #f(0 95 95))
    (setq l1 (body+ l1 b1))
    (setq l1 (body+ l1 n1))
    (setq l1 (body+ l1 h1))
    (send l1 :set-color :white)
    l1))

(defun make-upper nil
  (let (u1)
    (setq u1 (make-cone #f(0 0 50)
			(list (float-vector (* 300 (sin 0)) (* 300 (cos 0)) 0)
			      (float-vector (* 300 (sin (/ PI 4))) (* 300 (cos (/ PI 4))) 0)
			      (float-vector (* 300 (sin (/ PI 2))) (* 300 (cos (/ PI 2))) 0)
			      (float-vector (* 300 (sin (* PI 0.75))) (* 300 (cos (* PI 0.75))) 0)
			      (float-vector (* 300 (sin PI)) (* 300 (cos PI)) 0)
			      (float-vector (* 300 (sin (* PI 1.25))) (* 300 (cos (* PI 1.25))) 0) 
			      (float-vector (* 300 (sin (* PI 1.5))) (* 300 (cos (* PI 1.5))) 0)
			      (float-vector (* 300 (sin (* PI 1.75))) (* 300 (cos (* PI 1.75))) 0))))
    (send u1 :locate #f(0 0 500))
    (send u1 :set-color :yellow)
    u1))

(defclass merry-go-round
  :super cascaded-link)
(defmethod merry-go-round
  (:init
   ()
   (let (h1 u1 a1)
     (send-super :init)
     (setq h1 (make-horse))
     (send h1 :locate #f(150 0 100))
     (setq u1 (make-upper))
     (setq a1 (make-cylinder 10 500))
     (send a1 :set-color :yellow)
     (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list a1)))
     (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list u1)))
     (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
     (send self :assoc l1)
     (send l1 :assoc l2)
     (send l2 :assoc l3)
     (setq j1 (instance rotational-joint
		      :init :parent-link l1 :child-link l2 :axis :z :max 720))
     (setq j2 (instance linear-joint
     		      :init :parent-link l2 :child-link l3 :axis :z))
     (setq joint-list (list j1 j2))
     (setq links (list l1 l2 l3))
     (send self :init-ending)
     )))
(setq r (instance merry-go-round :init))
(objects (list r))
(send *irtviewer* :draw-objects)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




