#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-guide nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 100 10 10))
    (setq b2 (make-cube 100 2 2))
    (setq b3 (make-cube 100 2 2))
    (send b2 :locate #f(0 4 0))
    (send b3 :locate #f(0 -4 0))
    (setq b1 (body- b1 b2))
    (setq b1 (body- b1 b3))
    (send b1 :set-color :gray80)
    b1))

(defun make-slider nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 10 14 8))
    (setq b2 (make-cube 10 10 4))
    (setq b3 (make-cube 10 6 2))
    (send b1 :locate #f(0 0 3))
    (send b2 :locate #f(0 0 3))
    (setq b1 (body- b1 b2))
    (setq b1 (body- b1 b3))
    (send b1 :set-color :gray20)
    b1))

(setq g1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-guide))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-slider))))
(setq j1 (instance linear-joint :init :parent-link g1 :child-link s1 :axis :x))
(setq r (instance cascaded-link :init))
(send r :assoc g1)
(send g1 :assoc s1)
(setq (r . links) (list g1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))
(send *irtviewer* :draw-objects)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




