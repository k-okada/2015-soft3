(load "3dof-robot.l")
(setq r (instance 3dof-robot :init))
(objects (list r (send r :end-coords)))

(setq c (make-cascoords :pos #f(150 0 0) :rpy (float-vector 0 pi 0)))
(send r :inverse-kinematics c
      :link-list (send r :link-list (send r :end-coords :parent))
      :move-target (send r :end-coords)
      :transloation-axis t
      :rotation-axis t
      :debug-view t)
