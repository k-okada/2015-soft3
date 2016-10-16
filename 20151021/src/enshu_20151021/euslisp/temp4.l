(defun make-fridge-part1 nil
  (let (b1 b2 b3)
	(setq b1 (make-cube 100 100 200))
	(setq b2 (make-cube 100 90 90))
	(setq b3 (make-cube 100 90 90))
	(send b2 :locate #f(5 0 50))
	(send b3 :locate #f(5 0 -50))
	(setq b1 (body- b1 b2))
	(setq b1 (body- b1 b3))
	(send b1 :set-color :gray80)
	b1))

(defun make-fridge-part2 nil
  (let (b1)
	(setq b1 (make-cube 10 100 100))
	(send b1 :locate #f(5 -50 50))
	(send b1 :set-color :gray 80)
	b1))

(defun make-fridge-part3 nil
  (let (b1 b2 b3)
	(setq b1 (make-cube 95 90 90))
	(setq b2 (make-cube 90 80 85))
	(setq b3 (make-cube 10 100 100))
	(send b2 :locate #f(2.5 0 2.5))
	(send b3 :locate #f(52.5 0 0))
	(setq b1 (body- b1 b2))
	(setq b1 (body+ b1 b3))
	(send b1 :set-color :gray 80)
	b1))

(defclass fridge-model
  :super cascaded-link
  :slots (p1 p2 p3 l1 l2 l3))
(defmethod fridge-model
  (:init ()
	(let ()
	  (send-super :init)
	  (setq p1 (make-fridge-part1))
	  (setq p2 (make-fridge-part2))
	  (setq p3 (make-fridge-part3))
	  (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list p1)))
	  (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list p2)))
	  (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list p3)))
	  (send l2 :locate #f(50 50 0))
	  (send l3 :locate #f(2.5 0 -50))

	  (send self :assoc l1)
	  (send l1 :assoc l2)
	  (send l1 :assoc l3)

	  (setq joint-list
			(list
			  (instance rotational-joint
						:init :parent-link l1 :child-link l2
						:axis :z)
			  (instance linear-joint
						:init :parent-link l1 :child-link l3
						:axis :x)))
	  (setq links (list l1 l2 l3))
	  (send self :init-ending)
	  )))

(defun make-linear-part1 nil
  (let (b1)
	(setq b1 (make-cylinder 3 120))
	(send b1 :locate #f(0 0 2))
	(send b1 :set-color :gray20)
	b1))

(defun make-linear-part2 nil
  (let (b1 b2)
	(setq b1 (make-cylinder 3 100))
	(send b1 :locate #f(0 0 2))
	(setq b2 (make-cylinder 6 100))
	(send b2 :locate #f(0 0 0))
	(setq b2 (body- b2 b1))
	(send b2 :set-color :gray80)
	b2))

(defclass linear-actuator
  :super cascaded-link
  :slots (p1 p2 l1 l2))
(defmethod linear-actuator
  (:init ()
	(let ()
	  (send-super :init)
	  (setq p1 (make-linear-part1))
	  (setq p2 (make-linear-part2))
	  (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list p1)))
	  (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list p2)))

	  (send self :assoc l1)
	  (send l1 :assoc l2)

	  (setq joint-list
			(list
			  (instance linear-joint
						:init :parent-link l1 :child-link l2
						:axis :z)))
	  (setq links (list l1 l2))
	  (send self :init-ending)
	  )))

(setq r1 (instance fridge-model :init))
(setq r2 (make-cube 50 50 50))
(send r1 :locate #f(0 0 -100))
(send r2 :locate #f(0 0 25))

(objects (list r1 r2))
(setq i 0)
(setq j 0)
(do-until-key
  (cond ((< i 50)
		 (send r2 :assoc r1)
		 (send r2 :locate #f(0 0 1)))
		((< i 100)
		 (send r2 :locate #f(0 0 -1)))
		((< i 150)
		 (send r2 :dissoc r1)
		 (send r2 :locate #f(0 0 1)))
		((< i 200)
		 (send r2 :locate #f(0 0 -1)))
		(t
		  (setq i 0)))
 ;; (send r2 :locate #f(0 0 (* 100 (sin (/ j 50)))))
  (send r1 :angle-vector (float-vector (+ 45 (* 45 (sin (/ j 20.0)))) (+ 40 (- 0 (* 40 (cos (/ j 25.0)))))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  (incf j)
  (incf i))
