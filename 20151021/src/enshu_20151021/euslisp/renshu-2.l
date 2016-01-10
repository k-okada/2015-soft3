#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．

(defun f1 ()
  (let (b1)
    (setq b1 (make-cube 30 40 200))
    b1))
(defun f2 ()
  (let (b1 b2)
    (setq b1 (make-cube 100 40 40))
    (setq b2 (make-cube 10 30 50))
    (setq b1 (body- b1 b2))
    b1))

(setq sliderail (instance bodyset-link :init (make-cascoords) :bodies (list (f1))))
(setq slideblock (instance bodyset-link :init (make-cascoords) :bodies (list (f2))))
(setq joint (instance linear-joint :init :parent-link sliderail :child-link slideblock :axis :z))
(setq r (instance cascaded-link :init))
(send r :assoc slideblock)
(send slideblock :assoc sliderail)
(setq (r . links) (list slideblock sliderail))
(setq (r . joint-list) (list joint))
(send r :init-ending)

(objects (list r))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
