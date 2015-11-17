#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defclass revolving-door
  :super cascaded-link
  :slots (l1 l2 j1))
(defmethod revolving-door
  (:init()
	(let (b)
	  (send-super :init)
	  
	  (setq b (body- (make-cylinder 60 54) (make-cylinder 55 54)))
	  (setq b (body+ b (make-cylinder 60 8)))
	  (send b :set-color :yellow)
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

(setq r (instance revolving-door :init))
(objects (list r))
(setq i 0)
(do-until-key
 (setq i (+ i 1))
 (if (eq i 180) (setq i (- 180)))
 (send r :angle-vector (float-vector i))
 (send *irtviewer* :draw-objects))
 

;; DO NOT EDIT AFTER THIS LINE




(send *unit-test* :print-result)
(exit 1)




