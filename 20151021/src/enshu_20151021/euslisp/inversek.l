(setq c (make-cascoords :pos #f(150 0 0) :rpy (float-vector 0 pi 0)))
(send r :inverse-kinematics c
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:translation-axis t
	:rotation-axis nil
	:debug-view t)
