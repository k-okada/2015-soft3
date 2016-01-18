#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-back-cover nil
  (let (b1 b2)
    (setq b1 (make-cube 30 40 1))
    (send b1 :locate #f(15 0 -6))
    (setq b2 (make-cube 2 40 6))
    (send b2 :locate #f(0 0 -3))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray40)
    b1))

(defun make-front-cover nil
  (let (b)
    (setq b (make-cube 30 40 1))
    (send b :locate #f(15 0 0))
    (send b :set-color :gray40)
    b))

(defun make-pages nil
  (let (b)
    (setq b (make-cube 30 40 5))
    (send b :locate #f(15 0 -3))
    (send b :set-color :white)
    b))

(setq bc1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-back-cover))))
(setq fc1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-front-cover))))
(setq pg1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-pages))))

(setq j1 (instance rotational-joint :init :parent-link bc1 :child-link fc1 :axis :y))
(setq j2 (instance rotational-joint :init :parent-link bc1 :child-link pg1 :axis :y))
(setq r (instance cascaded-link :init))
(send r :assoc bc1)
(send bc1 :assoc fc1)
(send bc1 :assoc pg1)

(setq (r . links) (list bc1 fc1 pg1))
(setq (r . joint-list) (list j1 j2))
(send r :init-ending)
(objects (list r))

(dotimes (i 1000)
 (send *irtviewer* :draw-objects)
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




