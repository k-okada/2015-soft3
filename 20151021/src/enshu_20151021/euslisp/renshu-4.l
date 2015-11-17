#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．
(defun make-box nil
  (let (b1 b2)
    (setq b1 (make-cube 6 40 34))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cylinder 2 40))
    (send b2 :locate #f(0 -16 -20))
    (setq b3 (make-cylinder 3 3))
    (send b3 :locate #f(5 10 0))
    (send b3 :rotate (deg2rad -90) :y)
    (setq b1 (body+ b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :locate #f(0 18 0))
    (send b1 :set-color :gray20)
    b1))

(defun make-hinji nil
  ;;(let ((b2 (make-cube 22 16 58))
  ;;	(b1 (make-cube 26 20 54)))
    (let ((b2 (make-cube 26 50 40))
  	(b1 (make-cube 26 40 34)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    (send b2 :locate #f(-5 18 0))
    b2))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-box))))
(setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))

(setq i 0)
(do-until-key
 (send r :angle-vector (float-vector (* -90 (abs (sin (/ i 100.0))))))
 (send *irtviewer* :draw-objects)
 (incf i))
	
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





