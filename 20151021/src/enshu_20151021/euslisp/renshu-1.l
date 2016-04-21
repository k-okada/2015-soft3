#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(make-irtviewer)
(setq c1 (make-sphere 10))
(send c1 :set-color :red)
(send c1 :locate #f(0 0 0))
(setq c2 (make-sphere 3))
(send c2 :set-color :blue)
(send c2 :locate #f(100 0 0))
(setq c3 (make-sphere 1))
(send c3 :set-color :white)
(send c3 :locate #f(110 0 0))

(send c1 :assoc c2)
(send c2 :assoc c3)
(objects (list c1 c2 c3))

(do-until-key
  (send c1 :rotate (deg2rad 2) :z)
  (send c2 :rotate (deg2rad 7) :z)
  (send c3 :rotate (deg2rad 2) :z)
  (send *irtviewer* :draw-objects)
  )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




