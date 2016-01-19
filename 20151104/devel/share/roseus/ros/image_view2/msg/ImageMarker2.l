;; Auto-generated. Do not edit!


(when (boundp 'image_view2::ImageMarker2)
  (if (not (find-package "IMAGE_VIEW2"))
    (make-package "IMAGE_VIEW2"))
  (shadow 'ImageMarker2 (find-package "IMAGE_VIEW2")))
(unless (find-package "IMAGE_VIEW2::IMAGEMARKER2")
  (make-package "IMAGE_VIEW2::IMAGEMARKER2"))

(in-package "ROS")
;;//! \htmlinclude ImageMarker2.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*CIRCLE*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*CIRCLE* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*CIRCLE* 0)
(intern "*LINE_STRIP*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*LINE_STRIP* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*LINE_STRIP* 1)
(intern "*LINE_LIST*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*LINE_LIST* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*LINE_LIST* 2)
(intern "*POLYGON*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*POLYGON* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*POLYGON* 3)
(intern "*POINTS*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*POINTS* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*POINTS* 4)
(intern "*FRAMES*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*FRAMES* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*FRAMES* 5)
(intern "*TEXT*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*TEXT* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*TEXT* 6)
(intern "*LINE_STRIP3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*LINE_STRIP3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*LINE_STRIP3D* 7)
(intern "*LINE_LIST3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*LINE_LIST3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*LINE_LIST3D* 8)
(intern "*POLYGON3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*POLYGON3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*POLYGON3D* 9)
(intern "*POINTS3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*POINTS3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*POINTS3D* 10)
(intern "*TEXT3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*TEXT3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*TEXT3D* 11)
(intern "*CIRCLE3D*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*CIRCLE3D* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*CIRCLE3D* 12)
(intern "*ADD*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*ADD* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*ADD* 0)
(intern "*REMOVE*" (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(shadow '*REMOVE* (find-package "IMAGE_VIEW2::IMAGEMARKER2"))
(defconstant image_view2::ImageMarker2::*REMOVE* 1)
(defclass image_view2::ImageMarker2
  :super ros::object
  :slots (_header _ns _id _type _action _position _position3D _pose _scale _width _outline_color _filled _fill_color _lifetime _arc _angle _points _points3D _outline_colors _frames _text _left_up_origin _ratio_scale ))

(defmethod image_view2::ImageMarker2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ns __ns) "")
    ((:id __id) 0)
    ((:type __type) 0)
    ((:action __action) 0)
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:position3D __position3D) (instance geometry_msgs::PointStamped :init))
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    ((:scale __scale) 0.0)
    ((:width __width) 0.0)
    ((:outline_color __outline_color) (instance std_msgs::ColorRGBA :init))
    ((:filled __filled) 0)
    ((:fill_color __fill_color) (instance std_msgs::ColorRGBA :init))
    ((:lifetime __lifetime) (instance ros::time :init))
    ((:arc __arc) 0)
    ((:angle __angle) 0.0)
    ((:points __points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:points3D __points3D) (instance image_view2::PointArrayStamped :init))
    ((:outline_colors __outline_colors) (let (r) (dotimes (i 0) (push (instance std_msgs::ColorRGBA :init) r)) r))
    ((:frames __frames) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:text __text) "")
    ((:left_up_origin __left_up_origin) nil)
    ((:ratio_scale __ratio_scale) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _ns (string __ns))
   (setq _id (round __id))
   (setq _type (round __type))
   (setq _action (round __action))
   (setq _position __position)
   (setq _position3D __position3D)
   (setq _pose __pose)
   (setq _scale (float __scale))
   (setq _width (float __width))
   (setq _outline_color __outline_color)
   (setq _filled (round __filled))
   (setq _fill_color __fill_color)
   (setq _lifetime __lifetime)
   (setq _arc (round __arc))
   (setq _angle (float __angle))
   (setq _points __points)
   (setq _points3D __points3D)
   (setq _outline_colors __outline_colors)
   (setq _frames __frames)
   (setq _text (string __text))
   (setq _left_up_origin __left_up_origin)
   (setq _ratio_scale __ratio_scale)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ns
   (&optional __ns)
   (if __ns (setq _ns __ns)) _ns)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:position3D
   (&rest __position3D)
   (if (keywordp (car __position3D))
       (send* _position3D __position3D)
     (progn
       (if __position3D (setq _position3D (car __position3D)))
       _position3D)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:scale
   (&optional __scale)
   (if __scale (setq _scale __scale)) _scale)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:outline_color
   (&rest __outline_color)
   (if (keywordp (car __outline_color))
       (send* _outline_color __outline_color)
     (progn
       (if __outline_color (setq _outline_color (car __outline_color)))
       _outline_color)))
  (:filled
   (&optional __filled)
   (if __filled (setq _filled __filled)) _filled)
  (:fill_color
   (&rest __fill_color)
   (if (keywordp (car __fill_color))
       (send* _fill_color __fill_color)
     (progn
       (if __fill_color (setq _fill_color (car __fill_color)))
       _fill_color)))
  (:lifetime
   (&optional __lifetime)
   (if __lifetime (setq _lifetime __lifetime)) _lifetime)
  (:arc
   (&optional __arc)
   (if __arc (setq _arc __arc)) _arc)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:points3D
   (&rest __points3D)
   (if (keywordp (car __points3D))
       (send* _points3D __points3D)
     (progn
       (if __points3D (setq _points3D (car __points3D)))
       _points3D)))
  (:outline_colors
   (&rest __outline_colors)
   (if (keywordp (car __outline_colors))
       (send* _outline_colors __outline_colors)
     (progn
       (if __outline_colors (setq _outline_colors (car __outline_colors)))
       _outline_colors)))
  (:frames
   (&optional __frames)
   (if __frames (setq _frames __frames)) _frames)
  (:text
   (&optional __text)
   (if __text (setq _text __text)) _text)
  (:left_up_origin
   (&optional __left_up_origin)
   (if __left_up_origin (setq _left_up_origin __left_up_origin)) _left_up_origin)
  (:ratio_scale
   (&optional __ratio_scale)
   (if __ratio_scale (setq _ratio_scale __ratio_scale)) _ratio_scale)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _ns
    4 (length _ns)
    ;; int32 _id
    4
    ;; int32 _type
    4
    ;; int32 _action
    4
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/PointStamped _position3D
    (send _position3D :serialization-length)
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ;; float32 _scale
    4
    ;; float32 _width
    4
    ;; std_msgs/ColorRGBA _outline_color
    (send _outline_color :serialization-length)
    ;; byte _filled
    1
    ;; std_msgs/ColorRGBA _fill_color
    (send _fill_color :serialization-length)
    ;; duration _lifetime
    8
    ;; byte _arc
    1
    ;; float32 _angle
    4
    ;; geometry_msgs/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; image_view2/PointArrayStamped _points3D
    (send _points3D :serialization-length)
    ;; std_msgs/ColorRGBA[] _outline_colors
    (apply #'+ (send-all _outline_colors :serialization-length)) 4
    ;; string[] _frames
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _frames)) 4
    ;; string _text
    4 (length _text)
    ;; bool _left_up_origin
    1
    ;; bool _ratio_scale
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _ns
       (write-long (length _ns) s) (princ _ns s)
     ;; int32 _id
       (write-long _id s)
     ;; int32 _type
       (write-long _type s)
     ;; int32 _action
       (write-long _action s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/PointStamped _position3D
       (send _position3D :serialize s)
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;; float32 _scale
       (sys::poke _scale (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; std_msgs/ColorRGBA _outline_color
       (send _outline_color :serialize s)
     ;; byte _filled
       (write-byte _filled s)
     ;; std_msgs/ColorRGBA _fill_color
       (send _fill_color :serialize s)
     ;; duration _lifetime
       (write-long (send _lifetime :sec) s) (write-long (send _lifetime :nsec) s)
     ;; byte _arc
       (write-byte _arc s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; image_view2/PointArrayStamped _points3D
       (send _points3D :serialize s)
     ;; std_msgs/ColorRGBA[] _outline_colors
     (write-long (length _outline_colors) s)
     (dolist (elem _outline_colors)
       (send elem :serialize s)
       )
     ;; string[] _frames
     (write-long (length _frames) s)
     (dolist (elem _frames)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string _text
       (write-long (length _text) s) (princ _text s)
     ;; bool _left_up_origin
       (if _left_up_origin (write-byte -1 s) (write-byte 0 s))
     ;; bool _ratio_scale
       (if _ratio_scale (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _ns
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ns (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/PointStamped _position3D
     (send _position3D :deserialize buf ptr-) (incf ptr- (send _position3D :serialization-length))
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _scale
     (setq _scale (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; std_msgs/ColorRGBA _outline_color
     (send _outline_color :deserialize buf ptr-) (incf ptr- (send _outline_color :serialization-length))
   ;; byte _filled
     (setq _filled (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _filled 127) (setq _filled (- _filled 256)))
   ;; std_msgs/ColorRGBA _fill_color
     (send _fill_color :deserialize buf ptr-) (incf ptr- (send _fill_color :serialization-length))
   ;; duration _lifetime
     (send _lifetime :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _lifetime :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; byte _arc
     (setq _arc (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _arc 127) (setq _arc (- _arc 256)))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; image_view2/PointArrayStamped _points3D
     (send _points3D :deserialize buf ptr-) (incf ptr- (send _points3D :serialization-length))
   ;; std_msgs/ColorRGBA[] _outline_colors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _outline_colors (let (r) (dotimes (i n) (push (instance std_msgs::ColorRGBA :init) r)) r))
     (dolist (elem- _outline_colors)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _frames
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _frames (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _frames i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string _text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _left_up_origin
     (setq _left_up_origin (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ratio_scale
     (setq _ratio_scale (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get image_view2::ImageMarker2 :md5sum-) "8efc23e411f94f2c04288719c078c291")
(setf (get image_view2::ImageMarker2 :datatype-) "image_view2/ImageMarker2")
(setf (get image_view2::ImageMarker2 :definition-)
      "byte CIRCLE=0
byte LINE_STRIP=1
byte LINE_LIST=2
byte POLYGON=3
byte POINTS=4
byte FRAMES=5
byte TEXT=6

byte LINE_STRIP3D=7
byte LINE_LIST3D=8
byte POLYGON3D=9
byte POINTS3D=10
byte TEXT3D=11
byte CIRCLE3D=12

byte ADD=0
byte REMOVE=1

Header header
string ns		# namespace, used with id to form a unique id
int32 id          	# unique id within the namespace
int32 type        	# CIRCLE/LINE_STRIP/etc.
int32 action      	# ADD/REMOVE
geometry_msgs/Point position # used for CIRCLE/TEXT, 2D in pixel-coords
geometry_msgs/PointStamped position3D # used for 3DTEXT
geometry_msgs/PoseStamped pose # used for CIRCLE3D
float32 scale	 	# the diameter for a circle, etc.
float32 width	 	# the width for a line, etc.
std_msgs/ColorRGBA outline_color
byte filled		# whether to fill in the shape with color
std_msgs/ColorRGBA fill_color # color [0.0-1.0]
duration lifetime       # How long the object should last before being automatically deleted.  0 means forever
byte arc # used for CIRCLE3D
float32 angle # used for CIRCLE3D


geometry_msgs/Point[] points # used for LINE_STRIP/LINE_LIST/POLYGON/POINTS., 2D in pixel coords
PointArrayStamped points3D # used for 3DLINE_STRIP/3DLINE_LIST/3DPOLYGON/3DPOINTS
std_msgs/ColorRGBA[] outline_colors # a color for each line, point, etc.

string[] frames # used for FRAMES, tf names
string text             # used for TEXT, draw size of text is scale
bool left_up_origin     # draw text from left up origin
bool ratio_scale        #Use ratio respected to original image to specify scale and position

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of postion and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

================================================================================
MSG: image_view2/PointArrayStamped
Header header

geometry_msgs/Point[] points


")



(provide :image_view2/ImageMarker2 "8efc23e411f94f2c04288719c078c291")


