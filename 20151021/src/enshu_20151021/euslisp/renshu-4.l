#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．
(defun make-foundation nil
  (let (b1 b2)
    (setq b1 (make-cylinder 20 1))
    (setq b2 (make-cylinder 5 50))
    (send b1 :locate #f(0 0 0))
    (send b2 :locate #f(0 0 1))
    (send b1 :set-color :grey90)
    (send b2 :set-color :grey90)
    (setq b1 (body+ b1 b2))
    b1))

(defun make-chair nil
  (let (b1 b2)
    (setq b1 (make-cube 50 50 50))
    (setq b2 (make-cube 40 50 40))
    (send b1 :locate #f(0 0 71))
    (send b2 :locate #f(5 0 76))
    (send b1 :set-color :grey20)
    (send b2 :set-color :grey20)
    (setq b1 (body- b1 b2))
    b1))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-foundation))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-chair))))
(setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
;;instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))
(dotimes (i 300)
  (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
)


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





