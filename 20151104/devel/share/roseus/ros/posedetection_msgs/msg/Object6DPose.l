;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::Object6DPose)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'Object6DPose (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::OBJECT6DPOSE")
  (make-package "POSEDETECTION_MSGS::OBJECT6DPOSE"))

(in-package "ROS")
;;//! \htmlinclude Object6DPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass posedetection_msgs::Object6DPose
  :super ros::object
  :slots (_pose _reliability _type ))

(defmethod posedetection_msgs::Object6DPose
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:reliability __reliability) 0.0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _reliability (float __reliability))
   (setq _type (string __type))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:reliability
   (&optional __reliability)
   (if __reliability (setq _reliability __reliability)) _reliability)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float32 _reliability
    4
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float32 _reliability
       (sys::poke _reliability (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _reliability
     (setq _reliability (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get posedetection_msgs::Object6DPose :md5sum-) "68aad97d55c4f9555772eee1814bb3c7")
(setf (get posedetection_msgs::Object6DPose :datatype-) "posedetection_msgs/Object6DPose")
(setf (get posedetection_msgs::Object6DPose :definition-)
      "# 6D pose of object
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



(provide :posedetection_msgs/Object6DPose "68aad97d55c4f9555772eee1814bb3c7")


