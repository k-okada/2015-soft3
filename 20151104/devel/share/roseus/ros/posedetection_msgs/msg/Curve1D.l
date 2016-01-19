;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::Curve1D)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'Curve1D (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::CURVE1D")
  (make-package "POSEDETECTION_MSGS::CURVE1D"))

(in-package "ROS")
;;//! \htmlinclude Curve1D.msg.html


(defclass posedetection_msgs::Curve1D
  :super ros::object
  :slots (_pts ))

(defmethod posedetection_msgs::Curve1D
  (:init
   (&key
    ((:pts __pts) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _pts __pts)
   self)
  (:pts
   (&optional __pts)
   (if __pts (setq _pts __pts)) _pts)
  (:serialization-length
   ()
   (+
    ;; float32[] _pts
    (* 4    (length _pts)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pts
     (write-long (length _pts) s)
     (dotimes (i (length _pts))
       (sys::poke (elt _pts i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pts i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get posedetection_msgs::Curve1D :md5sum-) "e5367ca89dc9a58670f8f288e2c52f5d")
(setf (get posedetection_msgs::Curve1D :datatype-) "posedetection_msgs/Curve1D")
(setf (get posedetection_msgs::Curve1D :definition-)
      "float32[] pts # 2xN points in the image

")



(provide :posedetection_msgs/Curve1D "e5367ca89dc9a58670f8f288e2c52f5d")


