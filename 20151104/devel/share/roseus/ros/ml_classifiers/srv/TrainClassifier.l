;; Auto-generated. Do not edit!


(when (boundp 'ml_classifiers::TrainClassifier)
  (if (not (find-package "ML_CLASSIFIERS"))
    (make-package "ML_CLASSIFIERS"))
  (shadow 'TrainClassifier (find-package "ML_CLASSIFIERS")))
(unless (find-package "ML_CLASSIFIERS::TRAINCLASSIFIER")
  (make-package "ML_CLASSIFIERS::TRAINCLASSIFIER"))
(unless (find-package "ML_CLASSIFIERS::TRAINCLASSIFIERREQUEST")
  (make-package "ML_CLASSIFIERS::TRAINCLASSIFIERREQUEST"))
(unless (find-package "ML_CLASSIFIERS::TRAINCLASSIFIERRESPONSE")
  (make-package "ML_CLASSIFIERS::TRAINCLASSIFIERRESPONSE"))

(in-package "ROS")





(defclass ml_classifiers::TrainClassifierRequest
  :super ros::object
  :slots (_identifier ))

(defmethod ml_classifiers::TrainClassifierRequest
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

(defclass ml_classifiers::TrainClassifierResponse
  :super ros::object
  :slots (_success ))

(defmethod ml_classifiers::TrainClassifierResponse
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

(defclass ml_classifiers::TrainClassifier
  :super ros::object
  :slots ())

(setf (get ml_classifiers::TrainClassifier :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::TrainClassifier :datatype-) "ml_classifiers/TrainClassifier")
(setf (get ml_classifiers::TrainClassifier :request) ml_classifiers::TrainClassifierRequest)
(setf (get ml_classifiers::TrainClassifier :response) ml_classifiers::TrainClassifierResponse)

(defmethod ml_classifiers::TrainClassifierRequest
  (:response () (instance ml_classifiers::TrainClassifierResponse :init)))

(setf (get ml_classifiers::TrainClassifierRequest :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::TrainClassifierRequest :datatype-) "ml_classifiers/TrainClassifierRequest")
(setf (get ml_classifiers::TrainClassifierRequest :definition-)
      "string identifier
---
bool success





")

(setf (get ml_classifiers::TrainClassifierResponse :md5sum-) "126e80d7c8d36adbb3fd063504a07c0d")
(setf (get ml_classifiers::TrainClassifierResponse :datatype-) "ml_classifiers/TrainClassifierResponse")
(setf (get ml_classifiers::TrainClassifierResponse :definition-)
      "string identifier
---
bool success





")



(provide :ml_classifiers/TrainClassifier "126e80d7c8d36adbb3fd063504a07c0d")


