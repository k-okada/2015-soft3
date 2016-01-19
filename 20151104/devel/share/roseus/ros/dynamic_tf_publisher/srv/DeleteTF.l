;; Auto-generated. Do not edit!


(when (boundp 'dynamic_tf_publisher::DeleteTF)
  (if (not (find-package "DYNAMIC_TF_PUBLISHER"))
    (make-package "DYNAMIC_TF_PUBLISHER"))
  (shadow 'DeleteTF (find-package "DYNAMIC_TF_PUBLISHER")))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DELETETF")
  (make-package "DYNAMIC_TF_PUBLISHER::DELETETF"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DELETETFREQUEST")
  (make-package "DYNAMIC_TF_PUBLISHER::DELETETFREQUEST"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DELETETFRESPONSE")
  (make-package "DYNAMIC_TF_PUBLISHER::DELETETFRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass dynamic_tf_publisher::DeleteTFRequest
  :super ros::object
  :slots (_header ))

(defmethod dynamic_tf_publisher::DeleteTFRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    )
   (send-super :init)
   (setq _header __header)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;;
   self)
  )

(defclass dynamic_tf_publisher::DeleteTFResponse
  :super ros::object
  :slots ())

(defmethod dynamic_tf_publisher::DeleteTFResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass dynamic_tf_publisher::DeleteTF
  :super ros::object
  :slots ())

(setf (get dynamic_tf_publisher::DeleteTF :md5sum-) "d7be0bb39af8fb9129d5a76e6b63a290")
(setf (get dynamic_tf_publisher::DeleteTF :datatype-) "dynamic_tf_publisher/DeleteTF")
(setf (get dynamic_tf_publisher::DeleteTF :request) dynamic_tf_publisher::DeleteTFRequest)
(setf (get dynamic_tf_publisher::DeleteTF :response) dynamic_tf_publisher::DeleteTFResponse)

(defmethod dynamic_tf_publisher::DeleteTFRequest
  (:response () (instance dynamic_tf_publisher::DeleteTFResponse :init)))

(setf (get dynamic_tf_publisher::DeleteTFRequest :md5sum-) "d7be0bb39af8fb9129d5a76e6b63a290")
(setf (get dynamic_tf_publisher::DeleteTFRequest :datatype-) "dynamic_tf_publisher/DeleteTFRequest")
(setf (get dynamic_tf_publisher::DeleteTFRequest :definition-)
      "Header  header

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
---

")

(setf (get dynamic_tf_publisher::DeleteTFResponse :md5sum-) "d7be0bb39af8fb9129d5a76e6b63a290")
(setf (get dynamic_tf_publisher::DeleteTFResponse :datatype-) "dynamic_tf_publisher/DeleteTFResponse")
(setf (get dynamic_tf_publisher::DeleteTFResponse :definition-)
      "Header  header

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
---

")



(provide :dynamic_tf_publisher/DeleteTF "d7be0bb39af8fb9129d5a76e6b63a290")


