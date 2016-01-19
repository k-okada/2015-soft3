;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::SnapFootstep)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'SnapFootstep (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::SNAPFOOTSTEP")
  (make-package "JSK_PCL_ROS::SNAPFOOTSTEP"))
(unless (find-package "JSK_PCL_ROS::SNAPFOOTSTEPREQUEST")
  (make-package "JSK_PCL_ROS::SNAPFOOTSTEPREQUEST"))
(unless (find-package "JSK_PCL_ROS::SNAPFOOTSTEPRESPONSE")
  (make-package "JSK_PCL_ROS::SNAPFOOTSTEPRESPONSE"))

(in-package "ROS")

(if (not (find-package "JSK_FOOTSTEP_MSGS"))
  (ros::roseus-add-msgs "jsk_footstep_msgs"))


(if (not (find-package "JSK_FOOTSTEP_MSGS"))
  (ros::roseus-add-msgs "jsk_footstep_msgs"))


(defclass jsk_pcl_ros::SnapFootstepRequest
  :super ros::object
  :slots (_input ))

(defmethod jsk_pcl_ros::SnapFootstepRequest
  (:init
   (&key
    ((:input __input) (instance jsk_footstep_msgs::FootstepArray :init))
    )
   (send-super :init)
   (setq _input __input)
   self)
  (:input
   (&rest __input)
   (if (keywordp (car __input))
       (send* _input __input)
     (progn
       (if __input (setq _input (car __input)))
       _input)))
  (:serialization-length
   ()
   (+
    ;; jsk_footstep_msgs/FootstepArray _input
    (send _input :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; jsk_footstep_msgs/FootstepArray _input
       (send _input :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; jsk_footstep_msgs/FootstepArray _input
     (send _input :deserialize buf ptr-) (incf ptr- (send _input :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::SnapFootstepResponse
  :super ros::object
  :slots (_output ))

(defmethod jsk_pcl_ros::SnapFootstepResponse
  (:init
   (&key
    ((:output __output) (instance jsk_footstep_msgs::FootstepArray :init))
    )
   (send-super :init)
   (setq _output __output)
   self)
  (:output
   (&rest __output)
   (if (keywordp (car __output))
       (send* _output __output)
     (progn
       (if __output (setq _output (car __output)))
       _output)))
  (:serialization-length
   ()
   (+
    ;; jsk_footstep_msgs/FootstepArray _output
    (send _output :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; jsk_footstep_msgs/FootstepArray _output
       (send _output :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; jsk_footstep_msgs/FootstepArray _output
     (send _output :deserialize buf ptr-) (incf ptr- (send _output :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::SnapFootstep
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::SnapFootstep :md5sum-) "29a2db6b857d844b70a158d47626005e")
(setf (get jsk_pcl_ros::SnapFootstep :datatype-) "jsk_pcl_ros/SnapFootstep")
(setf (get jsk_pcl_ros::SnapFootstep :request) jsk_pcl_ros::SnapFootstepRequest)
(setf (get jsk_pcl_ros::SnapFootstep :response) jsk_pcl_ros::SnapFootstepResponse)

(defmethod jsk_pcl_ros::SnapFootstepRequest
  (:response () (instance jsk_pcl_ros::SnapFootstepResponse :init)))

(setf (get jsk_pcl_ros::SnapFootstepRequest :md5sum-) "29a2db6b857d844b70a158d47626005e")
(setf (get jsk_pcl_ros::SnapFootstepRequest :datatype-) "jsk_pcl_ros/SnapFootstepRequest")
(setf (get jsk_pcl_ros::SnapFootstepRequest :definition-)
      "jsk_footstep_msgs/FootstepArray input

================================================================================
MSG: jsk_footstep_msgs/FootstepArray
Header header
Footstep[] footsteps
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
MSG: jsk_footstep_msgs/Footstep
uint8 RIGHT=2
uint8 LEFT=1

# Constants to visualize progress
uint8 REJECTED=3
uint8 APPROVED=4

uint8 leg
geometry_msgs/Pose pose
duration duration
# optional parameters
uint32 footstep_group
geometry_msgs/Vector3 dimensions
float32 swing_height
float32 cost

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
---
jsk_footstep_msgs/FootstepArray output


================================================================================
MSG: jsk_footstep_msgs/FootstepArray
Header header
Footstep[] footsteps
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
MSG: jsk_footstep_msgs/Footstep
uint8 RIGHT=2
uint8 LEFT=1

# Constants to visualize progress
uint8 REJECTED=3
uint8 APPROVED=4

uint8 leg
geometry_msgs/Pose pose
duration duration
# optional parameters
uint32 footstep_group
geometry_msgs/Vector3 dimensions
float32 swing_height
float32 cost

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
")

(setf (get jsk_pcl_ros::SnapFootstepResponse :md5sum-) "29a2db6b857d844b70a158d47626005e")
(setf (get jsk_pcl_ros::SnapFootstepResponse :datatype-) "jsk_pcl_ros/SnapFootstepResponse")
(setf (get jsk_pcl_ros::SnapFootstepResponse :definition-)
      "jsk_footstep_msgs/FootstepArray input

================================================================================
MSG: jsk_footstep_msgs/FootstepArray
Header header
Footstep[] footsteps
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
MSG: jsk_footstep_msgs/Footstep
uint8 RIGHT=2
uint8 LEFT=1

# Constants to visualize progress
uint8 REJECTED=3
uint8 APPROVED=4

uint8 leg
geometry_msgs/Pose pose
duration duration
# optional parameters
uint32 footstep_group
geometry_msgs/Vector3 dimensions
float32 swing_height
float32 cost

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
---
jsk_footstep_msgs/FootstepArray output


================================================================================
MSG: jsk_footstep_msgs/FootstepArray
Header header
Footstep[] footsteps
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
MSG: jsk_footstep_msgs/Footstep
uint8 RIGHT=2
uint8 LEFT=1

# Constants to visualize progress
uint8 REJECTED=3
uint8 APPROVED=4

uint8 leg
geometry_msgs/Pose pose
duration duration
# optional parameters
uint32 footstep_group
geometry_msgs/Vector3 dimensions
float32 swing_height
float32 cost

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 

float64 x
float64 y
")



(provide :jsk_pcl_ros/SnapFootstep "29a2db6b857d844b70a158d47626005e")


