(defun count_a_rec (lst)
  (if (atom lst) 0
    (+ (count_a_rec (cdr lst))
       (if (eql 'a (car lst)) 1 0))))
