
(cl:in-package :asdf)

(defsystem "begineer_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Hello" :depends-on ("_package_Hello"))
    (:file "_package_Hello" :depends-on ("_package"))
  ))