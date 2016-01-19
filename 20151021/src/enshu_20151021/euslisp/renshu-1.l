#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ


(setq g_s (make-icosahedron 10.0))
(setq g_e (make-icosahedron 2.0))
(setq g_m (make-icosahedron 1.0))

(setq sun (make-cascoords :pos (float-vector 0 0 0)))
(setq sun (make-gdome g_s))
(send sun :set-color :red)

(setq sun_core (make-cascoords :pos (float-vector 0 0 0)))
(setq sun_core (make-gdome g_m))
(send sun_core :set-color :red)

(setq earth (make-cascoords :pos (float-vector 0 0 0) :parent sun_core))
(setq earth(make-gdome g_e))
(send earth :set-color :blue)
(send earth :translate (float-vector 100 0 0))
(send sun_core :assoc earth)

(setq moon (make-cascoords :pos (float-vector 0 0 0) :parent earth))
(setq moon (make-gdome g_m))
(send moon :set-color :white)
(send moon :translate (float-vector 105 0 0))
(send earth :assoc moon)

(objects (list sun earth moon))

(dotimes (i 1000)
 (send sun :rotate (deg2rad 0.3) :z)
 (send sun_core :rotate (deg2rad 0.5) :z)
 (send earth :rotate (deg2rad 2) :z)
 (send moon :rotate (deg2rad 1) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




