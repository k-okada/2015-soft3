#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(setq SUN (make-sphere 100))
(setq earth (make-sphere 20))
(setq moon (make-sphere 10))
(send SUN :set-color :red)
(send earth :set-color :blue)
(send earth :locate #f(300 0 0))
(send moon :locate #f(350 0 0))
(send SUN :assoc earth)
(send earth :assoc moon)
(objects (list earth sun moon))
(setq i 0)
(do-until-key
 ;(send earth :locate #f(0 0 0))
 (send SUN :rotate (deg2rad 3) :z)
 (send earth :rotate (deg2rad 5) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 (incf i))
 )


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




