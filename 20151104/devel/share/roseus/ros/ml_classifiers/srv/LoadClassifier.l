;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::LoadClassifier)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'LoadClassifier (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::LOADCLASSIFIER")
  (make-package "ML_CLASSIFIERS::LOADCLASSIFIER"))
(unless (find-package "ML_CLASSIFIERS::LOADCLASSIFIERREQUEST")
  (make-package "ML_CLASSIFIERS::LOADCLASSIFIERREQUEST"))
(unless (find-package "ML_CLASSIFIERS::LOADCLASSIFIERRESPONSE")
  (make-package "ML_CLASSIFIERS::LOADCLASSIFIERRESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::LoadClassifierRequest
  :super ros::object
  :slots (_identifier _class_type _filename ))

(defmethod ml_classifiers::LoadClassifierRequest
  (:init
   (&key
    ((:identifier __identifier) "")
    ((:class_type __class_type) "")
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   (setq _class_type (string __class_type))
   (setq _filename (string __filename))
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:class_type
   (&optional __class_type)
   (if __class_type (setq _class_type __class_type)) _class_type)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ;; string _class_type
    4 (length _class_type)
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;; string _class_type
       (write-long (length _class_type) s) (princ _class_type s)
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _class_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ml_classifiers::LoadClassifierResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::LoadClassifierResponse
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

(defclass ml_classifiers::LoadClassifier
  :super ros::object
  :slots ())

(setf (get ml_classifiers::LoadClassifier :md5sum-) "dea635b620b3bfb9b0fcfcd745a28947")
(setf (get ml_classifiers::LoadClassifier :datatype-) "ml_classifiers/LoadClassifier")
(setf (get ml_classifiers::LoadClassifier :request) ml_classifiers::LoadClassifierRequest)
(setf (get ml_classifiers::LoadClassifier :response) ml_classifiers::LoadClassifierResponse)

(defmethod ml_classifiers::LoadClassifierRequest
  (:response () (instance ml_classifiers::LoadClassifierResponse :init)))

(setf (get ml_classifiers::LoadClassifierRequest :md5sum-) "dea635b620b3bfb9b0fcfcd745a28947")
(setf (get ml_classifiers::LoadClassifierRequest :datatype-) "ml_classifiers/LoadClassifierRequest")
(setf (get ml_classifiers::LoadClassifierRequest :definition-)
      "string identifier
string class_type
string filename
---
bool success





")

(setf (get ml_classifiers::LoadClassifierResponse :md5sum-) "dea635b620b3bfb9b0fcfcd745a28947")
(setf (get ml_classifiers::LoadClassifierResponse :datatype-) "ml_classifiers/LoadClassifierResponse")
(setf (get ml_classifiers::LoadClassifierResponse :definition-)
      "string identifier
string class_type
string filename
---
bool success





")



(provide :ml_classifiers/LoadClassifier "dea635b620b3bfb9b0fcfcd745a28947")


