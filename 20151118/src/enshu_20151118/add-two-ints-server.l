#!/usr/bin/env roseus
;;;
;;; euslisp version of ros_tutorials/rospy_tutorials/005_add_two_ints
;;;
(ros::load-ros-manifest "roseus")

;;;
(defun add-two-ints (req)
  (let ((m (send req :response)))
    (format *error-output* "Returning [~d + ~d = ~d]~%"
            (send req :a) (send req :b)
            (+ (send req :a) (send req :b)))
    (send m :sum  (+ (send req :a) (send req :b)))
    m))

#'(lambda (req)
    (let ((m (send req :response)))
      (format *error-output* "Returning [~d + ~d = ~d]~%"
              (send req :a) (send req :b)
              (+ (send req :a) (send req :b)))
      (send m :sum (+ (send req :a) (send req :b)))
      m))

(defmethod add-two-ints-memb
  (:init
   ()
   (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :add-two-ints))
  (:add-two-ints (req)
                 (let ((m (send req :response)))
                   (format *error-output* "Returning [~d + ~d = ~d]~%"
                           (send req :a) (send req :b)
                           (+ (send req :a) (send req :b)))
                   (send m :sum (+ (send req :a) (send req :b)))
                   m)))

(setq *memb* (instance add-two-ints-class :init))

;;;
;;;
(ros::roseus "add_two_ints_server")
(ros::advertise-service "add_two_ints" roseus::AddTwoInts #'add-two-ints)
(do-until-key
 (ros::spin-once))




