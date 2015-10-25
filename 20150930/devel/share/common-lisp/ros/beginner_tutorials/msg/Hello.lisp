; Auto-generated. Do not edit!


(cl:in-package beginner_tutorials-msg)


;//! \htmlinclude Hello.msg.html

(cl:defclass <Hello> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (hello
    :reader hello
    :initarg :hello
    :type cl:string
    :initform "")
   (pos
    :reader pos
    :initarg :pos
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass Hello (<Hello>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Hello>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Hello)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name beginner_tutorials-msg:<Hello> is deprecated: use beginner_tutorials-msg:Hello instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Hello>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:header-val is deprecated.  Use beginner_tutorials-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'hello-val :lambda-list '(m))
(cl:defmethod hello-val ((m <Hello>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:hello-val is deprecated.  Use beginner_tutorials-msg:hello instead.")
  (hello m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <Hello>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader beginner_tutorials-msg:pos-val is deprecated.  Use beginner_tutorials-msg:pos instead.")
  (pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Hello>) ostream)
  "Serializes a message object of type '<Hello>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hello))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hello))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Hello>) istream)
  "Deserializes a message object of type '<Hello>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hello) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hello) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Hello>)))
  "Returns string type for a message object of type '<Hello>"
  "beginner_tutorials/Hello")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Hello)))
  "Returns string type for a message object of type 'Hello"
  "beginner_tutorials/Hello")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Hello>)))
  "Returns md5sum for a message object of type '<Hello>"
  "a5d5980a408f71ddd964a3f012b4dd59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Hello)))
  "Returns md5sum for a message object of type 'Hello"
  "a5d5980a408f71ddd964a3f012b4dd59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Hello>)))
  "Returns full string definition for message of type '<Hello>"
  (cl:format cl:nil "Header header~%string hello~%geometry_msgs/Vector3 pos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Hello)))
  "Returns full string definition for message of type 'Hello"
  (cl:format cl:nil "Header header~%string hello~%geometry_msgs/Vector3 pos~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Hello>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'hello))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Hello>))
  "Converts a ROS message object to a list"
  (cl:list 'Hello
    (cl:cons ':header (header msg))
    (cl:cons ':hello (hello msg))
    (cl:cons ':pos (pos msg))
))
