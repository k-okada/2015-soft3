;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::TargetObj)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'TargetObj (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::TARGETOBJ")
  (make-package "POSEDETECTION_MSGS::TARGETOBJ"))
(unless (find-package "POSEDETECTION_MSGS::TARGETOBJREQUEST")
  (make-package "POSEDETECTION_MSGS::TARGETOBJREQUEST"))
(unless (find-package "POSEDETECTION_MSGS::TARGETOBJRESPONSE")
  (make-package "POSEDETECTION_MSGS::TARGETOBJRESPONSE"))

(in-package "ROS")





(defclass posedetection_msgs::TargetObjRequest
  :super ros::object
  :slots (_type ))

(defmethod posedetection_msgs::TargetObjRequest
  (:init
   (&key
    ((:type __type) "")
    )
   (send-super :init)
   (setq _type (string __type))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass posedetection_msgs::TargetObjResponse
  :super ros::object
  :slots (_object_pose ))

(defmethod posedetection_msgs::TargetObjResponse
  (:init
   (&key
    ((:object_pose __object_pose) (instance posedetection_msgs::Object6DPose :init))
    )
   (send-super :init)
   (setq _object_pose __object_pose)
   self)
  (:object_pose
   (&rest __object_pose)
   (if (keywordp (car __object_pose))
       (send* _object_pose __object_pose)
     (progn
       (if __object_pose (setq _object_pose (car __object_pose)))
       _object_pose)))
  (:serialization-length
   ()
   (+
    ;; posedetection_msgs/Object6DPose _object_pose
    (send _object_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; posedetection_msgs/Object6DPose _object_pose
       (send _object_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; posedetection_msgs/Object6DPose _object_pose
     (send _object_pose :deserialize buf ptr-) (incf ptr- (send _object_pose :serialization-length))
   ;;
   self)
  )

(defclass posedetection_msgs::TargetObj
  :super ros::object
  :slots ())

(setf (get posedetection_msgs::TargetObj :md5sum-) "ef30370054b38413dfbfa16532d6fb84")
(setf (get posedetection_msgs::TargetObj :datatype-) "posedetection_msgs/TargetObj")
(setf (get posedetection_msgs::TargetObj :request) posedetection_msgs::TargetObjRequest)
(setf (get posedetection_msgs::TargetObj :response) posedetection_msgs::TargetObjResponse)

(defmethod posedetection_msgs::TargetObjRequest
  (:response () (instance posedetection_msgs::TargetObjResponse :init)))

(setf (get posedetection_msgs::TargetObjRequest :md5sum-) "ef30370054b38413dfbfa16532d6fb84")
(setf (get posedetection_msgs::TargetObjRequest :datatype-) "posedetection_msgs/TargetObjRequest")
(setf (get posedetection_msgs::TargetObjRequest :definition-)
      "
string type
---
posedetection_msgs/Object6DPose object_pose


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

(setf (get posedetection_msgs::TargetObjResponse :md5sum-) "ef30370054b38413dfbfa16532d6fb84")
(setf (get posedetection_msgs::TargetObjResponse :datatype-) "posedetection_msgs/TargetObjResponse")
(setf (get posedetection_msgs::TargetObjResponse :definition-)
      "
string type
---
posedetection_msgs/Object6DPose object_pose


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



(provide :posedetection_msgs/TargetObj "ef30370054b38413dfbfa16532d6fb84")


