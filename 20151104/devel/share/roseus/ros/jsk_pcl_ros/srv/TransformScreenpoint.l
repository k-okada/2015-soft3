;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::TransformScreenpoint)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'TransformScreenpoint (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::TRANSFORMSCREENPOINT")
  (make-package "JSK_PCL_ROS::TRANSFORMSCREENPOINT"))
(unless (find-package "JSK_PCL_ROS::TRANSFORMSCREENPOINTREQUEST")
  (make-package "JSK_PCL_ROS::TRANSFORMSCREENPOINTREQUEST"))
(unless (find-package "JSK_PCL_ROS::TRANSFORMSCREENPOINTRESPONSE")
  (make-package "JSK_PCL_ROS::TRANSFORMSCREENPOINTRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass jsk_pcl_ros::TransformScreenpointRequest
  :super ros::object
  :slots (_x _y ))

(defmethod jsk_pcl_ros::TransformScreenpointRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass jsk_pcl_ros::TransformScreenpointResponse
  :super ros::object
  :slots (_header _point _vector ))

(defmethod jsk_pcl_ros::TransformScreenpointResponse
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:vector __vector) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   (setq _vector __vector)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; geometry_msgs/Vector3 _vector
    (send _vector :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; geometry_msgs/Vector3 _vector
       (send _vector :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; geometry_msgs/Vector3 _vector
     (send _vector :deserialize buf ptr-) (incf ptr- (send _vector :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::TransformScreenpoint
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::TransformScreenpoint :md5sum-) "a0ea33442cfbdd4bb0a150a4f107adcc")
(setf (get jsk_pcl_ros::TransformScreenpoint :datatype-) "jsk_pcl_ros/TransformScreenpoint")
(setf (get jsk_pcl_ros::TransformScreenpoint :request) jsk_pcl_ros::TransformScreenpointRequest)
(setf (get jsk_pcl_ros::TransformScreenpoint :response) jsk_pcl_ros::TransformScreenpointResponse)

(defmethod jsk_pcl_ros::TransformScreenpointRequest
  (:response () (instance jsk_pcl_ros::TransformScreenpointResponse :init)))

(setf (get jsk_pcl_ros::TransformScreenpointRequest :md5sum-) "a0ea33442cfbdd4bb0a150a4f107adcc")
(setf (get jsk_pcl_ros::TransformScreenpointRequest :datatype-) "jsk_pcl_ros/TransformScreenpointRequest")
(setf (get jsk_pcl_ros::TransformScreenpointRequest :definition-)
      "
float32 x
float32 y
---

std_msgs/Header header
geometry_msgs/Point point
geometry_msgs/Vector3 vector






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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
")

(setf (get jsk_pcl_ros::TransformScreenpointResponse :md5sum-) "a0ea33442cfbdd4bb0a150a4f107adcc")
(setf (get jsk_pcl_ros::TransformScreenpointResponse :datatype-) "jsk_pcl_ros/TransformScreenpointResponse")
(setf (get jsk_pcl_ros::TransformScreenpointResponse :definition-)
      "
float32 x
float32 y
---

std_msgs/Header header
geometry_msgs/Point point
geometry_msgs/Vector3 vector






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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
")



(provide :jsk_pcl_ros/TransformScreenpoint "a0ea33442cfbdd4bb0a150a4f107adcc")


