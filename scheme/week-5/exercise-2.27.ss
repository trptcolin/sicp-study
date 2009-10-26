(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse ls)
  (define (iter l acc)
    (cond ((eq? '() l) acc)
          ((list? (car l))
           (iter (cdr l) (cons (deep-reverse (car l)) acc)))
          (else
           (iter (cdr l) (cons (car l) acc)))))
  (iter ls '()))

(load "../test-manager/load.scm")
(define-each-test
  (assert-equals '((4 3) (2 1)) (deep-reverse x)))
(run-registered-tests)