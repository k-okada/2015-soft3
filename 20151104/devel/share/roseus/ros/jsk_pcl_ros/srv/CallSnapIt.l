;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::CallSnapIt)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'CallSnapIt (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::CALLSNAPIT")
  (make-package "JSK_PCL_ROS::CALLSNAPIT"))
(unless (find-package "JSK_PCL_ROS::CALLSNAPITREQUEST")
  (make-package "JSK_PCL_ROS::CALLSNAPITREQUEST"))
(unless (find-package "JSK_PCL_ROS::CALLSNAPITRESPONSE")
  (make-package "JSK_PCL_ROS::CALLSNAPITRESPONSE"))

(in-package "ROS")

(if (not (find-package "JSK_RECOGNITION_MSGS"))
  (ros::roseus-add-msgs "jsk_recognition_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass jsk_pcl_ros::CallSnapItRequest
  :super ros::object
  :slots (_request ))

(defmethod jsk_pcl_ros::CallSnapItRequest
  (:init
   (&key
    ((:request __request) (instance jsk_recognition_msgs::SnapItRequest :init))
    )
   (send-super :init)
   (setq _request __request)
   self)
  (:request
   (&rest __request)
   (if (keywordp (car __request))
       (send* _request __request)
     (progn
       (if __request (setq _request (car __request)))
       _request)))
  (:serialization-length
   ()
   (+
    ;; jsk_recognition_msgs/SnapItRequest _request
    (send _request :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; jsk_recognition_msgs/SnapItRequest _request
       (send _request :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; jsk_recognition_msgs/SnapItRequest _request
     (send _request :deserialize buf ptr-) (incf ptr- (send _request :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::CallSnapItResponse
  :super ros::object
  :slots (_transformation ))

(defmethod jsk_pcl_ros::CallSnapItResponse
  (:init
   (&key
    ((:transformation __transformation) (instance geometry_msgs::Pose :init))
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
    ;; geometry_msgs/Pose _transformation
    (send _transformation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _transformation
       (send _transformation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _transformation
     (send _transformation :deserialize buf ptr-) (incf ptr- (send _transformation :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::CallSnapIt
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::CallSnapIt :md5sum-) "00529f1ccb0137f3a14b6d5b281f9a3c")
(setf (get jsk_pcl_ros::CallSnapIt :datatype-) "jsk_pcl_ros/CallSnapIt")
(setf (get jsk_pcl_ros::CallSnapIt :request) jsk_pcl_ros::CallSnapItRequest)
(setf (get jsk_pcl_ros::CallSnapIt :response) jsk_pcl_ros::CallSnapItResponse)

(defmethod jsk_pcl_ros::CallSnapItRequest
  (:response () (instance jsk_pcl_ros::CallSnapItResponse :init)))

(setf (get jsk_pcl_ros::CallSnapItRequest :md5sum-) "00529f1ccb0137f3a14b6d5b281f9a3c")
(setf (get jsk_pcl_ros::CallSnapItRequest :datatype-) "jsk_pcl_ros/CallSnapItRequest")
(setf (get jsk_pcl_ros::CallSnapItRequest :definition-)
      "jsk_recognition_msgs/SnapItRequest request

================================================================================
MSG: jsk_recognition_msgs/SnapItRequest
Header header
uint8 MODEL_PLANE=0
uint8 MODEL_CYLINDER=1
uint8 model_type

geometry_msgs/PolygonStamped target_plane

geometry_msgs/PointStamped center
geometry_msgs/Vector3Stamped direction
float64 radius
float64 height
# parameters, 0 means 
float64 max_distance
float64 eps_angle

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
MSG: geometry_msgs/PolygonStamped
# This represents a Polygon with reference coordinate frame and timestamp
Header header
Polygon polygon

================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
---
geometry_msgs/Pose transformation


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of postion and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
")

(setf (get jsk_pcl_ros::CallSnapItResponse :md5sum-) "00529f1ccb0137f3a14b6d5b281f9a3c")
(setf (get jsk_pcl_ros::CallSnapItResponse :datatype-) "jsk_pcl_ros/CallSnapItResponse")
(setf (get jsk_pcl_ros::CallSnapItResponse :definition-)
      "jsk_recognition_msgs/SnapItRequest request

================================================================================
MSG: jsk_recognition_msgs/SnapItRequest
Header header
uint8 MODEL_PLANE=0
uint8 MODEL_CYLINDER=1
uint8 model_type

geometry_msgs/PolygonStamped target_plane

geometry_msgs/PointStamped center
geometry_msgs/Vector3Stamped direction
float64 radius
float64 height
# parameters, 0 means 
float64 max_distance
float64 eps_angle

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
MSG: geometry_msgs/PolygonStamped
# This represents a Polygon with reference coordinate frame and timestamp
Header header
Polygon polygon

================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
---
geometry_msgs/Pose transformation


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of postion and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
")



(provide :jsk_pcl_ros/CallSnapIt "00529f1ccb0137f3a14b6d5b281f9a3c")


