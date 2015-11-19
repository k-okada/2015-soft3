#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．
(defun make-base nil
(let (c1)
  (setq c1 (make-cube 10 30 40))
  (send c1 :locate #f(-5 0 0))
  (send c1 :set-color :gray20)
  c1))
(defun make-handle nil
  (let 
      ((c2 (make-cylinder 3 40)))
    (send c2 :locate #f( 3 0 0))
  (send c2 :set-color :green)
  c2))
(defun make-fan nil
  (let 
      ((c2 (make-cylinder 30 3)))
    (send c2 :locate #f(3 0 60.0))
    (send c2 :rotate (deg2rad 90) :x)
  (send c2 :set-color :red)
  c2))

(defclass bunbun-uchiwa-model
  :super cascaded-link
  :slots (h1 s1 j1))
(defmethod bunbun-uchiwa-model
  (:init ()
	 (let()
	   (send-super :init)
	   (setq b1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-base))))
	   (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-handle))))
	   (setq f1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-fan))))
	   (setq j1 (instance rotational-joint :init :parent-link b1 :child-link h1 :axis :x))
	   (setq links (list b1 h1 f1))
	   (setq joint-list (list j1))
	   (send self :assoc b1)
	   (send b1 :assoc h1)
	   (send h1 :assoc f1)
	   (send self :init-ending)
	   self))
  (:j1 (&rest args) (forward-message-to j1 args))
  )

;(setq r (instance bunbun-uchiwa-model :init))
;(objects (list r))

;(dotimes (i 10000)
;  (send r :j1 :joint-angle  (* 90 (sin (/ i 50.0))))
;  (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





