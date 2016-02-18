#!/usr/bin/env irteusgl

;(load "lib/llib/unittest.l")
;(init-unit-test)
;(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ
(setq moon (make-sphere 1))
(send moon :name "moon")
(send moon :set-color :yellow)
(send moon :locate #f(0 10 0))
(setq earth (make-sphere 4))
(send earth :name "earth"))
(send earth :set-color :blue)
(send earth :assoc moon)
(send earth :locate #f(100 0 0))
(setq sun (make-sphere 20))
(send sun :name "sun")
(send sun :set-color :red)
(send sun :assoc earth)

;(setq base (make-cylinder 120 1))
;(send base :set-color :black)
;(send base :locate #f(0 0 50))
;(send base :assoc sun)

(objects (list sun earth moon))


;; DO NOT EDIT AFTER THIS LINE
;(send *unit-test* :print-result)
;(exit 1)




