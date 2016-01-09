#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-hontai nil
  (let (b1 b2 b3 b4)
    (setq b1 (make-cube 55 40 35))
    (send b1 :locate #f(-26.25 -22 0))
    (setq b2 (make-cube 40 35 30))
    (send b2 :locate #f(-21.25 -18.5 0))
    (setq b3 (make-cube 12.5 4 35))
    (send b3 :locate #f(-47.5 0 0))
    (setq b4 (make-cube 2.5 4 35))
    (send b4 :locate #f(0 0 0))
    (setq b1 (body- b1 b2))
    (setq b1 (body+ b1 b3))
    (setq b1 (body+ b1 b4))
    (send b1 :set-color :gray20) b1)
  )
;(defun make-tobira nil

(defun make-tobira nil
  (let (b1)
    (setq b1 (make-cube 42.5 4 35))
    (send b1 :locate #f(-20 0 0))
    (send b1 :set-color :red) b1)
  )

(defclass oven
  :super cascaded-link)

(defmethod oven
  (:init
   ()
   (let (h1)
     (send-super :init)
     (setq h1 (make-tobira))
     (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
     (setq h2 (make-hontai))
     (setq h2 (instance bodyset-link :init (make-cascoords) :bodies (list h1 h2)))
     (send self :assoc h1)
     (send h1 :assoc h2)
     (setq joint-list
	   (list
	   (instance rotational-joint
		     :init :parent-link h2 :child-link h1
		     :axis :-z)))
     (setq links (list h1 h2))
     (send self :init-ending)
     )))
(setq r (instance oven :init))
(objects (list r))

(dotimes (i 90)
  (send r :angle-vector (float-vector i))
  (send *irtviewer* :draw-objects)
  )




;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




