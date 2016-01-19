;; Auto-generated. Do not edit!


(when (boundp 'dynamic_tf_publisher::AssocTF)
  (if (not (find-package "DYNAMIC_TF_PUBLISHER"))
    (make-package "DYNAMIC_TF_PUBLISHER"))
  (shadow 'AssocTF (find-package "DYNAMIC_TF_PUBLISHER")))
(unless (find-package "DYNAMIC_TF_PUBLISHER::ASSOCTF")
  (make-package "DYNAMIC_TF_PUBLISHER::ASSOCTF"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::ASSOCTFREQUEST")
  (make-package "DYNAMIC_TF_PUBLISHER::ASSOCTFREQUEST"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::ASSOCTFRESPONSE")
  (make-package "DYNAMIC_TF_PUBLISHER::ASSOCTFRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass dynamic_tf_publisher::AssocTFRequest
  :super ros::object
  :slots (_header _parent_frame _child_frame ))

(defmethod dynamic_tf_publisher::AssocTFRequest
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:parent_frame __parent_frame) "")
    ((:child_frame __child_frame) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _parent_frame (string __parent_frame))
   (setq _child_frame (string __child_frame))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:parent_frame
   (&optional __parent_frame)
   (if __parent_frame (setq _parent_frame __parent_frame)) _parent_frame)
  (:child_frame
   (&optional __child_frame)
   (if __child_frame (setq _child_frame __child_frame)) _child_frame)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _parent_frame
    4 (length _parent_frame)
    ;; string _child_frame
    4 (length _child_frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _parent_frame
       (write-long (length _parent_frame) s) (princ _parent_frame s)
     ;; string _child_frame
       (write-long (length _child_frame) s) (princ _child_frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _parent_frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _parent_frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _child_frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _child_frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass dynamic_tf_publisher::AssocTFResponse
  :super ros::object
  :slots ())

(defmethod dynamic_tf_publisher::AssocTFResponse
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

(defclass dynamic_tf_publisher::AssocTF
  :super ros::object
  :slots ())

(setf (get dynamic_tf_publisher::AssocTF :md5sum-) "984a9f3f6741b2b5568909b82fec6355")
(setf (get dynamic_tf_publisher::AssocTF :datatype-) "dynamic_tf_publisher/AssocTF")
(setf (get dynamic_tf_publisher::AssocTF :request) dynamic_tf_publisher::AssocTFRequest)
(setf (get dynamic_tf_publisher::AssocTF :response) dynamic_tf_publisher::AssocTFResponse)

(defmethod dynamic_tf_publisher::AssocTFRequest
  (:response () (instance dynamic_tf_publisher::AssocTFResponse :init)))

(setf (get dynamic_tf_publisher::AssocTFRequest :md5sum-) "984a9f3f6741b2b5568909b82fec6355")
(setf (get dynamic_tf_publisher::AssocTFRequest :datatype-) "dynamic_tf_publisher/AssocTFRequest")
(setf (get dynamic_tf_publisher::AssocTFRequest :definition-)
      "Header  header
string         parent_frame
string         child_frame

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

(setf (get dynamic_tf_publisher::AssocTFResponse :md5sum-) "984a9f3f6741b2b5568909b82fec6355")
(setf (get dynamic_tf_publisher::AssocTFResponse :datatype-) "dynamic_tf_publisher/AssocTFResponse")
(setf (get dynamic_tf_publisher::AssocTFResponse :definition-)
      "Header  header
string         parent_frame
string         child_frame

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



(provide :dynamic_tf_publisher/AssocTF "984a9f3f6741b2b5568909b82fec6355")


