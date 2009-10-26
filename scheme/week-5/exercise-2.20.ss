(load "../test-manager/load.scm")

(define (same-parity a . z)
  (define (rec ls acc)
    (cond ((null? ls) acc)
          ((eq? (even? a) (even? (car ls)))
           (rec (cdr ls) (append acc (list (car ls)))))
          (else
           (rec (cdr ls) acc))))
  (cons a (rec z '())))

(define-each-test
  (assert-equals '(1 3 5 7) (same-parity 1 2 3 4 5 6 7))
  (assert-equals '(2 4 6) (same-parity 2 3 4 5 6 7)))

(run-registered-tests)
;