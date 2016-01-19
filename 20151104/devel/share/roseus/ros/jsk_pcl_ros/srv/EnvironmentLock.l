;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::EnvironmentLock)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'EnvironmentLock (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::ENVIRONMENTLOCK")
  (make-package "JSK_PCL_ROS::ENVIRONMENTLOCK"))
(unless (find-package "JSK_PCL_ROS::ENVIRONMENTLOCKREQUEST")
  (make-package "JSK_PCL_ROS::ENVIRONMENTLOCKREQUEST"))
(unless (find-package "JSK_PCL_ROS::ENVIRONMENTLOCKRESPONSE")
  (make-package "JSK_PCL_ROS::ENVIRONMENTLOCKRESPONSE"))

(in-package "ROS")





(defclass jsk_pcl_ros::EnvironmentLockRequest
  :super ros::object
  :slots ())

(defmethod jsk_pcl_ros::EnvironmentLockRequest
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

(defclass jsk_pcl_ros::EnvironmentLockResponse
  :super ros::object
  :slots (_environment_id ))

(defmethod jsk_pcl_ros::EnvironmentLockResponse
  (:init
   (&key
    ((:environment_id __environment_id) 0)
    )
   (send-super :init)
   (setq _environment_id (round __environment_id))
   self)
  (:environment_id
   (&optional __environment_id)
   (if __environment_id (setq _environment_id __environment_id)) _environment_id)
  (:serialization-length
   ()
   (+
    ;; uint32 _environment_id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _environment_id
       (write-long _environment_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _environment_id
     (setq _environment_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass jsk_pcl_ros::EnvironmentLock
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::EnvironmentLock :md5sum-) "109afc0d3bd22aa461d45c8ef5ab6d75")
(setf (get jsk_pcl_ros::EnvironmentLock :datatype-) "jsk_pcl_ros/EnvironmentLock")
(setf (get jsk_pcl_ros::EnvironmentLock :request) jsk_pcl_ros::EnvironmentLockRequest)
(setf (get jsk_pcl_ros::EnvironmentLock :response) jsk_pcl_ros::EnvironmentLockResponse)

(defmethod jsk_pcl_ros::EnvironmentLockRequest
  (:response () (instance jsk_pcl_ros::EnvironmentLockResponse :init)))

(setf (get jsk_pcl_ros::EnvironmentLockRequest :md5sum-) "109afc0d3bd22aa461d45c8ef5ab6d75")
(setf (get jsk_pcl_ros::EnvironmentLockRequest :datatype-) "jsk_pcl_ros/EnvironmentLockRequest")
(setf (get jsk_pcl_ros::EnvironmentLockRequest :definition-)
      "
---
uint32 environment_id

")

(setf (get jsk_pcl_ros::EnvironmentLockResponse :md5sum-) "109afc0d3bd22aa461d45c8ef5ab6d75")
(setf (get jsk_pcl_ros::EnvironmentLockResponse :datatype-) "jsk_pcl_ros/EnvironmentLockResponse")
(setf (get jsk_pcl_ros::EnvironmentLockResponse :definition-)
      "
---
uint32 environment_id

")



(provide :jsk_pcl_ros/EnvironmentLock "109afc0d3bd22aa461d45c8ef5ab6d75")


