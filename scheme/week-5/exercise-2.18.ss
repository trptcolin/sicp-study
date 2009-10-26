(load "../test-manager/load.scm")

(define (reverse ls)
  (define (iter l acc)
    (if (eq? '() l)
        acc
        (iter (cdr l) (cons (car l) acc))))
  (iter ls '()))
      

(define-each-test
  (assert-equals '(5 4 3 2 1) (reverse '(1 2 3 4 5)))
  (assert-equals '(2) (reverse '(2)))
  (assert-equals '() (reverse '())))

(run-registered-tests)
;