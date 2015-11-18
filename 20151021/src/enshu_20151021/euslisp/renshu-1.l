#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(setq sun_size 20)
(setq sun_revvel 0.001)

(setq earth_revvel 0.1)
;;(setq earth_size (* sun_size earth_size_tosun))
(setq earth_size 5)
(setq moon_size 1)
;;(setq moon_size (* sun_size moon_size_tosun))



(setq sun (make-sphere sun_size))
(send sun :set-color :red)
(send sun :locate #f(0 0 0))
(setq earth (make-sphere earth_size :pos #f(150 0 0)))
(send earth :set-color :blue)
(send sun :assoc earth)
(setq moon (make-sphere moon_size :pos #f(160 0 0)))
(send moon :set-color :yellow)
(send earth :assoc moon)

(objects (list sun earth moon))

(do-until-key
  (send sun :rotate sun_revvel :z)
  (send earth :rotate earth_revvel #f(0 0 1))
  (send *irtviewer* :draw-objects)  
  )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




