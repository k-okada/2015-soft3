(defclass ufo-robot
	:super cascaded-link
	:slots (end-coords l1 l2 l3 l4 j1 j2 j3))

(defmethod ufo-robot
	(:init ()
		(let (b1 b2)
			(send-super :init)

			(setq b1 (make-cube 40 10 10))
			(send b1 :locate #f(20 0 0))
			(send b1 :set-color :red)
			(setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b1) :name 'l4))
			(setq end-coords (make-cascoords :pos #f(40 0 0)))
			(send l4 :assoc end-coords)
			(send l4 :locate #f(0 0 0))

			(setq b1 (make-cube 20 20 20))
			(send b1 :locate #f(0 0 0))
			(send b1 :set-color :green)
			(setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b1) :name 'l3))
			(send l3 :assoc l4)
			(send l3 :locate #f(0 0 -50))

			(setq b1 (make-cube 10 10 200))
			(setq b2 (make-cylinder 10 10))
			(send b1 :locate #f(0 0 -100))
			(setq b1 (body+ b1 b2))
			(send b1 :locate #f(0 0 0))
			(send b1 :set-color :blue)
			(setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b1) :name 'l2))
			(send l2 :assoc l3)
			(send l2 :locate #f(0 0 150))

			(setq b1 (body- (make-cube 200 200 400) (make-cube 199 200 399)))
			(send b1 :set-color :yellow)
			(setq b2 (make-cube 190 10 10))
			(send b2 :set-color :black)
			(send b2 :locate #f(0 0 150))
			(setq b1 (body+ b1 b2))
			(setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b1) :name 'l1))
			(send l1 :assoc l2)

			(setq
				j1 (instance linear-joint :init :name 'j1 :parent-link l1 :child-link l2 :axis :x :min -50 :max 50)
				j2 (instance linear-joint :init :name 'j2 :parent-link l2 :child-link l3 :axis :z :min -200 :max 200)
				j3 (instance rotational-joint :init :name 'j3 :parent-link l3 :child-link l4 :axis :z :min -360 :max 360))
			(setq links (list l1 l2 l3 l4))
			(setq joint-list (list j1 j2 j3))
			(send self :init-ending)
			self))
	(:end-coords (&rest args) (forward-message-to end-coords args))
)

(setq r (instance ufo-robot :init))
(objects (list r (send r :end-coords)))


(setq translation-axis t)
(setq rotation-axis nil)
(dotimes (i 500)
	(setq c (make-cascoords
		:pos (float-vector (+ 0 (* 50 (sin (/ i 100.0))))
				(+ 0 (* 50 (sin (/ i 50.0))))
				(+ 0 (* 50 (sin (/ i 75.0)))))
		:rpy (float-vector 0 pi 0)))
	(send r :inverse-kinematics c
		:link-list (send r :link-list (send r :end-coords :parent))
		:move-target (send r :end-coords)
		:rotation-axis t
		:translation-axis t
		;:debug-view t
		:revert-if-fail nil)
	(x::window-main-one)
	(send *irtviewer* :draw-objects :flush nil)
	(send c :draw-on :flush t))
