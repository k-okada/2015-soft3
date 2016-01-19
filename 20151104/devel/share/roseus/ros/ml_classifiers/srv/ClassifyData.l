;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::ClassifyData)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'ClassifyData (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::CLASSIFYDATA")
  (make-package "ML_CLASSIFIERS::CLASSIFYDATA"))
(unless (find-package "ML_CLASSIFIERS::CLASSIFYDATAREQUEST")
  (make-package "ML_CLASSIFIERS::CLASSIFYDATAREQUEST"))
(unless (find-package "ML_CLASSIFIERS::CLASSIFYDATARESPONSE")
  (make-package "ML_CLASSIFIERS::CLASSIFYDATARESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::ClassifyDataRequest
  :super ros::object
  :slots (_identifier _data ))

(defmethod ml_classifiers::ClassifyDataRequest
  (:init
   (&key
    ((:identifier __identifier) "")
    ((:data __data) (let (r) (dotimes (i 0) (push (instance ml_classifiers::ClassDataPoint :init) r)) r))
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   (setq _data __data)
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ;; ml_classifiers/ClassDataPoint[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;; ml_classifiers/ClassDataPoint[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; ml_classifiers/ClassDataPoint[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance ml_classifiers::ClassDataPoint :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ml_classifiers::ClassifyDataResponse
  :super ros::object
  :slots (_classifications ))

(defmethod ml_classifiers::ClassifyDataResponse
  (:init
   (&key
    ((:classifications __classifications) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _classifications __classifications)
   self)
  (:classifications
   (&optional __classifications)
   (if __classifications (setq _classifications __classifications)) _classifications)
  (:serialization-length
   ()
   (+
    ;; string[] _classifications
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _classifications)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _classifications
     (write-long (length _classifications) s)
     (dolist (elem _classifications)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _classifications
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _classifications (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _classifications i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass ml_classifiers::ClassifyData
  :super ros::object
  :slots ())

(setf (get ml_classifiers::ClassifyData :md5sum-) "5ee7ec82bea2c231e357662def7bf4a4")
(setf (get ml_classifiers::ClassifyData :datatype-) "ml_classifiers/ClassifyData")
(setf (get ml_classifiers::ClassifyData :request) ml_classifiers::ClassifyDataRequest)
(setf (get ml_classifiers::ClassifyData :response) ml_classifiers::ClassifyDataResponse)

(defmethod ml_classifiers::ClassifyDataRequest
  (:response () (instance ml_classifiers::ClassifyDataResponse :init)))

(setf (get ml_classifiers::ClassifyDataRequest :md5sum-) "5ee7ec82bea2c231e357662def7bf4a4")
(setf (get ml_classifiers::ClassifyDataRequest :datatype-) "ml_classifiers/ClassifyDataRequest")
(setf (get ml_classifiers::ClassifyDataRequest :definition-)
      "string identifier
ClassDataPoint[] data

================================================================================
MSG: ml_classifiers/ClassDataPoint
string target_class
float64[] point
---
string[] classifications





")

(setf (get ml_classifiers::ClassifyDataResponse :md5sum-) "5ee7ec82bea2c231e357662def7bf4a4")
(setf (get ml_classifiers::ClassifyDataResponse :datatype-) "ml_classifiers/ClassifyDataResponse")
(setf (get ml_classifiers::ClassifyDataResponse :definition-)
      "string identifier
ClassDataPoint[] data

================================================================================
MSG: ml_classifiers/ClassDataPoint
string target_class
float64[] point
---
string[] classifications





")



(provide :ml_classifiers/ClassifyData "5ee7ec82bea2c231e357662def7bf4a4")


