;; Auto-generated. Do not edit!


(when (boundp 'jsk_pcl_ros::TowerRobotMoveCommand)
  (if (not (find-package "JSK_PCL_ROS"))
    (make-package "JSK_PCL_ROS"))
  (shadow 'TowerRobotMoveCommand (find-package "JSK_PCL_ROS")))
(unless (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMAND")
  (make-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMAND"))
(unless (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST")
  (make-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(unless (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDRESPONSE")
  (make-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDRESPONSE"))

(in-package "ROS")





(intern "*ROBOT1*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*ROBOT1* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*ROBOT1* 1)
(intern "*ROBOT2*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*ROBOT2* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*ROBOT2* 2)
(intern "*ROBOT3*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*ROBOT3* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*ROBOT3* 3)
(intern "*PLATE_SMALL*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*PLATE_SMALL* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*PLATE_SMALL* 1)
(intern "*PLATE_MIDDLE*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*PLATE_MIDDLE* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*PLATE_MIDDLE* 2)
(intern "*PLATE_LARGE*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*PLATE_LARGE* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*PLATE_LARGE* 3)
(intern "*TOWER_LOWEST*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*TOWER_LOWEST* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*TOWER_LOWEST* 1)
(intern "*TOWER_MIDDLE*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*TOWER_MIDDLE* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*TOWER_MIDDLE* 2)
(intern "*TOWER_HIGHEST*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*TOWER_HIGHEST* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*TOWER_HIGHEST* 3)
(intern "*TOWER_LOWEST2*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*TOWER_LOWEST2* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*TOWER_LOWEST2* 1)
(intern "*OPTION_NONE*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*OPTION_NONE* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*OPTION_NONE* 0)
(intern "*OPTION_MOVE_INITIAL*" (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(shadow '*OPTION_MOVE_INITIAL* (find-package "JSK_PCL_ROS::TOWERROBOTMOVECOMMANDREQUEST"))
(defconstant jsk_pcl_ros::TowerRobotMoveCommandRequest::*OPTION_MOVE_INITIAL* 1)
(defclass jsk_pcl_ros::TowerRobotMoveCommandRequest
  :super ros::object
  :slots (_robot_index _plate_index _from_tower _to_tower _option_command ))

(defmethod jsk_pcl_ros::TowerRobotMoveCommandRequest
  (:init
   (&key
    ((:robot_index __robot_index) 0)
    ((:plate_index __plate_index) 0)
    ((:from_tower __from_tower) 0)
    ((:to_tower __to_tower) 0)
    ((:option_command __option_command) 0)
    )
   (send-super :init)
   (setq _robot_index (round __robot_index))
   (setq _plate_index (round __plate_index))
   (setq _from_tower (round __from_tower))
   (setq _to_tower (round __to_tower))
   (setq _option_command (round __option_command))
   self)
  (:robot_index
   (&optional __robot_index)
   (if __robot_index (setq _robot_index __robot_index)) _robot_index)
  (:plate_index
   (&optional __plate_index)
   (if __plate_index (setq _plate_index __plate_index)) _plate_index)
  (:from_tower
   (&optional __from_tower)
   (if __from_tower (setq _from_tower __from_tower)) _from_tower)
  (:to_tower
   (&optional __to_tower)
   (if __to_tower (setq _to_tower __to_tower)) _to_tower)
  (:option_command
   (&optional __option_command)
   (if __option_command (setq _option_command __option_command)) _option_command)
  (:serialization-length
   ()
   (+
    ;; int32 _robot_index
    4
    ;; int32 _plate_index
    4
    ;; int32 _from_tower
    4
    ;; int32 _to_tower
    4
    ;; int32 _option_command
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _robot_index
       (write-long _robot_index s)
     ;; int32 _plate_index
       (write-long _plate_index s)
     ;; int32 _from_tower
       (write-long _from_tower s)
     ;; int32 _to_tower
       (write-long _to_tower s)
     ;; int32 _option_command
       (write-long _option_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _robot_index
     (setq _robot_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _plate_index
     (setq _plate_index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _from_tower
     (setq _from_tower (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _to_tower
     (setq _to_tower (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _option_command
     (setq _option_command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass jsk_pcl_ros::TowerRobotMoveCommandResponse
  :super ros::object
  :slots ())

(defmethod jsk_pcl_ros::TowerRobotMoveCommandResponse
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

(defclass jsk_pcl_ros::TowerRobotMoveCommand
  :super ros::object
  :slots ())

(setf (get jsk_pcl_ros::TowerRobotMoveCommand :md5sum-) "aadba056bdce0494569ab50ecd2ec90c")
(setf (get jsk_pcl_ros::TowerRobotMoveCommand :datatype-) "jsk_pcl_ros/TowerRobotMoveCommand")
(setf (get jsk_pcl_ros::TowerRobotMoveCommand :request) jsk_pcl_ros::TowerRobotMoveCommandRequest)
(setf (get jsk_pcl_ros::TowerRobotMoveCommand :response) jsk_pcl_ros::TowerRobotMoveCommandResponse)

(defmethod jsk_pcl_ros::TowerRobotMoveCommandRequest
  (:response () (instance jsk_pcl_ros::TowerRobotMoveCommandResponse :init)))

(setf (get jsk_pcl_ros::TowerRobotMoveCommandRequest :md5sum-) "aadba056bdce0494569ab50ecd2ec90c")
(setf (get jsk_pcl_ros::TowerRobotMoveCommandRequest :datatype-) "jsk_pcl_ros/TowerRobotMoveCommandRequest")
(setf (get jsk_pcl_ros::TowerRobotMoveCommandRequest :definition-)
      "
byte ROBOT1=1
byte ROBOT2=2
byte ROBOT3=3

byte PLATE_SMALL=1
byte PLATE_MIDDLE=2
byte PLATE_LARGE=3

byte TOWER_LOWEST=1
byte TOWER_MIDDLE=2
byte TOWER_HIGHEST=3
byte TOWER_LOWEST2=1

byte OPTION_NONE=0
byte OPTION_MOVE_INITIAL=1

int32 robot_index
int32 plate_index
int32 from_tower
int32 to_tower
int32 option_command
---

")

(setf (get jsk_pcl_ros::TowerRobotMoveCommandResponse :md5sum-) "aadba056bdce0494569ab50ecd2ec90c")
(setf (get jsk_pcl_ros::TowerRobotMoveCommandResponse :datatype-) "jsk_pcl_ros/TowerRobotMoveCommandResponse")
(setf (get jsk_pcl_ros::TowerRobotMoveCommandResponse :definition-)
      "
byte ROBOT1=1
byte ROBOT2=2
byte ROBOT3=3

byte PLATE_SMALL=1
byte PLATE_MIDDLE=2
byte PLATE_LARGE=3

byte TOWER_LOWEST=1
byte TOWER_MIDDLE=2
byte TOWER_HIGHEST=3
byte TOWER_LOWEST2=1

byte OPTION_NONE=0
byte OPTION_MOVE_INITIAL=1

int32 robot_index
int32 plate_index
int32 from_tower
int32 to_tower
int32 option_command
---

")



(provide :jsk_pcl_ros/TowerRobotMoveCommand "aadba056bdce0494569ab50ecd2ec90c")


