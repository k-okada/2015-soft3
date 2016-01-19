;; Auto-generated. Do not edit!


(when (boundp 'dynamic_tf_publisher::SetDynamicTF)
  (if (not (find-package "DYNAMIC_TF_PUBLISHER"))
    (make-package "DYNAMIC_TF_PUBLISHER"))
  (shadow 'SetDynamicTF (find-package "DYNAMIC_TF_PUBLISHER")))
(unless (find-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTF")
  (make-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTF"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTFREQUEST")
  (make-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTFREQUEST"))
(unless (find-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTFRESPONSE")
  (make-package "DYNAMIC_TF_PUBLISHER::SETDYNAMICTFRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass dynamic_tf_publisher::SetDynamicTFRequest
  :super ros::object
  :slots (_freq _cur_tf ))

(defmethod dynamic_tf_publisher::SetDynamicTFRequest
  (:init
   (&key
    ((:freq __freq) 0.0)
    ((:cur_tf __cur_tf) (instance geometry_msgs::TransformStamped :init))
    )
   (send-super :init)
   (setq _freq (float __freq))
   (setq _cur_tf __cur_tf)
   self)
  (:freq
   (&optional __freq)
   (if __freq (setq _freq __freq)) _freq)
  (:cur_tf
   (&rest __cur_tf)
   (if (keywordp (car __cur_tf))
       (send* _cur_tf __cur_tf)
     (progn
       (if __cur_tf (setq _cur_tf (car __cur_tf)))
       _cur_tf)))
  (:serialization-length
   ()
   (+
    ;; float32 _freq
    4
    ;; geometry_msgs/TransformStamped _cur_tf
    (send _cur_tf :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _freq
       (sys::poke _freq (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/TransformStamped _cur_tf
       (send _cur_tf :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _freq
     (setq _freq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/TransformStamped _cur_tf
     (send _cur_tf :deserialize buf ptr-) (incf ptr- (send _cur_tf :serialization-length))
   ;;
   self)
  )

(defclass dynamic_tf_publisher::SetDynamicTFResponse
  :super ros::object
  :slots ())

(defmethod dynamic_tf_publisher::SetDynamicTFResponse
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

(defclass dynamic_tf_publisher::SetDynamicTF
  :super ros::object
  :slots ())

(setf (get dynamic_tf_publisher::SetDynamicTF :md5sum-) "257be6eb2c49e846d6c3c12c85bb0fb1")
(setf (get dynamic_tf_publisher::SetDynamicTF :datatype-) "dynamic_tf_publisher/SetDynamicTF")
(setf (get dynamic_tf_publisher::SetDynamicTF :request) dynamic_tf_publisher::SetDynamicTFRequest)
(setf (get dynamic_tf_publisher::SetDynamicTF :response) dynamic_tf_publisher::SetDynamicTFResponse)

(defmethod dynamic_tf_publisher::SetDynamicTFRequest
  (:response () (instance dynamic_tf_publisher::SetDynamicTFResponse :init)))

(setf (get dynamic_tf_publisher::SetDynamicTFRequest :md5sum-) "257be6eb2c49e846d6c3c12c85bb0fb1")
(setf (get dynamic_tf_publisher::SetDynamicTFRequest :datatype-) "dynamic_tf_publisher/SetDynamicTFRequest")
(setf (get dynamic_tf_publisher::SetDynamicTFRequest :definition-)
      "float32 freq
geometry_msgs/TransformStamped cur_tf

================================================================================
MSG: geometry_msgs/TransformStamped
# This expresses a transform from coordinate frame header.frame_id
# to the coordinate frame child_frame_id
#
# This message is mostly used by the 
# <a href=\"http://www.ros.org/wiki/tf\">tf</a> package. 
# See its documentation for more information.

Header header
string child_frame_id # the frame id of the child frame
Transform transform

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
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")

(setf (get dynamic_tf_publisher::SetDynamicTFResponse :md5sum-) "257be6eb2c49e846d6c3c12c85bb0fb1")
(setf (get dynamic_tf_publisher::SetDynamicTFResponse :datatype-) "dynamic_tf_publisher/SetDynamicTFResponse")
(setf (get dynamic_tf_publisher::SetDynamicTFResponse :definition-)
      "float32 freq
geometry_msgs/TransformStamped cur_tf

================================================================================
MSG: geometry_msgs/TransformStamped
# This expresses a transform from coordinate frame header.frame_id
# to the coordinate frame child_frame_id
#
# This message is mostly used by the 
# <a href=\"http://www.ros.org/wiki/tf\">tf</a> package. 
# See its documentation for more information.

Header header
string child_frame_id # the frame id of the child frame
Transform transform

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
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---

")



(provide :dynamic_tf_publisher/SetDynamicTF "257be6eb2c49e846d6c3c12c85bb0fb1")


