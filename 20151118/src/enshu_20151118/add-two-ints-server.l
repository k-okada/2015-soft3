#!/usr/bin/env roseus
;;;
;;; euslisp version of ros_tutorials/rospy_tutorials/005_add_two_ints
;;;
(ros::load-ros-manifest "roseus")
(ros::roseus "add_two_ints_server")

;;; call-back function
;(defun add-two-ints (req)
;  (let ((m (send req :response)))
;    (format *error-output* "Returning [~d + ~d = ~d]~%"
;            (send req :a) (send req :b)
;            (+ (send req :a) (send req :b)))
;    (send m :sum  (+ (send req :a) (send req :b)))
;    m))
;(ros::advertise-service "add_two_ints" roseus::AddTwoInts #'add-two-ints)

;;;lambda function 
;(ros::advertise-service "add_two_ints" roseus::AddTwoInts 
;                        #'(lambda (msg)
;                            (let ((m (send msg :response)))
;                              (format *error-output* "Returning [~d + ~d = ~d]~%"
;                                      (send msg :a) (send msg :b)
;                                      (+ (send msg :a) (send msg :b)))
;                              (send m :sum  (+ (send msg :a) (send msg :b)))
;                              m))
;                        )

(defclass add-two-ints-class
  :super propertied-object
  :slots ())
(defmethod add-two-ints-class
  (:init ()
         (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :add-two-ints))
  (:add-two-ints (msg)
                 (let ((m (send msg :response)))
                   (format *error-output* "Returning [~d + ~d = ~d]~%"
                           (send msg :a) (send msg :b)
                           (+ (send msg :a) (send msg :b)))
                   (send m :sum  (+ (send msg :a) (send msg :b)))
                   m)))
(setq m (instance add-two-ints-class :init))

(do-until-key
  (ros::spin-once))




