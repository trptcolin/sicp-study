(load "../test-manager/load.scm")

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define-each-test
  (assert-equals 49 ((compose square inc) 6)))

(run-registered-tests)