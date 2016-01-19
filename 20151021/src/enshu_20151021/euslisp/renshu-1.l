#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(setq b1 (make-sphere 20 :weight 20 ))
(send b1 :set-color :red)
(setq b2 (make-sphere 10 :weight 10 ))
(send b2 :set-color :blue)
(send b2 :locate #f(100 0 0))
(setq b3 (make-sphere 5 :weight 20 ))
(send b3 :set-color :white)
(send b1 :assoc b2)
(send b2 :assoc b3)
(send b3 :locate #f(120 0 0))

)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




