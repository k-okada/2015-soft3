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

(defmethod scene-model
  (:spots
   (&optional name)
   (append
    (mapcan
     #'(lambda(x)(if (derivedp x scene-model) (send x :spots name) nil))
     objs)
    (mapcan #'(lambda (O)
		(if (and (eq (class o) cascaded-coords)
			 (or (null name) (string= name (send o :name))))
		    (list o)))
	    objs)))
  (:spot
   (name)
   (let ((r (send self :spots name)))
     (case (length r)
	   (0 (warning-message 1 "could not found spot(~A)" name) nil)
	   (1 (car r))
	   (t (warning-message 1 "found multiple spot ~A for given name(~A)" r name) (car)))))
  )

(send *robot* :move-to (send *room* :spot "cook-spot") :world)
(send *robot* :locate #f(0 0 550))

(send *irtviewer* :look-all
      (geo::make-bounding-box
       (flatten (send-all (send *robot* :bodies) :vertices))))

(setq *kettle* (send *room* :object "room73b2-kettle"))
(if (send *kettle* :parent) (send (send *kettle* :parent) :dissoc *kettle*))
(send *robot* :head :look-at (send *kettle* :worldpos))

(send *robot* :larm :inverse-kinematics
      (car (send *kettle* :handle))
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

(send *robot* :larm :end-coords :assoc *kettle*)
(send *robot* :larm :move-end-pos #f(0 0 100) :world
      :debug-view t :look-at-target t)




;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





