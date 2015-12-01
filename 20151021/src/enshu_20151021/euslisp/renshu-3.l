#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-wall nil
 (let  (b1 b2)
  (setq b1 (make-cube 5 200 250))
  (send b1 :locate #f(0 100 125))
  (setq b2 (make-cube 5 100 150))
  (send b2 :locate #f(0 100 75))
  (setq b3 (body- b1 b2))
  (send b3 :set-color :white)
  b3))
	
(defun make-door nil
 (let (b1)
  (setq b1 (make-cube 5 100 150))
  (send b1 :locate #f(0 50 75))
  (send b1 :set-color :brown)
  b1))

(setq w1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-wall))))
(setq d1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-door))))
(send d1 :locate #f(0 50 0))
(setq j1 (instance rotational-joint :init :parent-link w1 :child-link d1 :axis :z))
(setq home (instance cascaded-link :init))
(send home :assoc w1)
(send w1 :assoc d1)
(setq (home . links) (list w1 d1))
(setq (home . joint-list) (list j1))
(send home :init-ending)
(objects (list home))
(dotimes (i 1000)
 (send home :angle-vector (float-vector 0))
 (send *irtviewer* :draw-objects)
 (x::window-main-one))


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




