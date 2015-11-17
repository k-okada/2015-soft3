#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(setq sun (make-sphere 10))
(send sun :locate #f(0 0 0))
(send sun :set-color :orange)
(setq earth (make-sphere 5))
(send earth :locate #f(0 40 0))
(send earth :set-color :blue)
(setq moon (make-sphere 2.5))
(send moon :locate #f(0 50 0))
(send moon :set-color :yellow)
(send sun :assoc earth)
(send earth :assoc moon)
(setq r (instance bodyset :init
		  (make-cascoords) :bodies (list sun earth moon)))
(objects (list r))

(dotimes (i 10000)
  (send sun :rotate (deg2rad 1) :z)
  (send earth :rotate (deg2rad 1) :z)
  (send *irtviewer* :draw-objects))
;;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




