;; Auto-generated. Do not edit!


(when (boundp 'image_view2::MouseEvent)
  (if (not (find-package "IMAGE_VIEW2"))
    (make-package "IMAGE_VIEW2"))
  (shadow 'MouseEvent (find-package "IMAGE_VIEW2")))
(unless (find-package "IMAGE_VIEW2::MOUSEEVENT")
  (make-package "IMAGE_VIEW2::MOUSEEVENT"))

(in-package "ROS")
;;//! \htmlinclude MouseEvent.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*KEY_PRESSED*" (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(shadow '*KEY_PRESSED* (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(defconstant image_view2::MouseEvent::*KEY_PRESSED* 1)
(intern "*MOUSE_LEFT_UP*" (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(shadow '*MOUSE_LEFT_UP* (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(defconstant image_view2::MouseEvent::*MOUSE_LEFT_UP* 2)
(intern "*MOUSE_LEFT_DOWN*" (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(shadow '*MOUSE_LEFT_DOWN* (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(defconstant image_view2::MouseEvent::*MOUSE_LEFT_DOWN* 3)
(intern "*MOUSE_MOVE*" (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(shadow '*MOUSE_MOVE* (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(defconstant image_view2::MouseEvent::*MOUSE_MOVE* 4)
(intern "*MOUSE_RIGHT_DOWN*" (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(shadow '*MOUSE_RIGHT_DOWN* (find-package "IMAGE_VIEW2::MOUSEEVENT"))
(defconstant image_view2::MouseEvent::*MOUSE_RIGHT_DOWN* 5)
(defclass image_view2::MouseEvent
  :super ros::object
  :slots (_header _type _key _x _y _width _height ))

(defmethod image_view2::MouseEvent
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:type __type) 0)
    ((:key __key) 0)
    ((:x __x) 0)
    ((:y __y) 0)
    ((:width __width) 0)
    ((:height __height) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _type (round __type))
   (setq _key (round __key))
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _width (round __width))
   (setq _height (round __height))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:key
   (&optional __key)
   (if __key (setq _key __key)) _key)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _type
    4
    ;; int32 _key
    4
    ;; int32 _x
    4
    ;; int32 _y
    4
    ;; int32 _width
    4
    ;; int32 _height
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _key
       (write-long _key s)
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;; int32 _width
       (write-long _width s)
     ;; int32 _height
       (write-long _height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _key
     (setq _key (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get image_view2::MouseEvent :md5sum-) "7ffa73624c1be385169a9e6e23460224")
(setf (get image_view2::MouseEvent :datatype-) "image_view2/MouseEvent")
(setf (get image_view2::MouseEvent :definition-)
      "Header header

# event type
int32 KEY_PRESSED=1
int32 MOUSE_LEFT_UP=2
int32 MOUSE_LEFT_DOWN=3
int32 MOUSE_MOVE=4
int32 MOUSE_RIGHT_DOWN=5
int32 type

int32 key

# location of mouse
int32 x
int32 y

# size of image
int32 width
int32 height
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



(provide :image_view2/MouseEvent "7ffa73624c1be385169a9e6e23460224")


