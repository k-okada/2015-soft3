#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-p1 ()
  (let ((b1))
    (setq b1 (make-cylinder 40 10))
    b1))
(defun make-p2()
  (let ((b1))
    (setq b1 (make-cylinder 5 100))
    b1))
(defun make-p3 ()
  (let ((b1))
    (setq b1 (make-cylinder 40 5))
    (send b1 :translate #f(40 0 0))
    b1))

(defclass light
  :super cascaded-link
  :slots (p1 p2 p3 j1 j2))

(defmethod light
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq p1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-p1))))
	   (setq p2 (instance bodyset-link :init (make-cascoords) :bodies (list (make-p2))))
	   (setq p3 (instance bodyset-link :init (make-cascoords) :bodies (list (make-p3))))
	   (send p2 :locate #f(-40 0 10))
	   (send p3 :locate #f(0 0 100))

	   (setq j1 (instance rotational-joint :init :parent-link p1 :child-link p2 :axis :y))
	   (setq j2 (instance rotational-joint :init :parent-link p2 :child-link p3 :axis :y))
	   
	   
	   (setq links (list p1 p2 p3))
	   (setq joint-list (list j1 j2))
	   
	   (send self :assoc p1)
	   (send p1 :assoc p2)
	   (send p2 :assoc p3)
	   
	   (send self :init-ending)
	   self))

  (:j1 (&rest args) (forward-message-to j1 args))
  (:j2 (&rest args) (forward-message-to j2 args))
  )

(setq r (instance light :init))
(objects (list r))
;;(do-until-key)
;; DO NOT EDIT AFTER THIS LINE

(send *unit-test* :print-result)
(exit 1)




