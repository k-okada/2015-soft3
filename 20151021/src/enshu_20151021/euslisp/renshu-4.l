#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．

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
(do ((i 0 (+ i 0.5)))
    ((> i 50))
    (send r :angle-vector (float-vector (- 50 i) i))
    (send *irtviewer* :draw-objects))
(send c1 :dissoc d2)
(do ((i 0 (- i 0.1)))
    ((< i -10))
    (send d2 :locate (float-vector 0 0 i))
    (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





