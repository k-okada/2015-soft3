;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::ClearClassifier)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'ClearClassifier (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::CLEARCLASSIFIER")
  (make-package "ML_CLASSIFIERS::CLEARCLASSIFIER"))
(unless (find-package "ML_CLASSIFIERS::CLEARCLASSIFIERREQUEST")
  (make-package "ML_CLASSIFIERS::CLEARCLASSIFIERREQUEST"))
(unless (find-package "ML_CLASSIFIERS::CLEARCLASSIFIERRESPONSE")
  (make-package "ML_CLASSIFIERS::CLEARCLASSIFIERRESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::ClearClassifierRequest
  :super ros::object
  :slots (_identifier ))

(defmethod ml_classifiers::ClearClassifierRequest
  (:init
   (&key
    ((:identifier __identifier) "")
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ml_classifiers::ClearClassifierResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::ClearClassifierResponse
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

(defclass ml_classifiers::ClearClassifier
  :super ros::object
  :slots ())

(setf (get ml_classifiers::ClearClassifier :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::ClearClassifier :datatype-) "ml_classifiers/ClearClassifier")
(setf (get ml_classifiers::ClearClassifier :request) ml_classifiers::ClearClassifierRequest)
(setf (get ml_classifiers::ClearClassifier :response) ml_classifiers::ClearClassifierResponse)

(defmethod ml_classifiers::ClearClassifierRequest
  (:response () (instance ml_classifiers::ClearClassifierResponse :init)))

(setf (get ml_classifiers::ClearClassifierRequest :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::ClearClassifierRequest :datatype-) "ml_classifiers/ClearClassifierRequest")
(setf (get ml_classifiers::ClearClassifierRequest :definition-)
      "string identifier
---
bool success





")

(setf (get ml_classifiers::ClearClassifierResponse :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::ClearClassifierResponse :datatype-) "ml_classifiers/ClearClassifierResponse")
(setf (get ml_classifiers::ClearClassifierResponse :definition-)
      "string identifier
---
bool success





")



(provide :ml_classifiers/ClearClassifier "126e80d7c8d36adbb3fd063504a07c0d")


