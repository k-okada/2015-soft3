#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-block nil
  (let (b1)
    (setq b1 (make-cube 100 10 10))
    (send b1 :locate #f(0 0 0))
    (send b1 :set-color :grey10)
    b1))

(defun make-block2 nil
  (let (b1)
    (setq b1 (make-cube 20 10 10))
    (send b1 :locate #f(0 0 10))
    (send b1 :set-color :grey90)
    b1))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-block))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-block2))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :x))
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))

(dotimes (i 100)
  (send j1 :joint-angle (* 10 (sin (deg2rad (* i 12)))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
