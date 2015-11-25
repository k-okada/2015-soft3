 #!/usr/bin/env irteusgl

 (load "lib/llib/unittest.l")
 (init-unit-test)
 (send *unit-test* :clear-result)
 ;; DO NOT EDIT BEFORE THIS LINE

;; ;; 1)
;; ;; 太陽，地球，月のモデルをつくり，太陽の周りを地球が，地球の周りを月が回っているアニメーションを作成せよ

(setq sun (make-icosahedron 8.0))
(setq sun (make-gdome sun))
(send sun :set-color :red)
(send sun :locate #f(0 0 0))

(setq moon (make-icosahedron 2.0))
(setq moon (make-gdome moon))
(send moon :set-color :white)
(send moon :locate #f(30 0 0))

(setq earth (make-icosahedron 4.0))
(setq earth (make-gdome earth))
(send earth :set-color :blue)
(send earth :locate #f(20 0 0))

(send earth :assoc moon)
(send sun :assoc earth)
(objects (list sun moon earth))
(do-until-key
 (send sun :rotate (deg2rad 5) :z)
 (send earth :rotate (deg2rad 6) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
)





(objects (list sun moon earth))


;; ;; DO NOT EDIT AFTER THIS LINE
 (send *unit-test* :print-result)
 (exit 1)




