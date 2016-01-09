#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(setq door-body (make-cube 50 400 1000))
(send door-body :set-color :pink)
(setq frame-body (body- (make-cube 50 500 1100) (make-cube 50 400 1000)))
(send frame-body :set-color :red)
(setq nob-body (body+ (make-cube 30 20 20) (send (make-cube 20 80 20) :locate (float-vector 25 30 0))))
(send nob-body :set-color :blue)

(setq frame (instance bodyset-link :init (make-cascoords) :bodies (list frame-body)))
(send door-body :locate (float-vector -25 -200 0))
(setq door (instance bodyset-link :init (make-cascoords) :bodies (list door-body)))
(send door :locate (float-vector 25 200 0))
(setq nob (instance bodyset-link :init (make-cascoords) :bodies (list nob-body)))

(send frame :assoc door)
(send door :assoc nob)
(send nob :locate (float-vector 40 -170 0))

(setq joint1 (instance rotational-joint :init :parent-link frame :child-link door :axis :z :min 0 :max 180))
(setq joint2 (instance rotational-joint :init :parent-link door :child-link nob :axis :x :min -90 :max 0))

(setq r (instance cascaded-link :init))
(setq (r . links) (list frame door nob))
(setq (r . joint-list) (list joint1 joint2))
(send r :init-ending)
(objects r)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




