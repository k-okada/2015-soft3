#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(setq c1 (make-cube 100 20 10))
(setq c2 (make-cube 100 10 5))
(send c2 :locate (float-vector 0 0 2.5))
(setq guide-body (body- c1 c2))
(send guide-body :set-color :gray20)
(setq slider-body (make-cube 100 10 5))
(send slider-body :set-color :gray80)
(send slider-body :locate (float-vector 0 0 2.5))

(setq guide (instance bodyset-link :init (make-cascoords) :bodies (list guide-body)))
(setq slider (instance bodyset-link :init (make-cascoords) :bodies (list slider-body)))
(setq joint (instance linear-joint :init :parent-link guide :child-link slider :axis :x))
(setq r (instance cascaded-link :init))
(send r :assoc guide)
(send guide :assoc slider)
(setq (r . links) (list guide slider))
(setq (r . joint-list) (list joint))
(send r :init-ending)

(objects (list r))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




