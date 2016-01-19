;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::TowerPickUp)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'TowerPickUp (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::TOWERPICKUP")
  (make-package "JSK_PCL_ROS::TOWERPICKUP"))
(unless (find-package "JSK_PCL_ROS::TOWERPICKUPREQUEST")
  (make-package "JSK_PCL_ROS::TOWERPICKUPREQUEST"))
(unless (find-package "JSK_PCL_ROS::TOWERPICKUPRESPONSE")
  (make-package "JSK_PCL_ROS::TOWERPICKUPRESPONSE"))

(in-package "ROS")





(defclass jsk_pcl_ros::TowerPickUpRequest
  :super ros::object
  :slots (_tower_index ))

(defmethod jsk_pcl_ros::TowerPickUpRequest
  (:init
   (&key
    ((:tower_index __tower_index) 0)
    )
   (send-super :init)
   (setq _tower_index (round __tower_index))
   self)
  (:tower_index
   (&optional __tower_index)
   (if __tower_index (setq _tower_index __tower_index)) _tower_index)
  (:serialization-length
   ()
   (+
    ;; int32 _tower_index
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _tower_index
       (write-long _tower_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _tower_index
     (setq _tower_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass jsk_pcl_ros::TowerPickUpResponse
  :super ros::object
  :slots ())

(defmethod jsk_pcl_ros::TowerPickUpResponse
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

(defclass jsk_pcl_ros::TowerPickUp
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::TowerPickUp :md5sum-) "e8bd24109f26b6d833bc4570d67d71c9")
(setf (get jsk_pcl_ros::TowerPickUp :datatype-) "jsk_pcl_ros/TowerPickUp")
(setf (get jsk_pcl_ros::TowerPickUp :request) jsk_pcl_ros::TowerPickUpRequest)
(setf (get jsk_pcl_ros::TowerPickUp :response) jsk_pcl_ros::TowerPickUpResponse)

(defmethod jsk_pcl_ros::TowerPickUpRequest
  (:response () (instance jsk_pcl_ros::TowerPickUpResponse :init)))

(setf (get jsk_pcl_ros::TowerPickUpRequest :md5sum-) "e8bd24109f26b6d833bc4570d67d71c9")
(setf (get jsk_pcl_ros::TowerPickUpRequest :datatype-) "jsk_pcl_ros/TowerPickUpRequest")
(setf (get jsk_pcl_ros::TowerPickUpRequest :definition-)
      "int32 tower_index
---


")

(setf (get jsk_pcl_ros::TowerPickUpResponse :md5sum-) "e8bd24109f26b6d833bc4570d67d71c9")
(setf (get jsk_pcl_ros::TowerPickUpResponse :datatype-) "jsk_pcl_ros/TowerPickUpResponse")
(setf (get jsk_pcl_ros::TowerPickUpResponse :definition-)
      "int32 tower_index
---


")



(provide :jsk_pcl_ros/TowerPickUp "e8bd24109f26b6d833bc4570d67d71c9")


