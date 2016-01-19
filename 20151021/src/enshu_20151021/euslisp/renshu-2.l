#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．


(defun make-bou nil
  (let (b1 b2)
    (setq b1 (make-cylinder 10 10))
    (send b1 :locate #f(0 0 20))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :blue)
    b1))

(defun make-tutu nil
  (let ((b2 (make-cylinder 15 60))
	(b1 (make-cylinder 11 56)))
    (send b1 :locate #f(0 0 4))
    (setq b2 (body- b2 b1)) 
    (send b1 :set-color :gray80)
    b2))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-tutu))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-bou))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))

(dotimes (i 500)
 (send r :angle-vector (float-vector (* 10 (sin (* i 0.5)))))
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




