;; Auto-generated. Do not edit!


(when (boundp 'dynamic_tf_publisher::DissocTF)
  (if (not (find-package "DYNAMIC_TF_PUBLISHER"))
    (make-package "DYNAMIC_TF_PUBLISHER"))
  (shadow 'DissocTF (find-package "DYNAMIC_TF_PUBLISHER")))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DISSOCTF")
  (make-package "DYNAMIC_TF_PUBLISHER::DISSOCTF"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DISSOCTFREQUEST")
  (make-package "DYNAMIC_TF_PUBLISHER::DISSOCTFREQUEST"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::DISSOCTFRESPONSE")
  (make-package "DYNAMIC_TF_PUBLISHER::DISSOCTFRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass dynamic_tf_publisher::DissocTFRequest
  :super ros::object
  :slots (_header _frame_id ))

(defmethod dynamic_tf_publisher::DissocTFRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:frame_id __frame_id) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _frame_id (string __frame_id))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _frame_id
    4 (length _frame_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass dynamic_tf_publisher::DissocTFResponse
  :super ros::object
  :slots ())

(defmethod dynamic_tf_publisher::DissocTFResponse
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

(defclass dynamic_tf_publisher::DissocTF
  :super ros::object
  :slots ())

(setf (get dynamic_tf_publisher::DissocTF :md5sum-) "5fa93cf9f65be2325fa0008ddcc90131")
(setf (get dynamic_tf_publisher::DissocTF :datatype-) "dynamic_tf_publisher/DissocTF")
(setf (get dynamic_tf_publisher::DissocTF :request) dynamic_tf_publisher::DissocTFRequest)
(setf (get dynamic_tf_publisher::DissocTF :response) dynamic_tf_publisher::DissocTFResponse)

(defmethod dynamic_tf_publisher::DissocTFRequest
  (:response () (instance dynamic_tf_publisher::DissocTFResponse :init)))

(setf (get dynamic_tf_publisher::DissocTFRequest :md5sum-) "5fa93cf9f65be2325fa0008ddcc90131")
(setf (get dynamic_tf_publisher::DissocTFRequest :datatype-) "dynamic_tf_publisher/DissocTFRequest")
(setf (get dynamic_tf_publisher::DissocTFRequest :definition-)
      "Header  header
string         frame_id

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

(setf (get dynamic_tf_publisher::DissocTFResponse :md5sum-) "5fa93cf9f65be2325fa0008ddcc90131")
(setf (get dynamic_tf_publisher::DissocTFResponse :datatype-) "dynamic_tf_publisher/DissocTFResponse")
(setf (get dynamic_tf_publisher::DissocTFResponse :definition-)
      "Header  header
string         frame_id

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



(provide :dynamic_tf_publisher/DissocTF "5fa93cf9f65be2325fa0008ddcc90131")


