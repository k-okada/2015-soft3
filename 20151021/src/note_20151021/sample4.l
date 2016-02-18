(load "3dof-robot.l")

(setq r (instance 3dof-robot :init))
(objects (list r))
(send r :angle-vector #f(30 30 30))
(send *irtviewer* :draw-objects)

(send (send r :end-coords) :draw-on :flush t)

(objects (list r (send r :end-coords)))
