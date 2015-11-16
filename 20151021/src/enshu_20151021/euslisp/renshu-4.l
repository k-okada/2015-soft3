#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．

(defun make-body nil
  (let ((b1 (make-cube 10 10 10))
	(b2 (make-cube 8 4 20)))
    (send b2 :locate #f(0 -3 15))
    (setq b1 (body+ b1 b2))
    (send b1 :locate #f(0 0 -5))
    (send b1 :set-color :brown)
    b1))

(defun make-hari nil
  (let (b1 b2)
    (setq b1 (make-cylinder 0.5 20))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cube 2 1 4))
    (send b2 :locate #f(0 0 22))
    (setq b2 (body+ b1 b2))
    (send b2 :set-color :white)
    b2))


(setq B1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-body))))
(setq B2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hari))))
(setq j1 (instance rotational-joint :init :parent-link B1 :child-link B2 :axis :y))

(setq r (instance cascaded-link :init))
(send r :assoc B1)
(send B1 :assoc B2)
(setq (r . links) (list B1 B2))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))

(dotimes (i 1000)
 (send r :angle-vector (float-vector (* 20 (sin (/ i 5)))))
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





