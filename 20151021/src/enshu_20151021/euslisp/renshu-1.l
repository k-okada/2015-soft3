#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE
;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(if (not (boundp '*irtviewer*)) (make-irtviewer))
(setq sun (make-sphere 100))
(send sun :set-color :red)
(setq earth (make-sphere 10))
(send earth :set-color :blue)
(send earth :locate #f(300 0 0))
(setq moon (make-sphere 2))
(send moon :set-color :yellow)
(send moon :locate #f(325 0 0))
(send sun :assoc earth)
(send earth :assoc moon)
(objects (list sun earth moon))
(do ((i 0 (+ i 1)))
    ((> i 720))
    (send sun :rotate (deg2rad 1) :z)
    (send earth :rotate (deg2rad 7) :z)
    (send *irtviewer* :draw-objects))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




