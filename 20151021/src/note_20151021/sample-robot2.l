(if (not (boundp '*irtviewer*)) (make-irtviewer))

(load "demo/sample-arm-model.l")
(load "irteus/pqp.l")

(defmethod sarmclass
  (:solve-ik (target &key debug-view)
	     (send self :inverse-kinematics target
		   :link-list (send *sarm* :link-list (send *sarm* :end-coords :parent))
		   :move-target (send *sarm* :end-coords)
		   :translation-axis t
		   :rotation-axis t
		   :debug-view debug-view
		   )
	     )
)

(setq *sarm* (instance sarmclass :init))
(send *sarm* :reset-pose)
;(send *sarm* :make-pqpmodel)
;(send (send *sarm* :joint-fl :child-link) :make-pqpmodel)
;(send (send *sarm* :joint-fr :child-link) :make-pqpmodel)
(setq *target* (instance bodyset-link :init (make-cascoords) :bodies (list (make-sphere 30))))
(send *target* :locate #f(350 200 400))
;(send *target* :make-pqpmodel)
;(send *target* :make-pqpmodel)
(objects (list *sarm* *target*))

(send *sarm* :solve-ik *target*)
(setq a (send *sarm* :open-hand))
(do-until-key)
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
(do-until-key)
(dotimes (i 100)
  (send *sarm* :joint0 :joint-angle 1 :relative t)
  (send *irtviewer* :draw-objects))
(send *sarm* :end-coords :dissoc *target*)
(dotimes (i 100)
  (send *sarm* :joint0 :joint-angle -1 :relative t)
  (send *irtviewer* :draw-objects))
(setq time 0)
(do-until-key
 (setq time (+ time 0.1))
 (send *target* :locate (scale 0.1 (send *target* :spacial-velocity)))
 (print (send *target* :pos))
 (send *target* :spacial-velocity (v+ (send *target* :spacial-velocity) (scale 0.1 #f(0 0 -9.8))))
(if (> time 10) (progn
		   (send *target* :locate #f(0 0 1000))
		   (setq time 0)))
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
 (unix::usleep 100)
)
