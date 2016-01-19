;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::AddClassData)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'AddClassData (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::ADDCLASSDATA")
  (make-package "ML_CLASSIFIERS::ADDCLASSDATA"))
(unless (find-package "ML_CLASSIFIERS::ADDCLASSDATAREQUEST")
  (make-package "ML_CLASSIFIERS::ADDCLASSDATAREQUEST"))
(unless (find-package "ML_CLASSIFIERS::ADDCLASSDATARESPONSE")
  (make-package "ML_CLASSIFIERS::ADDCLASSDATARESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::AddClassDataRequest
  :super ros::object
  :slots (_identifier _data ))

(defmethod ml_classifiers::AddClassDataRequest
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

(defclass ml_classifiers::AddClassDataResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::AddClassDataResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ml_classifiers::AddClassData
  :super ros::object
  :slots ())

(setf (get ml_classifiers::AddClassData :md5sum-) "d4c3cb23d4d2e3dec5588818fec39e8c")
(setf (get ml_classifiers::AddClassData :datatype-) "ml_classifiers/AddClassData")
(setf (get ml_classifiers::AddClassData :request) ml_classifiers::AddClassDataRequest)
(setf (get ml_classifiers::AddClassData :response) ml_classifiers::AddClassDataResponse)

(defmethod ml_classifiers::AddClassDataRequest
  (:response () (instance ml_classifiers::AddClassDataResponse :init)))

(setf (get ml_classifiers::AddClassDataRequest :md5sum-) "d4c3cb23d4d2e3dec5588818fec39e8c")
(setf (get ml_classifiers::AddClassDataRequest :datatype-) "ml_classifiers/AddClassDataRequest")
(setf (get ml_classifiers::AddClassDataRequest :definition-)
      "string identifier
ClassDataPoint[] data

================================================================================
MSG: ml_classifiers/ClassDataPoint
string target_class
float64[] point
---
bool success





")

(setf (get ml_classifiers::AddClassDataResponse :md5sum-) "d4c3cb23d4d2e3dec5588818fec39e8c")
(setf (get ml_classifiers::AddClassDataResponse :datatype-) "ml_classifiers/AddClassDataResponse")
(setf (get ml_classifiers::AddClassDataResponse :definition-)
      "string identifier
ClassDataPoint[] data

================================================================================
MSG: ml_classifiers/ClassDataPoint
string target_class
float64[] point
---
bool success





")



(provide :ml_classifiers/AddClassData "d4c3cb23d4d2e3dec5588818fec39e8c")


