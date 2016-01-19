;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::ClassDataPoint)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'ClassDataPoint (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::CLASSDATAPOINT")
  (make-package "ML_CLASSIFIERS::CLASSDATAPOINT"))

(in-package "ROS")
;;//! \htmlinclude ClassDataPoint.msg.html


(defclass ml_classifiers::ClassDataPoint
  :super ros::object
  :slots (_target_class _point ))

(defmethod ml_classifiers::ClassDataPoint
  (:init
   (&key
    ((:target_class __target_class) "")
    ((:point __point) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _target_class (string __target_class))
   (setq _point __point)
   self)
  (:target_class
   (&optional __target_class)
   (if __target_class (setq _target_class __target_class)) _target_class)
  (:point
   (&optional __point)
   (if __point (setq _point __point)) _point)
  (:serialization-length
   ()
   (+
    ;; string _target_class
    4 (length _target_class)
    ;; float64[] _point
    (* 8    (length _point)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _target_class
       (write-long (length _target_class) s) (princ _target_class s)
     ;; float64[] _point
     (write-long (length _point) s)
     (dotimes (i (length _point))
       (sys::poke (elt _point i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _target_class
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target_class (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _point i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ml_classifiers::ClassDataPoint :md5sum-) "46bea2d2ef979a71ef0bfa470e5978ff")
(setf (get ml_classifiers::ClassDataPoint :datatype-) "ml_classifiers/ClassDataPoint")
(setf (get ml_classifiers::ClassDataPoint :definition-)
      "string target_class
float64[] point

")



(provide :ml_classifiers/ClassDataPoint "46bea2d2ef979a71ef0bfa470e5978ff")


