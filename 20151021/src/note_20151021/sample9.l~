;; 逆運動学が失敗するサンプル
(load "3dof-robot.l")
(setq r (instance 3dof-robot :init))
(objects (list r (send r :end-coords)))

(dotimes (i 400)
  (setq c (make-cascoords
	   :pos (float-vector (+ 150 (* 50 (sin (/ i 100.0)))) 0 0)
	   :rpy (float-vector 0 pi 0)))
  (send r :inverse-kinematics c
	:link-list (send r :link-list (send r :end-coords :parent))
	:move-target (send r :end-coords)
	:transloation-axis t
	:rotation-axis t)
  (x::window-main-one)
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t)
)
