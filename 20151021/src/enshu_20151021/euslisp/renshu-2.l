#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ.

(defun make-guide (size)
  (let (b1)
    (setq b1(make-cube size 10 10))
    (send b1 :locate #f(0 0 0))
    (send b1 :set-color :gray20)
    b1))
(defun make-body nil
  (let (b1)
    (setq b1 (make-cube 30 10 10))
    (send b1 :locate #f(0 0 10))
    (send b1 :set-color :gray80)
    b1))

(setq g1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-guide 100))))
(setq g2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-body))))
(setq j1 (instance linear-joint :init :parent-link g1 :child-link g2 :axis :x))

(setq x (instance cascaded-link :init))
(send x :assoc g1)
(send g1 :assoc g2)

(setq (x . links) (list g1 g2))
(setq (x . joint-list) (list j1))
(send x :init-ending)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




