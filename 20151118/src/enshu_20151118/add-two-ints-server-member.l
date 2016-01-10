#!/usr/bin/env roseus
;;;
;;; euslisp version of ros_tutorials/rospy_tutorials/005_add_two_ints
;;;
(ros::load-ros-manifest "roseus")

;;;
(defclass add-cb-class
  :super propertied-object
  :slots ())

(defmethod add-cb-class
  (:init () (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :add-cb))
  (:add-cb (req) 
		    (let ((m (send req :response)))
		      (ros::ros-info "Returning [~d + ~d = ~d]"
				     (send req :a) (send req :b)
				     (+ (send req :a) (send req :b)))
		      (send m :sum  (+ (send req :a) (send req :b)))
		      m)))



;;;
;;;
(ros::roseus "add_two_ints_server")
(setq m (instance add-cb-class :init))
(do-until-key (ros::spin-once))
