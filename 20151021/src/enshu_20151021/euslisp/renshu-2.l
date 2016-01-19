#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-linear nil
  (let (b1 b2)
    (setq b1 (make-cube 20 40 40))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cube 40 60 60))
    (send b2 :locate #f(0 0 50))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-hinji nil
  (let ((b1 (make-cube 100 10 10)))
    (send b1 :set-color :gray80)
    b1))



(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-linear))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :x))
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)


(objects (list r))
(dotimes (i 2000)
  (send r :angle-vector (float-vector (* 30 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
