#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(setq sun (make-gdome (make-gdome (make-gdome (make-icosahedron 1.5)))))
(send sun :set-color :red)
(setq earth (make-gdome (make-gdome (make-gdome (make-icosahedron 0.5)))))
(send earth :set-color :blue)
(send earth :locate (float-vector 7.0 0 0))
(setq moon (make-gdome (make-gdome (make-gdome (make-icosahedron 0.3)))))
(send moon :set-color :yellow)
(send moon :locate (float-vector 8.0 0 0))

(send sun :assoc earth)
(send earth :assoc moon)
(objects (list sun earth moon))

(dotimes (i 300)
 (send sun :rotate (deg2rad 0.3) :z)
 (send earth :rotate (deg2rad 1) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




