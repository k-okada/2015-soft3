;; call after sample2.l
(objects (list r))
(dotimes (i 300)
  (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects))
