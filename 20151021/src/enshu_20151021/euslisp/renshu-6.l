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
(send *robot* :locate #f(2700 0 550))
(send *robot* :rotate (/ -pi 2) :z)
(send *robot* :locate #f(300 0 0))
(setq *cart* (send *room* :object "room73b2-gifuplastic-900-cart"))
(send (send *cart* :parent) :dissoc *cart*)
(send *robot* :larm :inverse-kinematics
      (car (send *cart* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)
(send *robot* :larm :end-coords :assoc *cart*)
(dotimes (i 500)
  (send *robot* :translate #f(1 0 0))
  (send *irtviewer* :draw-objects))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





