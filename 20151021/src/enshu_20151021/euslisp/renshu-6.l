#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 6)
;; ロボットや環境のモデルファイルを利用して，日常生活空間で作業するロボットのプログラムを書いてみよ．

(load "models/room73b2-scene.l")
(load "models/human-robot.l")
(setq *room* (room73b2))
(setq *robot* (human))
(objects (list *robot* *room*))

(send *robot* :reset-pose)
(send *room* :spots)
(send *robot* :move-to (send *room* :spot "cook-spot") :world)
(send *robot* :locate #f(0 0 0))

(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))
(setq *knife* (send *room* :object "room73b2-knife"))
(if (send *knife* :parent) (send (send *knife* :parent) :dissoc *knife*))
;(send *robot* :head :look-at (send *knife* :worldpos))
(send *robot* :rarm :inverse-kinematics
      (car (send *knife* :handle))
      :link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent))
      :move-target (send *robot* :rarm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :rarm :end-coords :assoc *knife*)

;(do-until-key
 (send *robot* :rarm :move-end-pos #f(20 0 40) :world
       :debug-view t :look-at-target nil)
 (send *irtviewer* :draw-objects)
 (x::window-main-one)
;)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





