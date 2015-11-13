#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(defun make-za nil
  (let (b1 b2)
    (setq b1 (make-cube 50 80 10))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cube 20 20 10))
    (send b2 :locate #f(0 30 0))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray20)
    (send b1 :locate #f(0 -35 0))
    b1))

(defun make-se nil
  (let (b1 b2 b3 b4 b5)
    (setq b1 (make-cube 15 8 20))
    (send b1 :locate #f(0 35 5))
    (setq b2 (make-cylinder 3 30))
    (send b2 :rotate (deg2rad 90) :y)
    (send b2 :locate #f(0 35 -15))
    (setq b3 (make-cube 50 100 10))
    (send b3 :locate #f(0 -10 10))
    (setq b4 (make-cube 15 15 10))
    (send b4 :locate #f(17.5 32.5 10))
    (setq b3 (body- b3 b4))
    (setq b5 (make-cube 15 15 10))
    (send b5 :locate #f(-17.5 32.5 10))
    (setq b3 (body- b3 b5))
    (setq b1 (body+ b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :set-color :gray80)
    (send b1 :locate #f(0 -35 0))
    b1))

(defclass zaisu
  :super cascaded-link
  :slots (h1 s1 j1))
(defmethod zaisu
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-za))))
	   (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-se))))

	   (setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :x))

	   ;;instance cascaded coords
	   (setq links (list h1 s1))
	   (setq joint-link (list j1))
	   ;;
	   (send self :assoc h1)
	   (send h1 :assoc s1)
	   ;;
	   (send self :init-ending)
	   self))
  ;;
  ;; (send r :j1 :joint-angle 30)
  (:j1 (&rest args) (forward-message-to j1 args))
)

(setq r (instance zaisu :init))
(objects (list r))
(send r :j1 :joint-angle -90)
(send *irtviewer* :draw-objects)
(x::window-main-one)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




