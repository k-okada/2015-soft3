(print (list
	(setq c1 (instance cascaded-coords :init))
	(send c1 :locate #f(1 2 3))
	(send c1 :worldpos)
	(send c1 :worldrot)
	
	(setq c2 (instance cascaded-coords :init))
	(send c2 :assoc c1)
	(send c2 :rotate (deg2rad 45) :z)
	
	(send c1 :worldpos)
	(send c1 :worldrot)
	
	(send c2 :worldpos)
	(send c2 :worldrot)
))
	