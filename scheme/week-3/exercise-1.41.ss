(load "../test-manager/load.scm")

(define (inc x) (+ x 1))
(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
;; => 21

(define-each-test
  (assert-equals 3 ((double inc) 1)))

(run-registered-tests)