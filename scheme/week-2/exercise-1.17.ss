(load "../test-manager/load.scm")

(define (fast-multiply a b)
  (define (double x) (* x 2))
  (define (halve x) (/ x 2))

  (cond ((or (= 0 a) (= 0 b)) 0)
        ((even? b) (fast-multiply (double a) (halve b)))
        (else (+ a (fast-multiply a (- b 1))))))


(define-each-test
  (assert-equals 0 (fast-multiply 0 4))
  (assert-equals 0 (fast-multiply 4 0))
  (assert-equals 5 (fast-multiply 5 1))
  (assert-equals 5 (fast-multiply 1 5))
  (assert-equals 64 (fast-multiply 16 4))
  (assert-equals 64 (fast-multiply 4 16))
  )

(run-registered-tests)