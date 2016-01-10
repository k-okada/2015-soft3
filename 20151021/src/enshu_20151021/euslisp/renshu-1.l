#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(if (not (boundp '*irtviewer*)) (make-irtviewer))

(setq *sun* (make-sphere 20))
(send *sun* :set-color :red)
(setq *earth* (make-sphere 5))
(send *earth* :set-color :blue)
(setq *moon* (make-sphere 3))

(send *sun* :assoc *earth*)
(send *earth* :assoc *moon*)

(send *earth* :translate #f(50 0 0))
(send *moon* :translate #f(10 0 0))

(objects (list *sun* *earth* *moon* *world-coords*))
(send *irtviewer* :draw-objects)

(dotimes (i 1000)
	(send *sun* :rotate (deg2rad 1):z)
	(send *earth* :rotate (deg2rad 1) :z)
	(send *irtviewer* :draw-objects))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




