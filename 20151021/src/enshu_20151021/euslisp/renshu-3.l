#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; cascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
;;冷蔵庫
(defun make-door nil
  (let (b1 b2)
    (setq b1 (make-cube 6 40 40))
    (send b1 :locate #f(0 19.5 20))
    (setq b2 (make-cylinder 2.5 40))
    (setq b2 (body+ b1 b2))
    (send b2 :set-color :white)
    b2))

(defun make-hontai nil
  (let (b1 b2)
    (setq b2 (make-cube 40 40 80))
    (setq b1 (make-cube 30 30 30))
    (send b2 :locate #f(20 20 0))
    (send b1 :locate #f(15 20 20))
    (setq b2 (body- b2 b1))
    (send b1 :locate #f(0 0 -35))
    (setq b2 (body- b2 b1))
    (send b2 :set-color :gray80)
    b2))

(defclass reizouko
  :super cascaded-link
  :slots (h1 s1 j1))

(defmethod reizouko
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hontai))))
	   (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-door))))
	   (setq s2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-door))))
	   (send s2 :locate #f(0 0 -40))
	   (setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
	   (setq j2 (instance rotational-joint :init :parent-link h1 :child-link s2 :axis :z))
	   (setq links (list h1 s1 s2))
	   (setq joint-list (list j1 j2))
	   (send self :assoc h1)
	   (send h1 :assoc s1)
	   (send h1 :assoc s2)
	   (send self :init-ending)
	   self))
  (:j1 (&rest args) (forward-message-to j1 args))
  (:j2 (&rest args) (forward-message-to j2 args))
  )
(setq r (instance reizouko :init))
(send r :rotate (deg2rad 270) :z)
(objects r)




;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




