;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::UpdateOffset)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'UpdateOffset (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::UPDATEOFFSET")
  (make-package "JSK_PCL_ROS::UPDATEOFFSET"))
(unless (find-package "JSK_PCL_ROS::UPDATEOFFSETREQUEST")
  (make-package "JSK_PCL_ROS::UPDATEOFFSETREQUEST"))
(unless (find-package "JSK_PCL_ROS::UPDATEOFFSETRESPONSE")
  (make-package "JSK_PCL_ROS::UPDATEOFFSETRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass jsk_pcl_ros::UpdateOffsetRequest
  :super ros::object
  :slots (_transformation ))

(defmethod jsk_pcl_ros::UpdateOffsetRequest
  (:init
   (&key
    ((:transformation __transformation) (instance geometry_msgs::TransformStamped :init))
    )
   (send-super :init)
   (setq _transformation __transformation)
   self)
  (:transformation
   (&rest __transformation)
   (if (keywordp (car __transformation))
       (send* _transformation __transformation)
     (progn
       (if __transformation (setq _transformation (car __transformation)))
       _transformation)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/TransformStamped _transformation
    (send _transformation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/TransformStamped _transformation
       (send _transformation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/TransformStamped _transformation
     (send _transformation :deserialize buf ptr-) (incf ptr- (send _transformation :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::UpdateOffsetResponse
  :super ros::object
  :slots ())

(defmethod jsk_pcl_ros::UpdateOffsetResponse
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

(defclass jsk_pcl_ros::UpdateOffset
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::UpdateOffset :md5sum-) "72c98a75ad1f2a3dcf256e7c072420a2")
(setf (get jsk_pcl_ros::UpdateOffset :datatype-) "jsk_pcl_ros/UpdateOffset")
(setf (get jsk_pcl_ros::UpdateOffset :request) jsk_pcl_ros::UpdateOffsetRequest)
(setf (get jsk_pcl_ros::UpdateOffset :response) jsk_pcl_ros::UpdateOffsetResponse)

(defmethod jsk_pcl_ros::UpdateOffsetRequest
  (:response () (instance jsk_pcl_ros::UpdateOffsetResponse :init)))

(setf (get jsk_pcl_ros::UpdateOffsetRequest :md5sum-) "72c98a75ad1f2a3dcf256e7c072420a2")
(setf (get jsk_pcl_ros::UpdateOffsetRequest :datatype-) "jsk_pcl_ros/UpdateOffsetRequest")
(setf (get jsk_pcl_ros::UpdateOffsetRequest :definition-)
      "


geometry_msgs/TransformStamped transformation

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

(setf (get jsk_pcl_ros::UpdateOffsetResponse :md5sum-) "72c98a75ad1f2a3dcf256e7c072420a2")
(setf (get jsk_pcl_ros::UpdateOffsetResponse :datatype-) "jsk_pcl_ros/UpdateOffsetResponse")
(setf (get jsk_pcl_ros::UpdateOffsetResponse :definition-)
      "


geometry_msgs/TransformStamped transformation

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



(provide :jsk_pcl_ros/UpdateOffset "72c98a75ad1f2a3dcf256e7c072420a2")


