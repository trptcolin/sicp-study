(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))

;; this is the result we want, but backwards
(display (square-list '(1 2 3 4)))
;;=> (16 9 4 1)


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

;; this is the right order, but we end up with unbalanced pairs, since
;;   the second arg to cons is not a list
(display (square-list '(1 2 3 4)))
;;=> ((((() . 1) . 4) . 9) . 16)


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (square (car things)))))))
  (iter items '()))

;; now we're talking (making a single-element list out of the second arg, and
;;   using append rather than cons, since the first element is not a list.
(display (square-list '(1 2 3 4)))
;;=> (1 4 9 16)