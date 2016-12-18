#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(setq sun (make-sphere 30))
(setq earth (make-sphere 10))
(setq moon (make-sphere 5))
(send sun :set-color :red)
(send earth :set-color :blue)
(send moon :set-color :yellow)

(send sun :locate #f(0 0 0))
(send earth :locate #f(100 0 0))
(send moon :locate #f(120 0 0))

(send sun :assoc earth)
(send earth :assoc moon)
(objects (list sun earth moon))

(do ((i 0 (+ i 1)))
    ((> i 360))
    (send sun :rotate (deg2rad 1) :z)
    (send earth :rotate (deg2rad 12) :z)
    (send *irtviewer* :draw-objects))
    

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




