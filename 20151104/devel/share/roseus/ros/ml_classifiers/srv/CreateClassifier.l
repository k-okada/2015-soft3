;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::CreateClassifier)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'CreateClassifier (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::CREATECLASSIFIER")
  (make-package "ML_CLASSIFIERS::CREATECLASSIFIER"))
(unless (find-package "ML_CLASSIFIERS::CREATECLASSIFIERREQUEST")
  (make-package "ML_CLASSIFIERS::CREATECLASSIFIERREQUEST"))
(unless (find-package "ML_CLASSIFIERS::CREATECLASSIFIERRESPONSE")
  (make-package "ML_CLASSIFIERS::CREATECLASSIFIERRESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::CreateClassifierRequest
  :super ros::object
  :slots (_identifier _class_type ))

(defmethod ml_classifiers::CreateClassifierRequest
  (:init
   (&key
    ((:identifier __identifier) "")
    ((:class_type __class_type) "")
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   (setq _class_type (string __class_type))
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:class_type
   (&optional __class_type)
   (if __class_type (setq _class_type __class_type)) _class_type)
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ;; string _class_type
    4 (length _class_type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;; string _class_type
       (write-long (length _class_type) s) (princ _class_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _class_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _class_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ml_classifiers::CreateClassifierResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::CreateClassifierResponse
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

(defclass ml_classifiers::CreateClassifier
  :super ros::object
  :slots ())

(setf (get ml_classifiers::CreateClassifier :md5sum-) "99a1fae9581fcf2bc80fd6e5aed6e8ee")
(setf (get ml_classifiers::CreateClassifier :datatype-) "ml_classifiers/CreateClassifier")
(setf (get ml_classifiers::CreateClassifier :request) ml_classifiers::CreateClassifierRequest)
(setf (get ml_classifiers::CreateClassifier :response) ml_classifiers::CreateClassifierResponse)

(defmethod ml_classifiers::CreateClassifierRequest
  (:response () (instance ml_classifiers::CreateClassifierResponse :init)))

(setf (get ml_classifiers::CreateClassifierRequest :md5sum-) "99a1fae9581fcf2bc80fd6e5aed6e8ee")
(setf (get ml_classifiers::CreateClassifierRequest :datatype-) "ml_classifiers/CreateClassifierRequest")
(setf (get ml_classifiers::CreateClassifierRequest :definition-)
      "string identifier
string class_type
---
bool success





")

(setf (get ml_classifiers::CreateClassifierResponse :md5sum-) "99a1fae9581fcf2bc80fd6e5aed6e8ee")
(setf (get ml_classifiers::CreateClassifierResponse :datatype-) "ml_classifiers/CreateClassifierResponse")
(setf (get ml_classifiers::CreateClassifierResponse :definition-)
      "string identifier
string class_type
---
bool success





")



(provide :ml_classifiers/CreateClassifier "99a1fae9581fcf2bc80fd6e5aed6e8ee")


