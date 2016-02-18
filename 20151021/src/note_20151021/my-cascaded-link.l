(defclass my-cascaded-link
  :super cascaded-coords
  :slots (links joint-list bodies collision-avoidance-links))

(defmethod my-cascaded-link
  (:init (&rest args &key name &allow-other-keys)
	 (send-super-lexpr :init args)
	 self)
  (:init-ending
   ()
   (setq bodies (flatten (send-all links :bodies)))
   (dolist (j joint-list)
     (send (send j :child-link) :add-joint j)
     (send (send j :child-link) :add-parent-link (send j :parent-link))
     (send (send j :parent-link) :add-child-links (send j :child-link)))
   (send self :update-descendants))
)
