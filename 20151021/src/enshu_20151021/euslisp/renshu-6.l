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
(send *irtviewer* :draw-objects)
(send *robot* :reset-pose)
(send *robot* :move-to (send *room* :spot "cook-spot") :world)
(send *robot* :locate #f(0 0 550))
(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))
(setq *cup* (send *room* :object "room73b2-mug-cup"))
(if (send *cup* :parent) (send (send *cup* :parent) :dissoc *cup*))
(send *robot* :head :look-at (send *cup* :worldpos))
(send *robot* :rarm :inverse-kinematics
      (car (send *cup* :handle))
      :link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent))
      :move-target (send *robot* :rarm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :rarm :end-coords :assoc *cup*)
(send *robot* :rarm :move-end-pos #f(0 0 100) :world
      :debug-view t :look-at-target t)
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





