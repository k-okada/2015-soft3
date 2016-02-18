;; call after sample2.l
(objects (list r))

(setq i 0)
(do-until-key
 (print (setq ang (float-vector (* 90 (sin (/ i 100.0))))))
 (send r :angle-vector ang)
 (send *irtviewer* :draw-objects)
 (incf i))
