#!/usr/bin/env irteusgl

;;(load "lib/llib/unittest.l")
;;(init-unit-test)
;;(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE
(load "renshu-3.l")
;; 4)
;; cascaded-linkを使ったモデルを用いてアニメーションさせてみよ．その際必ず２つ以上の物体を画面に配置し，assoc/dissocが行われること．


(defun moveto (dest speed)
  (let (i per now srcx srcy srcz dist tovect dividenum)
    (setq srcx (send xy :jx :joint-angle))
    (setq srcy (send xy :jy :joint-angle))
    (setq srcz (send xy :jz :joint-angle))
    (setq now (float-vector srcx srcy srcz))
    (setq dist (distance now dest))
    (setq dividenum (floor (/ dist speed)))
    (setq tovect (v- dest now))
    (dotimes (i (- dividenum 1))
      (setq per (/ (* 1.0 (+ i 1)) dividenum))
      (send xy :angle-vector (v+ now  (scale per tovect)))
      (send *irtviewer* :draw-objects)
      (x::window-main-one)
      )
    (send xy :angle-vector dest)
    (send *irtviewer* :draw-objects)
    (x::window-main-one)
  ))
(defun make-hand nil
  (let (tmp1 tmp2 tmp3)
    (setq tmp1 (make-cube 30 10 50))
    (setq tmp2 (make-cube 10 10 10))
    (send tmp2 :locate #f(0 0 -20))
    (setq tmp3 (body- tmp1 tmp2))
    (setq tmp1 (make-cube 10 10 30))
    (send tmp1 :locate #f(10 0 10))
    (setq hand (body- tmp3 tmp1))
    (send tmp1 :locate #f(-20 0 0))
    (setq hand (body- hand tmp1))
    (send hand :locate #f(0 0 -30))
    hand
  ))

(setq xyspeed 40)
(setq numofcubes 10)
(setq zspeed 8)

(setq xy (instance xytable :init))
(setq cyl (make-cube 500 500 5))
(send cyl :locate #f(0 0 -100))
(setq hand (make-hand))
(send (send xy :endlink) :assoc hand)

(setq poles '())
(dotimes (i 4)
  (push (make-cylinder 5 100) poles)
  )
(send (elt poles 0) :locate #f(245 240 -100))
(send (elt poles 1) :locate #f(245 -240 -100))
(send (elt poles 2) :locate #f(-245 240 -100))
(send (elt poles 3) :locate #f(-245 -240 -100))

(setq cubes '())
(dotimes (i numofcubes)
  (push (make-cube 10 10 10 :pos (float-vector (- (random 400) 200) (- (random 400) 200) -95)) cubes)
  (send (elt cubes 0) :set-color :yellow)
  )

(setq objs (append (list xy cyl hand) cubes))
(setq objs (append objs poles))
(objects objs)

(setq time 0)
(do-until-key 
 (dotimes (i 10)
   (setq destcube (elt cubes i))
   (setq destcube_pos (send destcube :pos))
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) 0) xyspeed)      
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) -40) zspeed)
   (send (send xy :endlink) :assoc (elt cubes i))
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) 0) zspeed)
   
   (setq dest (float-vector -200 (+ -200 (* i 12) ) 0))
   (moveto dest xyspeed)
   (moveto (v+ dest #f(0 0 -40)) zspeed)
   (send (send xy :endlink) :dissoc (elt cubes i))
   (moveto dest zspeed)
		 
   (send *irtviewer* :draw-objects)
   (x::window-main-one)
)
 (dotimes (i 10)
   (setq destcube (elt cubes i))
   (setq destcube_pos (send destcube :pos))
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) 0) xyspeed)      
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) -40) zspeed)
   (send (send xy :endlink) :assoc (elt cubes i))
   (moveto (float-vector (elt destcube_pos 0) (elt destcube_pos 1) 0) zspeed)
   
   (setq dest (float-vector (- (random 400) 200) (- (random 400) 200) 0))
   (moveto dest xyspeed)
   (moveto (v+ dest #f(0 0 -40)) zspeed)
   (send (send xy :endlink) :dissoc (elt cubes i))
   (moveto dest zspeed)
		 
   (send *irtviewer* :draw-objects)
   (x::window-main-one)
   )
)

;; DO NOT EDIT AFTER THIS LINE
;;(send *unit-test* :print-result)
;;(exit 1)





