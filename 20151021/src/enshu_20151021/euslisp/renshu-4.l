#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．


(defclass move
  :super cascaded-link
  :slots (l1 l2 j1))
(defmethod move
  (:init()
	(let (b)
	  (send-super :init)

	  (setq b (body- (make-cylinder 60 54) (make-cylinder 55 54)))
	  (setq b (body+ b (make-cylinder 60 8)))
	  (send b :set-color :green)
	  (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1))
	  (send l1 :locate #f(0 0 -4))

	  (setq b (body+ (make-cube 10 100 50) (make-cube 100 10 50)))

	  (send b :set-color :red)
	  (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
	  (send l2 :locate #f(0 0 27))

	  (send l1 :assoc l2)

	  (setq j1 (instance rotational-joint :init :name 'j1
			     :parent-link l1 :child-link l2 :axis :z :min -180 :max 180))
	  (setq links (list l1 l2))
	  (setq joint-list (list j1))

	  (send self :init-ending)
	  self))
  )

(setq r (instance move :init))
(objects (list r))
(setq i 0)
(do ((angle 0 (+ angle 1)))
 ((> angle 180))
 (send r :angle-vector (float-vector angle))
 (send *irtviewer* :draw-objects))


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
