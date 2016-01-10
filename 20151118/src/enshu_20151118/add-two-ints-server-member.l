#!/usr/bin/env roseus
;;;
;;; euslisp version of ros_tutorials/rospy_tutorials/005_add_two_ints
;;;
(ros::load-ros-manifest "roseus")

;;;
(defclass add-two-ints-member
  :super propertied-object
  :slots())
(defmethod add-two-ints-member
  (:init () (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :add-two-ints))
  (:add-two-ints (req)
    (let ((m (send req :response)))
    (format *error-output* "Returning [~d + ~d = ~d]~%"
      (send req :a) (send req :b)
      (+ (send req :a) (send req :b)))
    (send m :sum  (+ (send req :a) (send req :b)))
    m)))

;;;
;;;
(ros::roseus "add_two_ints_server")
(setq m (instance add-two-ints-member :init))
(do-until-key
 (ros::spin-once))