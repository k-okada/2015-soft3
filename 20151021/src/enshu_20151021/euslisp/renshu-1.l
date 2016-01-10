#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(do ((i 0 (+ i 0.05))) 
     ((> i (* pi 2))) 
  (setq sun (make-sphere 100))
  (send sun :set-color :orange)
  
  (setq earth (make-sphere 10))
  (send earth :set-color :blue)
  (send earth :rotate i :z)
  (send earth :translate #f(500 0 0))

  
  (setq moon (make-sphere 5))
  (send moon :set-color :yellow)
  (send moon :translate (send (send earth :copy-worldcoords) :pos))
  (send moon :rotate (* i 12) :z)
  (send moon :translate #f(20 0 0))
  (objects (list sun earth moon))
  (send *irtviewer* :draw-objects)
)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




