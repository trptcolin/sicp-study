(define (make-accumulator n)
  (lambda (increase)
    (begin (set! n (+ n increase))
           n)))

(load "test-manager/load")

(define-each-test
  (let ((acc (make-accumulator 0)))
    (assert-equals 0 (acc 0))
    (assert-equals 1 (acc 1))
    (assert-equals 2 (acc 1))
    (assert-equals 12 (acc 10))))

(run-registered-tests)
