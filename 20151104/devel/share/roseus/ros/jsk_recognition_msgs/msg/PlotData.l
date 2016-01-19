;; Auto-generated. Do not edit!


(when (boundp 'jsk_recognition_msgs::PlotData)
  (if (not (find-package "JSK_RECOGNITION_MSGS"))
    (make-package "JSK_RECOGNITION_MSGS"))
  (shadow 'PlotData (find-package "JSK_RECOGNITION_MSGS")))
(unless (find-package "JSK_RECOGNITION_MSGS::PLOTDATA")
  (make-package "JSK_RECOGNITION_MSGS::PLOTDATA"))

(in-package "ROS")
;;//! \htmlinclude PlotData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass jsk_recognition_msgs::PlotData
  :super ros::object
  :slots (_header _xs _ys ))

(defmethod jsk_recognition_msgs::PlotData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:xs __xs) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ys __ys) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _xs __xs)
   (setq _ys __ys)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:xs
   (&optional __xs)
   (if __xs (setq _xs __xs)) _xs)
  (:ys
   (&optional __ys)
   (if __ys (setq _ys __ys)) _ys)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _xs
    (* 4    (length _xs)) 4
    ;; float32[] _ys
    (* 4    (length _ys)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _xs
     (write-long (length _xs) s)
     (dotimes (i (length _xs))
       (sys::poke (elt _xs i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _ys
     (write-long (length _ys) s)
     (dotimes (i (length _ys))
       (sys::poke (elt _ys i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _xs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _xs (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _xs i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _ys
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ys (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ys i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get jsk_recognition_msgs::PlotData :md5sum-) "60e34e04b1cce095da585e105273c3c3")
(setf (get jsk_recognition_msgs::PlotData :datatype-) "jsk_recognition_msgs/PlotData")
(setf (get jsk_recognition_msgs::PlotData :definition-)
      "Header header
float32[] xs
float32[] ys

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



(provide :jsk_recognition_msgs/PlotData "60e34e04b1cce095da585e105273c3c3")


