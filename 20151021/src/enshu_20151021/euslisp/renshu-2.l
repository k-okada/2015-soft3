#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-block nil
  (let (b1 b2)
    (setq b1 (make-cube 30 30 30))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cylinder 3 40))
    (send b2 :locate #f(0 0 -20))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-rail nil
  (let (b1)
    (setq b1 (make-cylinder 3 80))
    (send b1 :locate #f(0 0 -40))
    (send b1 :set-color :gray80)
    b1))
(setq r1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rail))))
(setq b1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-block))))
(setq j1 (instance linear-joint :init :parent-link b1 :child-link r1 :axis :z))
(setq r (instance cascaded-link :init))
(send r :assoc r1)
(send r1 :assoc b1)
(setq (r . links) (list r1 b1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))
(do ((i 0 (+ i 1)))
    ((> i 360))
    (send *irtviewer* :draw-objects))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




