#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 2)
;; サーボモジュールを参考に直動ジョイント(linear-joint)を使ったアクチュエータを作ってみよ．
(defun make-case nil
(let (c1)
  (setq c1 (make-cylinder 10 30))
  (send c1 :set-color :gray20)
  c1))
(defun make-magnet nil
  (let 
      ((c2 (make-cylinder 3 30)))
    (send c2 :locate #f( 0 0 9.5))
  (send c2 :set-color :gray30)
  c2))

(defclass solenoide-model
  :super cascaded-link
  :slots (h1 s1 j1))
(defmethod solenoide-model
  (:init ()
	 (let()
	   (send-super :init)
	   (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-case))))
	   (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-magnet))))
	   (setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))
	   (setq links (list h1 s1))
	   (setq joint-list (list j1))
	   (send self :assoc h1)
	   (send h1 :assoc s1)
	   (send self :init-ending)
	   self))
  (:j1 (&rest args) (forward-message-to j1 args))
  )
(setq r (instance solenoide-model :init))

;(objects (list r))
;(do-until-key
; (dotimes (i 10000)
;   (send r :j1 :joint-angle (+ 9.5 (* 4 (sin (/ i 100.0)))))
;   (send *irtviewer* :draw-objects))
;(x::window-main-one))
;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)




