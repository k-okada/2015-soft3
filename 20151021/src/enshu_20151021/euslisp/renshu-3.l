#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

#|

(defclass cascaded-link
  :super cascaded-coords
  :slots (links joint-list bodies collision-aviodance-links))

(defmethod cascaded-link
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
|#

(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))

(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
	(b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
;    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))
 
;(defun make-frame-1 nil
;  (let (b1 b2 b3 b4)
;    (setq b1 (make-cube 20 20 100))
;    (send b1 :locate #f(25.0 0 0))
;    (setq b2 (make-cube 50 20 20))
;    (send b2 :locate #f(0 0 50.0))
;    (setq b1 (body+ b1 b2))
;    (setq b3 (make-cube 20 20 100))
;    (send b3 :locate #f(-25.0 0 0))
;    (setq b4 (make-cube 50 20 20))
;    (send b4 :locate #f(0 0 -50.0))
;    (setq b3 (body+ b3 b4))    
;    (setq b3 (body+ b3 b4))
;    (setq b1 (body+ b1 b3))
;    (objects (list b1))
;    )
;  )

;(defun make-frame-2 nil
;  (let (b1 b2)
;    (setq b1 (make-cube 20 20 100))
;    (send b1 :locate #f(-25.0 0 0))
;    (setq b2 (make-cube 50 20 20))
;    (send b2 :locate #f(0 0 -50.0))
;    (setq b1 (body+ b1 b2))
;    )
;  )

(defun make-boad nil
  (let (b1)
    (setq b1 (make-cube 80 20 160))
    (send b1 :locate #f(40 0 0))
    (setq b2 (make-cylinder 10 30))
    (send b2 :locate #f(65.0 20.0 0.0))
    (send b2 :rotate pi/2 :x)
;    (send b1 :set-color :green)
;接しているとbody+はダメらしい
    (setq b1 (body+ b1 b2))
;    (setq b1 (instance bodyset :init
;		       (make-cascoords)
;		       :bodies (list b1 b2)))
    (send b1 :locate #f(0 0 0))
    (list b1))
  )

(defun make-chou nil
  (let (b1 b2)
    (setq b1 (make-cylinder 10 10))
    (send b1 :set-color :gray20)
    (send b1 :locate #f(-10 0 50))
    (setq b2 (make-cylinder 10 10))
    (send b2 :locate #f(-10 0 -50))
    (send b2 :set-color :gray20)
;    (setq chou (instance bodyset :init
;			 (make-cascoords)
;			 :bodies (list b1 b2)))
    (list b1 b2))
  )

(setq b2 (make-cylinder 10 30))
(send b2 :locate #f(70.0 20.0 0.0))
(send b2 :rotate pi/2 :x)

;cylinder size notice
;red is x
;green is y
;blue is z

(defclass door-model
  :super cascaded-link
  :slots (h1 s1 j1))

(defmethod door-model
  (:init ()
    (let ()
      (send-super :init)

      (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (make-chou)))
      (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (make-boad)))
      (setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
      
      (setq links (list h1 s1))
      (setq joint-list (list j1))
      
      (send self :assoc h1)
      (send h1 :assoc s1)
      (send self :init-ending)
      self))

  (:j1 (&rest args) (forward-message-to j1 args))
  )
(setq r (instance door-model :init))
;(send r :locate #f(10 0 0))
(objects (list r))

(dotimes (i 300)
  (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
;  (send b2 :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects)
  )

;(setq r (instance door-model :init))
;(objects (list r))
      

;(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-frame-1))))
;(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-frame-2))))
;(send h1 :assoc s1)

;(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-boad))))
;(objects (list h1))




;(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-boad))))
;(setq s1 (
;(objects (list h1))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
