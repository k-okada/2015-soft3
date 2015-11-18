#!/usr/bin/env irteusgl

;;(load "lib/llib/unittest.l")
;;(init-unit-test)
;;(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defclass cascaded-link
  :super cascaded-coords
  :slots (links joint-list bodies collision-avoindance-links))
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

(defclass xytable
  :super cascaded-link
  :slots (xslider yslider zslider endlink jx jy jz))
(defmethod xytable
  (:init ()
	 (let ()
	   (send-super :init)
	   (setq xsl1 (make-xslider))
	   (setq xsl2 (make-xslider))
	   (send xsl1 :locate #f(0 240 0))
	   (send xsl2 :locate #f(0 -240 0))
	   (setq xslider (instance bodyset-link :init (make-cascoords) :bodies (list xsl1 xsl2)))
	   (setq yslider (instance bodyset-link :init (make-cascoords) :bodies (list (make-yslider))))
	   (setq zslider (instance bodyset-link :init (make-cascoords) :bodies (list (make-zslider))))
	   (setq endlink (instance bodyset-link :init (make-cascoords) :bodies (list (make-endlink))))
	   (send yslider :locate #f(0 0 15))
	   (send zslider :locate #f(0 -15 -7.5))
	   (send endlink :locate #f(0 7.5 0))
	   (setq jx (instance linear-joint :init :parent-link xslider :child-link yslider :axis :x))
	   (setq jy (instance linear-joint :init :parent-link yslider :child-link zslider :axis :y))
	   (setq jz (instance linear-joint :init :parent-link zslider :child-link endlink :axis :z))
	   
	   (send jx :max-angle 250)
	   (send jx :min-angle -250)
	   (send jy :max-angle 250)
	   (send jy :min-angle -250)
	   (send jz :max-angle 0)
	   (send jz :min-angle -40)
	   (setq links (list xslider yslider zslider endlink))
	   (setq joint-list (list jx jy jz))
	   
	   (send self :assoc xslider)
	   (send xslider :assoc yslider)
	   (send yslider :assoc zslider)
	   (send zslider :assoc endlink)
	   (send self :init-ending)
	   (send self :angle-vector #f(0 0 0))
	   self))
  (:jx (&rest args) (forward-message-to jx args))
  (:jy (&rest args) (forward-message-to jy args))
  (:jz (&rest args) (forward-message-to jz args))
  (:endlink (&rest args) (forward-message-to endlink args))
  )
(defun make-xslider nil
  (make-cube 500 10 10)
  )

(defun make-yslider nil
  (let (tmp1 tmp2 tmp3 tmp4)
    (setq tmp1 (make-cube 10 500 10))
    (setq tmp2 (make-cube 20 20 5))
    (setq tmp3 (make-cube 20 20 5))
    (send tmp2 :locate #f(0 -240 -7.5))
    (send tmp3 :locate #f(0 240 -7.5))
    (setq tmp4 (body+ tmp1 tmp2 tmp3))
    tmp4))
(defun make-zslider nil
  (let (z1 z2 z)
    (setq z1 (make-cube 20 20 5))
    (setq z2 (make-cube 10 10 60))
    (send z2 :locate #f(0 0 -32.5))
    (setq z (body+ z1 z2))
    z))
(defun make-endlink nil
  (let (endlink)
    (setq endlink (make-cube 20 5 20))
    (send endlink :locate #f(0 0 -20))
    endlink))


;; DO NOT EDIT AFTER THIS LINE
;;(send *unit-test* :print-result)
;;(exit 1)




