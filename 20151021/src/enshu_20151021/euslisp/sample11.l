(load "irteus/demo/sample-arm-model.l")
(if (not (boundp '*irtviewer*)) (make-irtviewer))

#|
(send *sarm* :solve-ik *target* :debug-view t)
(while (> a 0)
	(if (pqp-collision-check-objects
		(list (send *sarm* :joint-fr :child-link)
			(send *sarm* :joint-fl :child-link))
		(list *target*))
		(return))
	(decf a 0.1)
	(send *irtviewer* :draw-objects)
	(send *sarm* :move-fingers a))
(send *sarm* :end-coords :assoc *target*)

(dotimes (i 100)
	(send *sarm* :joint0 :joint-angle 1 :relative t)
	(send *irtviewer* :draw-objects))
(send *sarm* :end-coords :dissoc *target*)
(dotimes (i 100)
	(send *sarm* :joint0 :joint-angle -1 :relative t)
	(send *irtviewer* :draw-objects))
 |#