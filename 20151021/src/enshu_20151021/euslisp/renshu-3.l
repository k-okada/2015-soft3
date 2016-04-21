#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．
(defclass table-light
  :super cascaded-link
  :slots (end-coords l1 l2 l3 l4 j1 j2 j3))

(defmethod table-light
  (:init ()
    (let (b)
      (send-super :init)
      ;; l4
      (setq b (make-cube 10 100 10))
      (send b :locate #f(0 50 0))
      (send b :set-color :red)
      (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l4))
      (setq end-coords (make-cascoords :pos #f(0 0 20)))
      (send l4 :assoc end-coords)
      (send l4 :locate #f(0 0 100))
      ;; l3
      (setq b (make-cube 10 10 100))
      (send b :locate #f(0 0 50))
      (send b :set-color :green)
      (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l3))
      (send l3 :assoc l4)
      (send l3 :locate #f(0 0 100))
      ;; l2
      (setq b (make-cube 10 10 100))
      (send b :locate #f(0 0 50))
      (send b :set-color :blue)
      (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l2))
      (send l2 :assoc l3)
      (send l2 :locate #f(0 0 20))
      ;; l1
      (setq b (body+ (make-cube 10 10 20 :pos #f(0 0 10)) (make-cube 100 100 2)))
      (send b :set-color :white)
      (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list b) :name 'l1))
      (send l1 :assoc l2)
      ;; joints
      (setq j1 (instance rotational-joint :init :name 'j1 :parent-link l1 :child-link l2 :axis :y :min -90 :max 90)
            j2 (instance rotational-joint :init :name 'j2 :parent-link l2 :child-link l3 :axis :y :min -120 :max 120)
            j3 (instance rotational-joint :init :name 'j3 :parent-link l3 :child-link l4 :axis :y :min -180 :max 180)
            )
      (setq links (list l1 l2 l3 l4))
      (setq joint-list (list j1 j2 j3))
      (send self :init-ending)
      self))
  (:end-coords (&rest args) (forward-message-to end-coords args))
  )
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)

