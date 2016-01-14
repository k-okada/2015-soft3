(if (not (boundp '*irtviewer*)) (make-irtviewer))

(setq sun (make-sphere 100))
(send sun :set-color :red)

(setq earth (make-sphere 10))
(send earth :set-color :blue)

(setq moon (make-sphere 2))
(send moon :set-color :yellow)

(send earth :locate #f(200 0 0))

(send sun :assoc earth)
(send earth :assoc moon)
(send moon :locate #f(250 0 0))

(objects (list sun earth moon))

(do-until-key
 (send sun :rotate (deg2rad 5) :z)
 (send earth :rotate (deg2rad 10) :z)
 (send *irtviewer* :draw-objects)
)
