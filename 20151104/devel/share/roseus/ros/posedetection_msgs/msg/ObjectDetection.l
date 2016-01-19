;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::ObjectDetection)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'ObjectDetection (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::OBJECTDETECTION")
  (make-package "POSEDETECTION_MSGS::OBJECTDETECTION"))

(in-package "ROS")
;;//! \htmlinclude ObjectDetection.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass posedetection_msgs::ObjectDetection
  :super ros::object
  :slots (_header _objects ))

(defmethod posedetection_msgs::ObjectDetection
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:objects __objects) (let (r) (dotimes (i 0) (push (instance posedetection_msgs::Object6DPose :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _objects __objects)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:objects
   (&rest __objects)
   (if (keywordp (car __objects))
       (send* _objects __objects)
     (progn
       (if __objects (setq _objects (car __objects)))
       _objects)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; posedetection_msgs/Object6DPose[] _objects
    (apply #'+ (send-all _objects :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; posedetection_msgs/Object6DPose[] _objects
     (write-long (length _objects) s)
     (dolist (elem _objects)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; posedetection_msgs/Object6DPose[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (let (r) (dotimes (i n) (push (instance posedetection_msgs::Object6DPose :init) r)) r))
     (dolist (elem- _objects)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get posedetection_msgs::ObjectDetection :md5sum-) "450ee77eda8a92543774df0b858b3605")
(setf (get posedetection_msgs::ObjectDetection :datatype-) "posedetection_msgs/ObjectDetection")
(setf (get posedetection_msgs::ObjectDetection :definition-)
      "Header header
Object6DPose[] objects
# unique image id these objects were taken from

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
MSG: posedetection_msgs/Object6DPose
# 6D pose of object
geometry_msgs/Pose pose
# reliability
float32 reliability

# type of object, usually contains the filename of the object that allows the receiving side to visualize it
# can also be used as a unique type id
string type 

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



(provide :posedetection_msgs/ObjectDetection "450ee77eda8a92543774df0b858b3605")


