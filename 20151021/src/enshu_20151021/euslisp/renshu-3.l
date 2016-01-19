#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(defun make-frame nil
  (let (b1 b2)
    (setq b1 (make-cube 5 50 100))
    (setq b2 (make-cube 5 40 90))
    (setq b1 (body- b1 b2))
    (send b1 :locate #f(0 20 0))
    (send b1 :set-color :yellow)
    b1))

(defun make-door nil
  (let (b1)
    (setq b1 (make-cube 5 40 90))
    ;; (setq c1 (make-cylinder 5 5))
    ;; (setq c2 (make-cylinder 5 5))
    ;; (send c1 :rotate (deg2rad 90) :y)
    ;; (send c1 :locate #f(5 15 0))
    ;; (send c2 :rotate (deg2rad 90) :y)
    ;; (send c2 :locate #f(-5 15 0))
    ;; (setq b1 (body+ b1 c1))
    ;; (setq b1 (body+ b1 c2))
    (send b1 :locate #f(5 20 0))
    (send b1 :set-color :blue)
    b1))

(defclass door-model
  :super cascaded-link
  :slots (f1 d1 j1))
(defmethod door-model
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq f1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-frame))))
	   (setq d1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-door))))

	   (setq j1 (instance rotational-joint :init :parent-link f1 :child-link d1 :axis :z))

	   (setq links (list f1 d1))
	   (setq joint-list (list j1))

	   (send self :assoc f1)
	   (send f1 :assoc d1)

	   (send self :init-ending)
	   self))

  (:j1 (&rest args) (forward-message-to j1 args))
)


(setq r (instance door-model :init))

(objects (list r))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




