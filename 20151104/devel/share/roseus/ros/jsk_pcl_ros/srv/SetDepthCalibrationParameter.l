;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::SetDepthCalibrationParameter)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'SetDepthCalibrationParameter (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETER")
  (make-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETER"))
(unless (find-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETERREQUEST")
  (make-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETERREQUEST"))
(unless (find-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETERRESPONSE")
  (make-package "JSK_PCL_ROS::SETDEPTHCALIBRATIONPARAMETERRESPONSE"))

(in-package "ROS")

(if (not (find-package "JSK_RECOGNITION_MSGS"))
  (ros::roseus-add-msgs "jsk_recognition_msgs"))




(defclass jsk_pcl_ros::SetDepthCalibrationParameterRequest
  :super ros::object
  :slots (_parameter ))

(defmethod jsk_pcl_ros::SetDepthCalibrationParameterRequest
  (:init
   (&key
    ((:parameter __parameter) (instance jsk_recognition_msgs::DepthCalibrationParameter :init))
    )
   (send-super :init)
   (setq _parameter __parameter)
   self)
  (:parameter
   (&rest __parameter)
   (if (keywordp (car __parameter))
       (send* _parameter __parameter)
     (progn
       (if __parameter (setq _parameter (car __parameter)))
       _parameter)))
  (:serialization-length
   ()
   (+
    ;; jsk_recognition_msgs/DepthCalibrationParameter _parameter
    (send _parameter :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; jsk_recognition_msgs/DepthCalibrationParameter _parameter
       (send _parameter :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; jsk_recognition_msgs/DepthCalibrationParameter _parameter
     (send _parameter :deserialize buf ptr-) (incf ptr- (send _parameter :serialization-length))
   ;;
   self)
  )

(defclass jsk_pcl_ros::SetDepthCalibrationParameterResponse
  :super ros::object
  :slots ())

(defmethod jsk_pcl_ros::SetDepthCalibrationParameterResponse
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

(defclass jsk_pcl_ros::SetDepthCalibrationParameter
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::SetDepthCalibrationParameter :md5sum-) "46b1552cd9512adcf9bbec97800b0e0d")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameter :datatype-) "jsk_pcl_ros/SetDepthCalibrationParameter")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameter :request) jsk_pcl_ros::SetDepthCalibrationParameterRequest)
(setf (get jsk_pcl_ros::SetDepthCalibrationParameter :response) jsk_pcl_ros::SetDepthCalibrationParameterResponse)

(defmethod jsk_pcl_ros::SetDepthCalibrationParameterRequest
  (:response () (instance jsk_pcl_ros::SetDepthCalibrationParameterResponse :init)))

(setf (get jsk_pcl_ros::SetDepthCalibrationParameterRequest :md5sum-) "46b1552cd9512adcf9bbec97800b0e0d")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameterRequest :datatype-) "jsk_pcl_ros/SetDepthCalibrationParameterRequest")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameterRequest :definition-)
      "jsk_recognition_msgs/DepthCalibrationParameter parameter

================================================================================
MSG: jsk_recognition_msgs/DepthCalibrationParameter
# each vector stands for C(u, v)
# C(u, v) = a_0 * u^2 + a_1 * u + a_2 * v^2 + a_3 * v + a_4
float64[] coefficients2
float64[] coefficients1
float64[] coefficients0
bool use_abs
---

")

(setf (get jsk_pcl_ros::SetDepthCalibrationParameterResponse :md5sum-) "46b1552cd9512adcf9bbec97800b0e0d")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameterResponse :datatype-) "jsk_pcl_ros/SetDepthCalibrationParameterResponse")
(setf (get jsk_pcl_ros::SetDepthCalibrationParameterResponse :definition-)
      "jsk_recognition_msgs/DepthCalibrationParameter parameter

================================================================================
MSG: jsk_recognition_msgs/DepthCalibrationParameter
# each vector stands for C(u, v)
# C(u, v) = a_0 * u^2 + a_1 * u + a_2 * v^2 + a_3 * v + a_4
float64[] coefficients2
float64[] coefficients1
float64[] coefficients0
bool use_abs
---

")



(provide :jsk_pcl_ros/SetDepthCalibrationParameter "46b1552cd9512adcf9bbec97800b0e0d")


