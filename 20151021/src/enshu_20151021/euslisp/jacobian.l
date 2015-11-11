(dotimes (i 100)
  (setq j (send r :calc-jacobian-from-link-list
				(send r :link-list (send r :end-coords :parent))
				:move-target (send r :end-coords)
				:rotation-axis t
				:translation-axis t))
  (setq j# (sr-inverse j))
  (setq da (transform j# #f(1 0 0 0 0 0)))
  (send r :angle-vector (v+ (send r :angle-vector) da))
  (send *irtviewer* :draw-objects))
