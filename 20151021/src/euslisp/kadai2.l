;;(if (not (boundp '*irtviewer*)) (make-irtviewer))

(defun make-piston-cylinder nil
  (let (b1 b2)
    (setq b1 (make-cylinder 10 50))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cylinder 6 50))
    (send b2 :locate #f(0 0 0))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :red)
    b1))

(defun make-piston nil 
  (let (b1 b2 b3 b4 b5)
    (setq b1 (make-cylinder 7.9 15 ))
    (setq b2 (make-cylinder 2 10))
    (send b2 :locate #f(0 0 15))
    (setq b3 (make-cube 6 10 2))
    (send b3 :locate #f(0 0 25))
    (setq b4 (body+ b1 b2))
    (send b3 :set-color :gray80)
    (send b4 :set-color :white)
    (setq b5 (body+ b3 b4))
    b5))
    

(setq c1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-piston-cylinder))))
(setq p1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-piston))))
(setq a1 (instance rotational-joint :init :parent-link c1 :child-link p1 :axis :z))

(setq r (instance cascaded-link :init))
(send r :assoc c1)
(send c1 :assoc p1)
(setq (r . links) (list c1 p1))
(setq (r . joint-list) (list a1))
(send r :init-ending)

