#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-closet nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 60 60 60))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cube 40 50 15))
    (send b2 :locate #f(0 5 12.5))
    (setq b3 (make-cube 40 50 15))
    (send b3 :locate #f(0 5 -12.5))
    (setq b1 (body- b1 b2))
    (setq b1 (body- b1 b3))
    (send b1 :set-color :gray20)
    b1))
(defun make-upper-drawer nil 
  (let (b1 b2)
    (setq b1 (make-cube 40 50 15))
    (send b1 :locate #f(0 5 12.5))
    (setq b2 (make-cube 30 40 10))
    (send b2 :locate #f(0 5 15))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray80)
    b1))
(defun make-lower-drawer nil 
  (let (b1 b2)
    (setq b1 (make-cube 40 50 15))
    (send b1 :locate #f(0 5 -12.5))
    (setq b2 (make-cube 30 40 10))
    (send b2 :locate #f(0 5 -10))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray80)
    b1))

(setq c1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-closet))))
(setq d1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-upper-drawer))))
(setq d2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-lower-drawer)))))
(setq j1 (instance linear-joint :init :parent-link c1 :child-link d1 :axis :y))
(setq j2 (instance linear-joint :init :parent-link c1 :child-link d2 :axis :y))
(setq r (instance cascaded-link :init))
(send r :assoc c1)
(send c1 :assoc d1)
(send c1 :assoc d2)
(setq (r . links) (list c1 d1 d2))
(setq (r . joint-list) (list j1 j2))
(send r :init-ending)
(objects (list r))
(do ((i 0 (+ i 1)))
    ((> i 360))
    (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




