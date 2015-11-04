#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．

(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 40))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 40))
    (send b2 :locate #f(0 0 -20))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray20)
    b1))

(defun make-hinji nil
  (let ((b2 (make-cube 22 16 68))
	(b1 (make-cube 26 20 64))
	(b3 (make-cylinder 3 68)))
    (send b2 :locate #f(-4 0 0))
    (send b3 :locate #f(0 0 -34))
    (setq b2 (body- b2 b1))
    (setq b2 (body+ b2 b3))
    (send b1 :set-color :gray80)
    b2))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))
(do ((i 0 (+ i 1)))
    ((> i 470));;1.5T
    (send r :angle-vector (float-vector (* 9 (sin(/ i 50.0)))))
    (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




