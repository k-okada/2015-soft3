#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．

(defun make-inner nil
  (let (b1)
    (setq b1 (make-cube 35 30 100))
    (send b1 :locate #f(0 0 0))
    (send b1 :set-color :gray20)
    b1))

(defun make-outer nil
  (let ((b2 (make-cube 45 40 50))
        (b1 (make-cube 35 30 50)))
    (send b2 :locate #f(0 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))

(make-irtviewer)
(setq o1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-outer))))
(setq i1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-inner))))
(setq j1 (instance linear-joint :init :parent-link o1 :child-link i1 :axis :z))
(setq r (instance cascaded-link :init))
(send r :assoc o1)
(send o1 :assoc i1)
(setq (r . links) (list o1 i1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




