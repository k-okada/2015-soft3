#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-ugoku nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 15 15 15))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b3 (make-cube 6 25 25))
    (send b3 :locate #f(10 0 0))
    (setq b1 (body- b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :set-color :gray20)
    b1))

(defun make-ugokanai nil
  (let ((b2 (make-cube 10 10 5))
	(b1 (make-cube 10 10 5))
	(b3 (make-cylinder 3 60)))
    (send b3 :locate #f(0 0 -30))
    (send b2 :locate #f(0 0 -30))
    (send b1 :locate #f(0 0 30))
    (setq b3 (body+ b2 b3))
    (setq b3 (body+ b1 b3))
    (send b1 :set-color :gray80)
    b3))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-ugokanai))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-ugoku))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))
;;instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))
(send *irtviewer* :draw-objects)
(x::window-main-one)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




