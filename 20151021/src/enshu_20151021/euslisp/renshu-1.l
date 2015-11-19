#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 1)
(make-irtviewer)
(setq sun (make-sphere 10))
(setq earth (make-sphere 5))
(setq moon (make-sphere 1))
(send sun :set-color :red)
(send earth :set-color :blue)
(send moon :set-color :white)
(send sun :assoc earth)
(send earth :assoc moon)
(send earth :locate #f(50 0 0))
(send moon :locate #f(10 0 0))
(objects (list sun earth moon))
(dotimes (i 100)
 (send sun :rotate (deg2rad 1) :z)
 (send earth :rotate (deg2rad 3) :z)
 (send moon :rotate (deg2rad 10) :z)
 (send *irtviewer* :draw-objects)
 (x::window-main-one))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




