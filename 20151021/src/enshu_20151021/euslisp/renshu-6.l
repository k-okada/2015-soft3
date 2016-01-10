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
(send *robot* :move-to (send *room* :spot "cook-spot") :world)
(send *robot* :locate #f(0 0 550))
(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))
(setq *mug* (send *room* :object "room73b2-mug-cup"))
(if (send *mug* :parent) (send (send *mug* :parent) :dissoc *mug*))
(send *robot* :head :look-at (send *mug* :worldpos))
(send *robot* :larm :inverse-kinematics
      (car (send *mug* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :larm :end-coords :assoc *mug*)
(send *robot* :larm :move-end-pos #f(160 -50 70) :world
      :debug-view t :look-at-target t)
(setq c (send *robot* :larm :end-coords :copy-worldcoords))
(send c :rotate (/ pi 6) :x)
(send c :rotate (/ pi -2) :z)
(send *robot* :larm :inverse-kinematics c
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis t
      :debug-view t)
(setq *kettle* (send *room* :object "room73b2-kettle"))
(if (send *kettle* :parent) (send (send *kettle* :parent) :dissoc *kettle*))
(send *robot* :head :look-at (send *kettle* :worldpos))
(send *robot* :rarm :inverse-kinematics
      (car (send *kettle* :handle))
      :link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent))
      :move-target (send *robot* :rarm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :rarm :end-coords :assoc *kettle*)
(send *robot* :rarm :move-end-pos #f(80 380 130) :world
      :debug-view t :look-at-target t)
(send *robot* :head :look-at (send *mug* :worldpos))
(setq c (send *robot* :rarm :end-coords :copy-worldcoords))
(send c :rotate (/ pi -6) :x)
(send *robot* :rarm :inverse-kinematics c
      :link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent))
      :move-target (send *robot* :rarm :end-coords)
      :rotation-axis t
      :debug-view t)

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





