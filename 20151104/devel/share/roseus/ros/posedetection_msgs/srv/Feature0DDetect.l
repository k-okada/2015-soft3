;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::Feature0DDetect)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'Feature0DDetect (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::FEATURE0DDETECT")
  (make-package "POSEDETECTION_MSGS::FEATURE0DDETECT"))
(unless (find-package "POSEDETECTION_MSGS::FEATURE0DDETECTREQUEST")
  (make-package "POSEDETECTION_MSGS::FEATURE0DDETECTREQUEST"))
(unless (find-package "POSEDETECTION_MSGS::FEATURE0DDETECTRESPONSE")
  (make-package "POSEDETECTION_MSGS::FEATURE0DDETECTRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass posedetection_msgs::Feature0DDetectRequest
  :super ros::object
  :slots (_image ))

(defmethod posedetection_msgs::Feature0DDetectRequest
  (:init
   (&key
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _image __image)
   self)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(defclass posedetection_msgs::Feature0DDetectResponse
  :super ros::object
  :slots (_features ))

(defmethod posedetection_msgs::Feature0DDetectResponse
  (:init
   (&key
    ((:features __features) (instance posedetection_msgs::Feature0D :init))
    )
   (send-super :init)
   (setq _features __features)
   self)
  (:features
   (&rest __features)
   (if (keywordp (car __features))
       (send* _features __features)
     (progn
       (if __features (setq _features (car __features)))
       _features)))
  (:serialization-length
   ()
   (+
    ;; posedetection_msgs/Feature0D _features
    (send _features :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; posedetection_msgs/Feature0D _features
       (send _features :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; posedetection_msgs/Feature0D _features
     (send _features :deserialize buf ptr-) (incf ptr- (send _features :serialization-length))
   ;;
   self)
  )

(defclass posedetection_msgs::Feature0DDetect
  :super ros::object
  :slots ())

(setf (get posedetection_msgs::Feature0DDetect :md5sum-) "abc004df074d18a6645a71894c243592")
(setf (get posedetection_msgs::Feature0DDetect :datatype-) "posedetection_msgs/Feature0DDetect")
(setf (get posedetection_msgs::Feature0DDetect :request) posedetection_msgs::Feature0DDetectRequest)
(setf (get posedetection_msgs::Feature0DDetect :response) posedetection_msgs::Feature0DDetectResponse)

(defmethod posedetection_msgs::Feature0DDetectRequest
  (:response () (instance posedetection_msgs::Feature0DDetectResponse :init)))

(setf (get posedetection_msgs::Feature0DDetectRequest :md5sum-) "abc004df074d18a6645a71894c243592")
(setf (get posedetection_msgs::Feature0DDetectRequest :datatype-) "posedetection_msgs/Feature0DDetectRequest")
(setf (get posedetection_msgs::Feature0DDetectRequest :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

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
posedetection_msgs/Feature0D features


================================================================================
MSG: posedetection_msgs/Feature0D
Header header
float32[] positions # 2*N, 0-indexed
float32[] scales # N, optional
float32[] orientations # N, optional, along +X is 0
float32[] confidences
float32[] descriptors # N*descriptor_dim
int32 descriptor_dim
string type # type of feature

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
")

(setf (get posedetection_msgs::Feature0DDetectResponse :md5sum-) "abc004df074d18a6645a71894c243592")
(setf (get posedetection_msgs::Feature0DDetectResponse :datatype-) "posedetection_msgs/Feature0DDetectResponse")
(setf (get posedetection_msgs::Feature0DDetectResponse :definition-)
      "sensor_msgs/Image image

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

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
posedetection_msgs/Feature0D features


================================================================================
MSG: posedetection_msgs/Feature0D
Header header
float32[] positions # 2*N, 0-indexed
float32[] scales # N, optional
float32[] orientations # N, optional, along +X is 0
float32[] confidences
float32[] descriptors # N*descriptor_dim
int32 descriptor_dim
string type # type of feature

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
")



(provide :posedetection_msgs/Feature0DDetect "abc004df074d18a6645a71894c243592")


