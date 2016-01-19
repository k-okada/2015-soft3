;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::Feature1D)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'Feature1D (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::FEATURE1D")
  (make-package "POSEDETECTION_MSGS::FEATURE1D"))

(in-package "ROS")
;;//! \htmlinclude Feature1D.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass posedetection_msgs::Feature1D
  :super ros::object
  :slots (_header _lines _descriptors _confidences _descriptor_dim ))

(defmethod posedetection_msgs::Feature1D
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lines __lines) (let (r) (dotimes (i 0) (push (instance posedetection_msgs::Curve1D :init) r)) r))
    ((:descriptors __descriptors) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidences __confidences) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:descriptor_dim __descriptor_dim) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lines __lines)
   (setq _descriptors __descriptors)
   (setq _confidences __confidences)
   (setq _descriptor_dim (round __descriptor_dim))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lines
   (&rest __lines)
   (if (keywordp (car __lines))
       (send* _lines __lines)
     (progn
       (if __lines (setq _lines (car __lines)))
       _lines)))
  (:descriptors
   (&optional __descriptors)
   (if __descriptors (setq _descriptors __descriptors)) _descriptors)
  (:confidences
   (&optional __confidences)
   (if __confidences (setq _confidences __confidences)) _confidences)
  (:descriptor_dim
   (&optional __descriptor_dim)
   (if __descriptor_dim (setq _descriptor_dim __descriptor_dim)) _descriptor_dim)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; posedetection_msgs/Curve1D[] _lines
    (apply #'+ (send-all _lines :serialization-length)) 4
    ;; float32[] _descriptors
    (* 4    (length _descriptors)) 4
    ;; float32[] _confidences
    (* 4    (length _confidences)) 4
    ;; int32 _descriptor_dim
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; posedetection_msgs/Curve1D[] _lines
     (write-long (length _lines) s)
     (dolist (elem _lines)
       (send elem :serialize s)
       )
     ;; float32[] _descriptors
     (write-long (length _descriptors) s)
     (dotimes (i (length _descriptors))
       (sys::poke (elt _descriptors i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _confidences
     (write-long (length _confidences) s)
     (dotimes (i (length _confidences))
       (sys::poke (elt _confidences i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _descriptor_dim
       (write-long _descriptor_dim s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; posedetection_msgs/Curve1D[] _lines
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lines (let (r) (dotimes (i n) (push (instance posedetection_msgs::Curve1D :init) r)) r))
     (dolist (elem- _lines)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32[] _descriptors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descriptors (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _descriptors i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _confidences
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidences (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidences i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _descriptor_dim
     (setq _descriptor_dim (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get posedetection_msgs::Feature1D :md5sum-) "4568f21f2dd0840ca2d658d4d1710f33")
(setf (get posedetection_msgs::Feature1D :datatype-) "posedetection_msgs/Feature1D")
(setf (get posedetection_msgs::Feature1D :definition-)
      "Header header
Curve1D[] lines # N, 0-indexed
float32[] descriptors # N*descriptor_dim
float32[] confidences # optional
int32 descriptor_dim

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: posedetection_msgs/Curve1D
float32[] pts # 2xN points in the image

")



(provide :posedetection_msgs/Feature1D "4568f21f2dd0840ca2d658d4d1710f33")


