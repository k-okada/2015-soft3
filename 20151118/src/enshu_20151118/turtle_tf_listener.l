#!/usr/bin/env roseus

(ros::load-ros-manifest "tf")
(ros::roseus "tf-turtle")
(setq listener (instance ros::transform-listener :init))

(ros::rate 10)
(while (ros::ok) (setq c (send listener :lookup-transform "/turtle2" "/turtle1"(ros::time 0)))
       (when c
	 (setq trans (scale 0.001 (send c :worldpos))) ;;mm -> m
	 (setq angular (* 4 (atan2 (elt trans 1) (elt trans 0)))
	       linear (* 0.5 (sqrt (+ (* (elt trans 2) (elt trans 2))
			       (* (elt trans 1) (elt trans 1))))))
	 (ros::ros-info "angular = ~f, linear = ~f" angular linear)
	 )
       (ros::sleep))
