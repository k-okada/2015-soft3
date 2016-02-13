;; 逆運動学による動作生成
(load "3dof-robot.l")

(setq r (instance 3dof-robot :init))
(send r :angle-vector #f(30 30 30))
;;(print (send r :link-list (send r :end-coords :parent)))
(objects (list r (send r :end-coords)))

(setq translation-axis t)
(setq rotation-axis nil)

(dotimes (i 2000)
  (setq j (send r :calc-jacobian-from-link-list (send r :link-list (send r :end-coords :parent))
		:move-target (send r :end-coords)
		:rotation-axis rotation-axis
		:translation-axis translation-axis))
  (setq j# (sr-inverse j))
  (setq c (make-cascoords :pos (float-vector (* 100 (sin (/ i 500.0))) 0 200)))
  (setq dif-pos (send (send r :end-coords) :difference-position c))
  (setq da (transform j# dif-pos))
  (send r :angle-vector (v+ (send r :angle-vector) da))
  ;;(format t "[~5A] ~A~%" i (send r :angle-vector))
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t)
)
