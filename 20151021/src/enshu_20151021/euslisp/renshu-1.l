#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(setq sun (make-sphere 100))
(setq earth (make-sphere 10))
(setq moon (make-sphere 5))
(send sun :set-color :Orangered)
(send earth :set-color :blue)
(send moon :set-color :burlywood)

(send earth :locate #f(200 0 0))
(send moon :locate #f(215 0 0))
(send sun :assoc earth)
(send earth :assoc moon)
(objects (list sun earth moon))
(do-until-key
 (send sun :rotate (deg2rad 1) :z)
 (send earth :rotate (deg2rad 365) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)



;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




