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

(send *robot* :move-to (send *room* :spot "/eng2/7f/room73B2-far-chair-back") :world)
(send *robot* :locate #f(-600 400 550))

(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))

(setq *chair1* (send *room* :object "room73b2-chair1"))
(if (send *chair1* :parent) (send (send *chair1* :parent) :dissoc *chair1*))
(send *robot* :head :look-at (send *chair1* :worldpos))

(send *robot* :larm :inverse-kinematics
      (car (send *chair1* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

;;(send *robot* :rarm :inverse-kinematics
;;      (cdr (send *chair1* :handle))
;;      :link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent))
;;      :mobe-target (send *robot* :rarm :end-coords)
;;      :rotation-axis :x
;;      :debug-view t)


(send *robot* :larm :end-coords :assoc *chair1*)
;;(send *robot* :rarm :end-coords :assoc *chair1*)

(send *robot* :larm :move-end-pos #f(-100 0 0) :world
      :debug-view t :look-at-target t)


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





