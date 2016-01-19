;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::SaveClassifier)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'SaveClassifier (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::SAVECLASSIFIER")
  (make-package "ML_CLASSIFIERS::SAVECLASSIFIER"))
(unless (find-package "ML_CLASSIFIERS::SAVECLASSIFIERREQUEST")
  (make-package "ML_CLASSIFIERS::SAVECLASSIFIERREQUEST"))
(unless (find-package "ML_CLASSIFIERS::SAVECLASSIFIERRESPONSE")
  (make-package "ML_CLASSIFIERS::SAVECLASSIFIERRESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::SaveClassifierRequest
  :super ros::object
  :slots (_identifier _filename ))

(defmethod ml_classifiers::SaveClassifierRequest
  (:init
   (&key
    ((:identifier __identifier) "")
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _identifier (string __identifier))
   (setq _filename (string __filename))
   self)
  (:identifier
   (&optional __identifier)
   (if __identifier (setq _identifier __identifier)) _identifier)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _identifier
    4 (length _identifier)
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _identifier
       (write-long (length _identifier) s) (princ _identifier s)
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _identifier
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _identifier (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ml_classifiers::SaveClassifierResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::SaveClassifierResponse
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

(defclass ml_classifiers::SaveClassifier
  :super ros::object
  :slots ())

(setf (get ml_classifiers::SaveClassifier :md5sum-) "dca3260ff732b49e8277c15729218301")
(setf (get ml_classifiers::SaveClassifier :datatype-) "ml_classifiers/SaveClassifier")
(setf (get ml_classifiers::SaveClassifier :request) ml_classifiers::SaveClassifierRequest)
(setf (get ml_classifiers::SaveClassifier :response) ml_classifiers::SaveClassifierResponse)

(defmethod ml_classifiers::SaveClassifierRequest
  (:response () (instance ml_classifiers::SaveClassifierResponse :init)))

(setf (get ml_classifiers::SaveClassifierRequest :md5sum-) "dca3260ff732b49e8277c15729218301")
(setf (get ml_classifiers::SaveClassifierRequest :datatype-) "ml_classifiers/SaveClassifierRequest")
(setf (get ml_classifiers::SaveClassifierRequest :definition-)
      "string identifier
string filename
---
bool success





")

(setf (get ml_classifiers::SaveClassifierResponse :md5sum-) "dca3260ff732b49e8277c15729218301")
(setf (get ml_classifiers::SaveClassifierResponse :datatype-) "ml_classifiers/SaveClassifierResponse")
(setf (get ml_classifiers::SaveClassifierResponse :definition-)
      "string identifier
string filename
---
bool success





")



(provide :ml_classifiers/SaveClassifier "dca3260ff732b49e8277c15729218301")


