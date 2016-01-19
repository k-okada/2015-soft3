;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::CallPolygon)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'CallPolygon (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::CALLPOLYGON")
  (make-package "JSK_PCL_ROS::CALLPOLYGON"))
(unless (find-package "JSK_PCL_ROS::CALLPOLYGONREQUEST")
  (make-package "JSK_PCL_ROS::CALLPOLYGONREQUEST"))
(unless (find-package "JSK_PCL_ROS::CALLPOLYGONRESPONSE")
  (make-package "JSK_PCL_ROS::CALLPOLYGONRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass jsk_pcl_ros::CallPolygonRequest
  :super ros::object
  :slots (_filename ))

(defmethod jsk_pcl_ros::CallPolygonRequest
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass jsk_pcl_ros::CallPolygonResponse
  :super ros::object
  :slots (_points ))

(defmethod jsk_pcl_ros::CallPolygonResponse
  (:init
   (&key
    ((:points __points) (instance geometry_msgs::PolygonStamped :init))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PolygonStamped _points
    (send _points :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PolygonStamped _points
       (send _points :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PolygonStamped _points
     (send _points :deserialize buf ptr-) (incf ptr- (send _points :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::CallPolygon
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::CallPolygon :md5sum-) "b28bb04ea4e0c4a8f9c4d715ba76b7ac")
(setf (get jsk_pcl_ros::CallPolygon :datatype-) "jsk_pcl_ros/CallPolygon")
(setf (get jsk_pcl_ros::CallPolygon :request) jsk_pcl_ros::CallPolygonRequest)
(setf (get jsk_pcl_ros::CallPolygon :response) jsk_pcl_ros::CallPolygonResponse)

(defmethod jsk_pcl_ros::CallPolygonRequest
  (:response () (instance jsk_pcl_ros::CallPolygonResponse :init)))

(setf (get jsk_pcl_ros::CallPolygonRequest :md5sum-) "b28bb04ea4e0c4a8f9c4d715ba76b7ac")
(setf (get jsk_pcl_ros::CallPolygonRequest :datatype-) "jsk_pcl_ros/CallPolygonRequest")
(setf (get jsk_pcl_ros::CallPolygonRequest :definition-)
      "string filename
---
geometry_msgs/PolygonStamped points


================================================================================
MSG: geometry_msgs/PolygonStamped
# This represents a Polygon with reference coordinate frame and timestamp
Header header
Polygon polygon

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
")

(setf (get jsk_pcl_ros::CallPolygonResponse :md5sum-) "b28bb04ea4e0c4a8f9c4d715ba76b7ac")
(setf (get jsk_pcl_ros::CallPolygonResponse :datatype-) "jsk_pcl_ros/CallPolygonResponse")
(setf (get jsk_pcl_ros::CallPolygonResponse :definition-)
      "string filename
---
geometry_msgs/PolygonStamped points


================================================================================
MSG: geometry_msgs/PolygonStamped
# This represents a Polygon with reference coordinate frame and timestamp
Header header
Polygon polygon

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
")



(provide :jsk_pcl_ros/CallPolygon "b28bb04ea4e0c4a8f9c4d715ba76b7ac")


