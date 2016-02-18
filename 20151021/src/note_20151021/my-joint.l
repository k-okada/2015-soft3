(defclass my-joint
  :super propertied-object
  :slots (parent-link child-link joint-angle min-angle max-angle
		      defalut-coords))
(defmethod my-joint
  (:init (&key name
	       ((:child-link clink)) ((:parent-link plink))
	       (min -90) (max 90) &allow-other-keys)
	 (send self :name name)
	 (setq parent-link plink child-link clink
	       min-angle min max-angle max)
	 self))

(defclass my-rotational-joint
  :super joint
  :slots (axis))
(defmethod my-rotational-joint
  (:init (&rest args &key ((:axis ax) :z) &allow-other-keys)
	 (setq axis ax joint-angle 0.0)
	 (send-super* :init args)
	 self)
  (:joint-angle
   (&optional v)
   (when v
     (setq relang (- v joint-angle) joint-angle v)
     (send child-link :rotate (deg2rad relang) axis))
   joint-angle))
