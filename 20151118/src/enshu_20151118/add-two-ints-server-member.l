#!/usr/bin/env roseus
;;;                                                                                                                                                                      
;;; euslisp version of ros_tutorials/rospy_tutorials/005_add_two_ints                                                                                                    
;;;                                                                                                                                                                      
(ros::load-ros-manifest "roseus")

;;;                                                                                                                                                                      
;;;                                                                                                                                                                      
;;;                                                                                                                                                                     

(ros::roseus "add_two_ints_server")

(defclass server-cb-class
  :super propertied-object
  :slots ())
(defmethod server-cb-class
  (:init () 
	 (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :server-cb))
  (:server-cb (req)
	      (let ((m (send req :response)))
		(ros::ros-info "Returning [~d + ~d = ~d]"
			       (send req :a) (send req :b)
			       (+ (send req :a) (send req :b)))
		(send m :sum  (+ (send req :a) (send req :b)))
		m))
)  
(setq mem (instance server-cb-class :init))
 
(do-until-key
 (ros::spin-once))
