#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．

(defun make-stick nil
  (let (stick)
  (setq stick (make-cube 10 10 100))
  (send stick :locate #f(0 0 0))
  stick))

(defun make-hole nil
  (let (hole minus)
    (setq hole (make-cube 20 20 30))
    (send hole :locate #f(0 0 0))
    (setq minus (make-cube 10 10 30))
    (send minus :locate #f(0 0 0))
    (setq hole (body- hole minus))
    (send hole :set-color :yellow)
    hole))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-stick))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hole))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




