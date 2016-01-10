(if (not (boundp '*irtviewer*)) (make-irtviewer))

(setq pa (make-cascoords :pos #f(0 400 1600)))
(setq ph (make-cascoords :pos #f(0 400 1000)))
(send pa :assoc ph)
(objects (list pa ph *world-coords*))
(send pa :rotate (deg2rad 45) :x)

(do ((i 0 (+ i 0.1)))
	((> i 45))
	(send pa :orient (deg2rad i) :x :world)
	(send *irtviewer* :draw-objects))
