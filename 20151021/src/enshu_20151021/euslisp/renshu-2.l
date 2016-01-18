#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．

(defun make-rect nil
  (let (b1 b2)
    (setq b1 (make-cube 20 20 20))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cylinder 5 20))
    (send b2 :locate #f(0 0 -10))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray70)
    b1))

(defun make-rail nil
  (let (b1 b2 b3)
    (setq b1 (make-cylinder 5 50))
    (send b1 :locate #f(0 0 -25))
    (setq b2 (make-cube 21 21 3))
    (send b2 :locate #f(0 0 25))
    (setq b3 (make-cube 21 21 3))
    (send b3 :locate #f(0 0 -25))
    (setq b1 (body+ b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :set-color :gray30)
    b1))

(setq rect1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rect))))
(setq rail1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rail))))
(setq lj1 (instance linear-joint :init :parent-link rail1 :child-link rect1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc rail1)
(send rail1 :assoc rect1)
(setq (r . links) (list rail1 rect1))
(setq (r . joint-list) (list lj1))
(send r :init-ending)
(objects (list r))

(do ((i 0 (+ i 1)))
    ((> i 360))
    (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




