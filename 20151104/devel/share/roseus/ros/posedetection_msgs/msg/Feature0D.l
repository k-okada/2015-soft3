;; Auto-generated. Do not edit!


(when (boundp 'posedetection_msgs::Feature0D)
  (if (not (find-package "POSEDETECTION_MSGS"))
    (make-package "POSEDETECTION_MSGS"))
  (shadow 'Feature0D (find-package "POSEDETECTION_MSGS")))
(unless (find-package "POSEDETECTION_MSGS::FEATURE0D")
  (make-package "POSEDETECTION_MSGS::FEATURE0D"))

(in-package "ROS")
;;//! \htmlinclude Feature0D.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass posedetection_msgs::Feature0D
  :super ros::object
  :slots (_header _positions _scales _orientations _confidences _descriptors _descriptor_dim _type ))

(defmethod posedetection_msgs::Feature0D
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:scales __scales) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:orientations __orientations) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:confidences __confidences) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:descriptors __descriptors) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:descriptor_dim __descriptor_dim) 0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _positions __positions)
   (setq _scales __scales)
   (setq _orientations __orientations)
   (setq _confidences __confidences)
   (setq _descriptors __descriptors)
   (setq _descriptor_dim (round __descriptor_dim))
   (setq _type (string __type))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:scales
   (&optional __scales)
   (if __scales (setq _scales __scales)) _scales)
  (:orientations
   (&optional __orientations)
   (if __orientations (setq _orientations __orientations)) _orientations)
  (:confidences
   (&optional __confidences)
   (if __confidences (setq _confidences __confidences)) _confidences)
  (:descriptors
   (&optional __descriptors)
   (if __descriptors (setq _descriptors __descriptors)) _descriptors)
  (:descriptor_dim
   (&optional __descriptor_dim)
   (if __descriptor_dim (setq _descriptor_dim __descriptor_dim)) _descriptor_dim)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _positions
    (* 4    (length _positions)) 4
    ;; float32[] _scales
    (* 4    (length _scales)) 4
    ;; float32[] _orientations
    (* 4    (length _orientations)) 4
    ;; float32[] _confidences
    (* 4    (length _confidences)) 4
    ;; float32[] _descriptors
    (* 4    (length _descriptors)) 4
    ;; int32 _descriptor_dim
    4
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _positions
     (write-long (length _positions) s)
     (dotimes (i (length _positions))
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _scales
     (write-long (length _scales) s)
     (dotimes (i (length _scales))
       (sys::poke (elt _scales i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _orientations
     (write-long (length _orientations) s)
     (dotimes (i (length _orientations))
       (sys::poke (elt _orientations i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _confidences
     (write-long (length _confidences) s)
     (dotimes (i (length _confidences))
       (sys::poke (elt _confidences i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _descriptors
     (write-long (length _descriptors) s)
     (dotimes (i (length _descriptors))
       (sys::poke (elt _descriptors i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _descriptor_dim
       (write-long _descriptor_dim s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _positions i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _scales
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _scales (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _scales i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _orientations
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _orientations (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _orientations i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _confidences
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidences (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidences i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _descriptors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descriptors (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _descriptors i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _descriptor_dim
     (setq _descriptor_dim (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get posedetection_msgs::Feature0D :md5sum-) "fcb3ba42a42cf972f3838cdb171f5e04")
(setf (get posedetection_msgs::Feature0D :datatype-) "posedetection_msgs/Feature0D")
(setf (get posedetection_msgs::Feature0D :definition-)
      "Header header
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



(provide :posedetection_msgs/Feature0D "fcb3ba42a42cf972f3838cdb171f5e04")


