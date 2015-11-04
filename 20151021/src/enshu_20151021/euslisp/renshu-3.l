#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defclass tansu
  :slots (l1 l2 l3 l4)
  :super cascaded-link)

(defmethod tansu
  (:init ()
         (let (d b1 b2 b3 tmp)
           (send-super :init)
           (setq b1 (make-cube 10 30 10))
           (send b1 :locate #f(0 0 7))
           (setq b2 (make-cube 10 30 10))
           (send b2 :locate #f(0 0 19))
           (setq b3 (make-cube 10 30 10))
           (send b3 :locate #f(0 0 31))
           (setq tmp (make-cube 14 34 38))
           (send tmp :locate #f(-3 0 19))
           (setq d (body- tmp b1 b2 b3))
           (send d :locate #f(1 0 0))
           (send d :set-color :gray20)

           (setq b1 (body- b1 (make-cube 8 28 10 :pos #f(0 0 9))))
           (send b1 :set-color :gray80)
           (setq b2 (body- b2 (make-cube 8 28 10 :pos #f(0 0 21))))
           (send b2 :set-color :gray80)
           (setq b3 (body- b3 (make-cube 8 28 10 :pos #f(0 0 33))))
           (send b3 :set-color :gray80)

           (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list d)))
           (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list b1)))
           (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list b2)))
           (setq l4 (instance bodyset-link :init (make-cascoords) :bodies (list b3)))
           (send self :assoc l1)
           (send l1 :assoc l2)
           (send l1 :assoc l3)
           (send l1 :assoc l4)

           (setq joint-list
                 (list
                   (instance linear-joint :init :parent-link l1 :child-link l2 :axis :x)
                   (instance linear-joint :init :parent-link l1 :child-link l3 :axis :x)
                   (instance linear-joint :init :parent-link l1 :child-link l4 :axis :x)
                   ))
           (setq links (list l1 l2 l3 l4))
           (send self :init-ending)
           )
         )
  )

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




