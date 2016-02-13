;; 逆運動学による動作生成
(load "3dof-robot.l")

(setq r (instance 3dof-robot :init))
(send r :angle-vector #f(30 30 30))
;;(print (send r :link-list (send r :end-coords :parent)))
(objects (list r (send r :end-coords)))

(dotimes (i 100)
  (setq j (send r :calc-jacobian-from-link-list (send r :link-list (send r :end-coords :parent))
		:move-target (send r :end-coords)
		:rotation-axis t
		:translation-axis t))
  (setq j# (sr-inverse j))
  (setq da (transform j# #f(1 0 0 0 0 0)))
  (send r :angle-vector (v+ (send r :angle-vector) da))
  ;;(format t "[~5A] ~A~%" i (send r :angle-vector))
  (send *irtviewer* :draw-objects)
)