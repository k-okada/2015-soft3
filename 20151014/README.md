# HOMEWORK 20151014

##オペレータx

1) (car (x (cdr '(a (b c) d))))
  b
  *x = car*

2) (x 13 (/ 1 0))
  13
  *x = quote*

3) (x #'list 1 nil)
  (1)
  *x = apply*

##反復と再帰

1)
 (反復)
    (defun periods_iter (n)
      (do ((i n (- i 1)))
          ((= i 0) (format t "~%"))
          (format t ".")))

 (再帰)
    (defun periods_rec (n)
      (if (> n 0)
          (progn
    	    (format t ".")
    	    (periods_rec (- n 1)))
        (format t "~%")))

2)
 (反復)
    (defun count_a_iter (lst)
      (setq count 0)
      (dolist (x lst)
        (if (eql x 'a) (setq count (+ count 1)) nil))
      count)

 (再帰)
    (defun count_a_rec (lst)
      (if (atom lst) 0
        (+ (count_a_rec (cdr lst))
           (if (eql 'a (car lst)) 1 0))))

## summit修正

1) (remove nil lst)の結果をlstに戻していないため、+がnilにも適用されてエラーとなる

    (defun summit (lst)
      (setq lst
        (remove nil lst))
      (apply #'+ lst))

2) lstが空になった判別を行わず、そのまま再帰呼び出しを続けているため、無限回呼び出しとなってSegmetation Faultとなる

    (defun summit (lst)
      (if (atom lst) 0
        (let ((x (car lst)))
          (if (null x)
              (summit (cdr lst))
            (+ x (summit (cdr lst)))))))



