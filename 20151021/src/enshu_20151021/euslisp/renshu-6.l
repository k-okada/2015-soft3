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

(x::window-main-one)

(send *robot* :reset-pose)
(send *robot* :move-to (send *room* :spot "/eng2/7f/room73B2-sink-front") :world)
(send *robot* :locate #f(0 0 550))

(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))

(setq *sponge* (send *room* :object "room73b2-sponge"))
(if (send *sponge* :parent) (send (send *sponge* :parent) :dissoc *sponge*))

(send *robot* :rarm :move-end-pos #f(100 0 -50) :world :debug-view t :look-at-target nil)
(send *robot* :rarm :move-end-pos #f(100 0 -50) :world :debug-view t :look-at-target nil)
(send *robot* :rarm :move-end-pos #f(30 0 -50) :world :debug-view t :look-at-target nil)
(send *robot* :rarm :move-end-pos #f(40 0 0) :world :debug-view t :look-at-target nil)
(send *robot* :locate #f(550 -200 0))
(send *robot* :head :look-at (send *sponge* :worldpos))

(send *robot* :larm :inverse-kinematics
      (make-cascoords :pos (send *sponge* :pos) :rpy (float-vector pi (/ pi 2) (/ pi 2)))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis t
      :debug-view t)

(send *robot* :larm :end-coords :assoc *sponge*)

(dotimes (i 120)
  (cond ((> i 60)
	 (send *robot* :larm :move-end-pos #f(0 1 0) :world :debug-view t :look-at-target t))
	(t
	 (send *robot* :larm :move-end-pos #f(0 -1 0) :world :debug-view t :look-at-target t))))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





