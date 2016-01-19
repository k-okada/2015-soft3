;; Auto-generated. Do not edit!


(when (boundp 'image_view2::ChangeMode)
  (if (not (find-package "IMAGE_VIEW2"))
    (make-package "IMAGE_VIEW2"))
  (shadow 'ChangeMode (find-package "IMAGE_VIEW2")))
(unless (find-package "IMAGE_VIEW2::CHANGEMODE")
  (make-package "IMAGE_VIEW2::CHANGEMODE"))
(unless (find-package "IMAGE_VIEW2::CHANGEMODEREQUEST")
  (make-package "IMAGE_VIEW2::CHANGEMODEREQUEST"))
(unless (find-package "IMAGE_VIEW2::CHANGEMODERESPONSE")
  (make-package "IMAGE_VIEW2::CHANGEMODERESPONSE"))

(in-package "ROS")





(defclass image_view2::ChangeModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod image_view2::ChangeModeRequest
  (:init
   (&key
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _mode (string __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass image_view2::ChangeModeResponse
  :super ros::object
  :slots ())

(defmethod image_view2::ChangeModeResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass image_view2::ChangeMode
  :super ros::object
  :slots ())

(setf (get image_view2::ChangeMode :md5sum-) "e84dc3ad5dc323bb64f0aca01c2d1eef")
(setf (get image_view2::ChangeMode :datatype-) "image_view2/ChangeMode")
(setf (get image_view2::ChangeMode :request) image_view2::ChangeModeRequest)
(setf (get image_view2::ChangeMode :response) image_view2::ChangeModeResponse)

(defmethod image_view2::ChangeModeRequest
  (:response () (instance image_view2::ChangeModeResponse :init)))

(setf (get image_view2::ChangeModeRequest :md5sum-) "e84dc3ad5dc323bb64f0aca01c2d1eef")
(setf (get image_view2::ChangeModeRequest :datatype-) "image_view2/ChangeModeRequest")
(setf (get image_view2::ChangeModeRequest :definition-)
      "string mode
---

")

(setf (get image_view2::ChangeModeResponse :md5sum-) "e84dc3ad5dc323bb64f0aca01c2d1eef")
(setf (get image_view2::ChangeModeResponse :datatype-) "image_view2/ChangeModeResponse")
(setf (get image_view2::ChangeModeResponse :definition-)
      "string mode
---

")



(provide :image_view2/ChangeMode "e84dc3ad5dc323bb64f0aca01c2d1eef")


