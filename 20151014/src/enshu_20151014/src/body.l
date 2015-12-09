(print (list
	(setq b1 (make-cube 100 100 30))
	(setq b2 (make-cube 30 40 100))
	(send b2 :rotate (deg2rad 30) :x)
	(setq b3 (body+ b1 b2))
	(send b3 :set-color :red)
	(make-irtviewer)
	(objects (list b3))
	(setq b4 (body- b2 b1))
	(send b4 :set-color :green)
	(objects (list b4))
))

