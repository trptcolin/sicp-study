(load "../test-manager/load.scm")

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter f n acc)
    (if (= n 0)
        acc
        (iter f (- n 1) (compose f acc))))
  (iter f n (lambda (x) x)))

(define-each-test
  (assert-equals 625 ((repeated square 2) 5)))

(run-registered-tests)