#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 6)
;; ロボットや環境のモデルファイルを利用して，日常生活空間で作業するロボットのプログラムを書いてみよ．
(load "models/room73b2-scene.l")
(load "models/h7-robot.l")
(setq *room* (room73b2))
(setq *robot* (h7))
(objects (list *robot* *room*))

(send *robot* :reset-pose)
(send *robot* :move-to (send *room* :spot "broom-spot") :world)
(send *robot* :locate #f(1300 300 550))
(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))
(setq *cart* (send *room* :object "room73b2-gifuplastic-900-cart"))
(if (send *cart* :parent) (send (send *cart* :parent) :dissoc *cart*))
(send *robot* :larm :inverse-kinematics
      (car (send *cart* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :larm :end-coords :assoc *cart*)
(dotimes (i 160)
  (send *robot* :larm :move-end-pos (float-vector 0 (* -10.0 (sin (/ i 10.0))) 0) :world :debug-view t :look-at-target t)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





