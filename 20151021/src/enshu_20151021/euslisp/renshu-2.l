#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．


(defun make-slide nil
 (let  (b1 b2)
  (setq b1 (make-cube 20 20 20))
  (send b1 :locate #f(0 0 0))
  (setq b2 (make-cylinder 7 20))
  (send b2 :locate #f(0 0 -10))
  (setq b3 (body- b1 b2))
  (send b3 :set-color :red)
  b3))
	
(defun make-rail nil
 (let (b1 b2 b3)
  (setq b1 (make-cylinder 7 80))
  (send b1 :locate #f(0 0 -40))
  (setq b2 (make-cube 20 20 10))
  (setq b3 (make-cube 20 20 10))
  (send b2 :locate #f(0 0 45))
  (send b3 :locate #f(0 0 -45))
  (setq b1 (body+ b1 b2))
  (setq b1 (body+ b1 b3))
  (send b1 :set-color :blue)
  b1))

(make-irtviewer)
(setq r1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rail))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-slide))))
(setq j1 (instance linear-joint :init :parent-link r1 :child-link s1 :axis :z))
(setq r (instance cascaded-link :init))
(send r :assoc r1)
(send r1 :assoc s1)
(setq (r . links) (list r1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))
(dotimes (i 100)
 (send r :angle-vector (float-vector (* 30 (sin (* i 0.1)))))
 (send *irtviewer* :draw-objects)
 (x::window-main-one))


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




