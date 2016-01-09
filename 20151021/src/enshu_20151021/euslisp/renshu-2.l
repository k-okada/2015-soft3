#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-rail nil
  (let (b1 b2 b3)
    (setq b1 (make-cube 70 10 10))
    (send b1 :locate #f(0 0 0))
    (setq b2 (make-cube 5 15 15))
    (send b2 :locate #f(37.5 0 0))
    (setq b3 (make-cube 5 15 15))
    (send b3 :locate #f(-37.5 0 0))
    (setq b1 (body+ b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :set-color :gray80)
    b1))

(defun make-act nil
  (let (b1 b2)
    (setq b1 (make-cube 15 17 17))
    (setq b2 (make-cube 15 10 10))
    (setq b1 (body- b1 b2))
    (send b1 :set-color :gray20)
    b1))

(defclass linear-joint-model
  :super cascaded-link
  :slots (r1 a1 j1))
(defmethod linear-joint-model
  (:init
   ()
   (let ()
     (send-super :init)
     (setq r1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-rail))))
     (setq a1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-act))))
     (setq j1 (instance linear-joint :init :parent-link r1 :child-link a1 :axis :x))

     (setq links (list r1 a1))
     (setq joint-list (list j1))
     (send self :assoc r1)
     (send r1 :assoc a1)

     (send self :init-ending)
     self))


  (:j1 (&rest args) (forward-message-to j1 args))
)
(setq r (instance linear-joint-model :init))

(objects (list r))
(dotimes (i 300)
  (if (< i 100)
      (send r :angle-vector (float-vector (* i (/ (- 35 7.5) 100.0))))
    (send r :angle-vector (float-vector (- (- 35 7.5) (* (- i 100) (/ (- 35 7.5) 100.0))))))
  (send *irtviewer* :draw-objects))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




