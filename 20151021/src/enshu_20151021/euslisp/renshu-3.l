#!/usr/bin/env irteusgl

(load "lib/llib/unittest.l")
(init-unit-test)
(send *unit-test* :clear-result)
;; DO NOT EDIT BEFORE THIS LINE

;; 3)
;; ascaded-linkを使ったモデルを作成せよ．ロボットに限らず可動構造を持つものであれば（例えば家具等）何でもよい．

(defun make-foundation ()
  (let (b1 b2)
    (setq b1 (make-cylinder 20 5))
    (setq b2 (make-cylinder 4 50))
    (send b1 :locate #f(0 0 0))
    (send b2 :locate #f(0 0 5))
    (setq b1 (body+ b1 b2))
    b1
  )
)

(defun make-chair ()
  (let (b1 b2)
    (setq b1 (make-cube 50 50 50))
    (setq b2 (make-cube 35 50 35))
    (send b1 :locate #f(0 0 71))
    (send b2 :locate #f(7.5 0 78.5))
    (setq b1 (body- b1 b2))
    b1
  )
)

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-foundation))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-chair))))
(setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
;;instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

(objects (list r))

;; DO NOT EDIT AFTER THIS LINE
(send *unit-test* :print-result)
(exit 1)
