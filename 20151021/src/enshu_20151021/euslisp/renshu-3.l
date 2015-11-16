#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-body nil
  (let ((b1 (make-cube 60 20 40)))
    (send b1 :locate #f(0 0 0))
    (send b1 :set-color :gray20)
    b1))

(defun make-button nil
  (let ((b2 (make-cylinder 3 6)))
    (send b2 :locate #f(-20 0 20))
    (send b2 :set-color :red)
    b2))

(defun make-speaker nil
  (let ((b3 (make-cube 40 5 25)))
    (send b3 :locate #f(5 10 -5))
    (send b3 :set-color :gray60)
    b3))

(defun make-antenna nil
  (let ((b4 (make-cylinder 0.5 50)))
    (send b4 :locate #f(28 -8 20))
    (send b4 :rotate (/ -pi 3) :y)
    (send b4 :set-color :gray90)
    b4))

(defun make-channel nil
  (let ((b4 (make-cylinder 5 8)))
    (send b4 :locate #f(0 0 0))
    (send b4 :rotate (/ -pi 2) :x)
    (send b4 :translate #f(-22 5 5))
    (send b4 :set-color :white)
    b4))

(setq A1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-body))))
(setq B1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-button))))
(setq C1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-speaker))))
(setq D1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-antenna))))
(setq E1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-channel))))

(setq r (instance cascaded-link :init))
(send r :assoc A1)
(send A1 :assoc B1)
(send A1 :assoc C1)
(send A1 :assoc D1)
(send A1 :assoc E1)
(setq (r . links) (list A1 B1 C1 D1 E1))
(send r :init-ending)

(objects (list r))

(dotimes (i 500)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




