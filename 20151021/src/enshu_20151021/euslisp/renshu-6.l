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
(objects (list *room* *robot*))
(setq *cook-spot*  (send *room* :spot "cook-spot"))
(send *robot* :reset-pose)
(send *robot* :fix-leg-to-coords *cook-spot* :both)
(setq *kettle* (send *room* :object "room73b2-kettle"))
(send (send *kettle* :parent) :dissoc *kettle*)
(send *kettle* :rotate (deg2rad 180) :z)
(setq *cup* (send *room* :object "room73b2-cup")))
(send (send *cup* :parent) :dissoc *cup*)
(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))


(send *robot* :larm :inverse-kinematics (car (send *kettle* :handle)) 
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent)) 	:move-target (send *robot* :larm :end-coords) 
      :rotation-axis :z
      :debug-view t)
(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))
(send *robot* :larm :end-coords :assoc *kettle*)
  (send *robot* :larm :move-end-pos #f(-100 0 100) :world :debug-view t :look-at-target t :rotation-axis :z)

  (dotimes (i 14)
    (move_right 100)
    (send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices)))))
  (send *robot* :rarm :inverse-kinematics (car (send *cup* :handle)) 
	:link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent)) 	:move-target (send *robot* :rarm :end-coords) 
	:rotation-axis :z
	:debug-view t)
  
  (send *robot* :rarm :inverse-kinematics (car (send *cup* :handle)) 
	:link-list (send *robot* :link-list (send *robot* :rarm :end-coords :parent)) 	:move-target (send *robot* :rarm :end-coords) 
	:rotation-axis :z
	:debug-view t)
  (send *robot* :rarm :end-coords :assoc *cup*)
  (send *robot* :rarm :move-end-pos #f(0 0 100) :world :debug-view t :look-at-target t)
  (dotimes (i 3)
    (move_left 100)
    (send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices)))))
  (dotimes (i 2) 
     (move_front 100)
     (send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices)))))
  (send *robot* :rarm :move-end-pos #f(-90 -140 -110) :world :debug-view t :look-at-target t)
  (dotimes (i 10)
    (send *robot* :larm :move-end-rot -30 :x :world :debug-view t :rotation-axis t)
    (send *robot* :larm :move-end-rot 30 :x :world :debug-view t :rotation-axis t)
    (send *robot* :rarm :move-end-pos #f(0 150 0) :world :debug-view t :look-at-target t)
    (send *robot* :rarm :move-end-rot 180 :x :world :debug-view t :rotation-axis t)
    (send *robot* :rarm :move-end-rot -180 :x :world :debug-view t :rotation-axis t)
    (send *robot* :rarm :move-end-pos #f(0 -150 0) :world :debug-view t :look-at-target t)
    )
  




(defun move_front (speed)
  (move_centroid 0.5 0)
  (move_rleg #f(100 0  100) speed)
  (move_rleg #f(0 0 -100) speed)
  (move_centroid 0 1)
  (move_lleg #f(100 0  100) speed)
  (move_lleg #f(0 0 -100) speed)
  (move_centroid 1 0.5)
)

(defun move_right (speed)
  (move_centroid 0.5 0)
  (move_rleg #f(0 -100  100) speed)
  (move_rleg #f(0 0 -100) speed)
  (move_centroid 0 1)
  (move_lleg #f(0 -100 100) speed)
  (move_lleg #f(0 0 -100) speed)
  (move_centroid 1 0.5)
)

(defun move_left (speed)
  (move_centroid 0.5 1)
  (move_lleg #f(0 100  100) speed)
  (move_lleg #f(0 0 -100) speed)
  (move_centroid 1 0)
  (move_rleg #f(0 100 100) speed)
  (move_rleg #f(0 0 -100) speed)
  (move_centroid 0 0.5)
)

(defun move_rleg (pos speed)
  (setq dist (distance #f(0 0 0) pos))
  (setq dividenum (floor (/ dist speed)))
  (setq step (scale (/ 1.0 dividenum) pos))
  (dotimes (i dividenum)
    (send *robot* :rleg :move-end-pos step)
    (send *robot* :move-centroid-on-foot :both '(:lleg :rleg) :mid 0)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    )
)
(defun move_lleg (pos speed)
  (setq dist (distance #f(0 0 0) pos))
  (setq dividenum (floor (/ dist speed)))
  (setq step (scale (/ 1.0 dividenum) pos))
  (dotimes (i dividenum)
    (send *robot* :lleg :move-end-pos step)
    (send *robot* :move-centroid-on-foot :both '(:lleg :rleg) :mid 1)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    )
)
(defun move_centroid (start end)
  ;1:右　0:左
  (if (> end start)
      (setq step 0.25)
    (setq step -0.25)
    )
  (setq mid (+ start step))
  (while (< 0.05 (abs (- end mid)))
    (send *robot* :move-centroid-on-foot :both '(:lleg :rleg) :mid mid)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
    (setq mid (+ mid step))
    )
)


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
;(exit 1)





