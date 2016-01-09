#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．

(setq b1-body (make-cube 20 50 200))
(send b1-body :set-color :red)
(setq b1 (instance bodyset-link :init (make-cascoords) :bodies (list b1-body)))

(setq b2-body (make-cube 20 50 200))
(send b2-body :set-color :green)
(send b2-body :locate #f(10 0 100))
(setq b2 (instance bodyset-link :init (make-cascoords) :bodies (list b2-body)))
(send b2 :locate #f(-10 0 100))

(send b1 :assoc b2)
(setq joint (instance rotational-joint :init :parent-link b1 :child-link b2 :axis :y :max 0 :min -180))

(setq r (instance cascaded-link :init))
(setq (r . links) (list b1 b2))
(setq (r . joint-list) (list joint))
(send r :init-ending)
(objects r)

(dotimes (i 101)
  (send r :angle-vector (float-vector (/ (* -180.0  i)  100)))
  (send *irtviewer* :draw-objects)
  (x::window-main-one))

(send b1 :dissoc b2)
(dotimes (i 201)
  (send b2 :locate #f(0 0 3))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





