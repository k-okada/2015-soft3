;#!/usr/bin/env irteusgl

;(load "lib/llib/unittest.l")
;(init-unit-test)
;(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(make-irtviewer)
(setq sph1 (make-gdome (make-icosahedron 0.7)))
;(setq sph2 (make-gdome sph1))
(setq base (make-gdome sph1))
(setq sun (make-gdome base));;sun make
(send sun :set-color :red);;sun color

(setq sph1 (make-gdome (make-icosahedron 0.5)))
(setq base (make-gdome sph1))
(setq earth (make-gdome base));;earth make
(send earth :set-color :blue);;earth color


(setq sph1 (make-gdome (make-icosahedron 0.3)))
(setq base (make-gdome sph1))
(setq moon (make-gdome base));;moon make
(send moon :set-color :white);;moon color


(send earth :locate #f(7.5 0 0))
(send moon :locate #f(5.0 0 0))

(send earth :assoc moon)
;(objects (list earth moon))
(send sun :assoc earth)
(objects (list sun earth moon))


(do-until-key
 (send earth :rotate (deg2rad 5) :z)
 (send sun :rotate (deg2rad 3) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)
;; DO NOT EDIT AFTER THIS LINE
;(send *unit-test* :print-result)
;(exit 1)




