(defun make-part1 nil
  (let (b1)
	(setq b1 (make-cylinder 3 120))
	(send b1 :locate #f(0 0 2))
	(send b1 :set-color :gray20)
	b1))

(defun make-part2 nil
  (let (b1 b2)
	(setq b1 (make-cylinder 3 100))
	(send b1 :locate #f(0 0 2))
	(setq b2 (make-cylinder 6 100))
	(send b2 :locate #f(0 0 0))
	(setq b2 (body- b2 b1))
	(send b2 :set-color :gray80)
	b2))

(setq p1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-part1))))
(setq p2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-part2))))
(setq j1 (instance linear-joint :init :parent-link p2 :child-link p1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc p2)
(send p2 :assoc p1)
(setq (r . links) (list p2 p1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

