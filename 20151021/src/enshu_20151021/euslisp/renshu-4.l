#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．

(defun make-cap nil
  (let (c1)
    (setq c1 (make-cylinder 10 30))
    (send c1 :set-color :red)
    c1))

(defun make-tag nil
  (let (c1 b1 b2)
    (setq c1 (make-cylinder 15 4))
    (setq b1 (make-cube 20 20 100))
    (setq b2 (make-cube 20 50 100))
    (send b1 :locate #f(10 0 -47))
    (send b2 :locate #f(8 0 -50))
    (setq b1 (body- b1 b2))
    (setq c1 (body+ b1 c1))
    (send c1 :set-color :gray80)
    c1))

(defun make-body nil
  (let (c1)
    (setq c1 (make-cylinder 15 300))
    (send c1 :set-color :red)
    c1))

(defun make-head nil
  (let (c1 c2)
    (setq c1 (make-cone #f(0 0 -60) 15))
    (send c1 :set-color :gray80)
    c1))

(defun make-lead nil
  (let (c1)
    (setq c1 (make-cylinder 1 52))
    (send c1 :set-color :gray20)
    c1))

(defclass mechanical-pencil
  :super cascaded-link)
(defmethod mechanical-pencil
  (:init
   ()
   (let (c1 t1 b1 h1 l l1 l2 l3)
     (send-super :init)
     (setq c1 (make-cap))
     (setq t1 (make-tag))
     (setq b1 (make-body))
     (setq h1 (make-head))
     (setq l (make-lead))
     (send c1 :locate #f(0 0 304))
     (send t1 :locate #f(0 0 300))
     (send l :locate #f(0 0 -62))
     (send b1 :assoc t1)
     (send b1 :assoc h1)
     (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list t1 b\
1 h1)))
     (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list c1))\
)
     (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list l)))

     (send self :assoc l1)
     (send l1 :assoc l2)
     (send l1 :assoc l3)

     (setq joint-list
           (list
            (instance linear-joint
                      :init :parent-link l1 :child-link l2
                      :axis :z)
	    (instance linear-joint
                      :init :parent-link l1 :child-link l3
                      :axis :z)))
     (setq links (list l1 l2 l3))
     (send self :init-ending)
     )))

(setq r (instance mechanical-pencil :init))
(objects (list r))

(dotimes (i 10000)
  (let (a b)
    (setq a (/ i 1000))
    (setq b (/ a 6.28))
    (setq a (- a (* b 6.28)))
    (if (< a 3.14)
        (send r :angle-vector (float-vector (- (* 10 (cos a)) 10) (+ (* b -4) (*\
 -4 (cos a)))))
      (send r :angle-vector (float-vector (- (* 10 (cos a)) 10) (* b -2))))
    (send *irtviewer* :draw-objects)))

;;処理が間違っているor大変なせいか、アニメーションになりません。                
;;これ以上間隔を大きくすると少し見られますが断片的です。


;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)





