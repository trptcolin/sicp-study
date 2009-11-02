(load "week-6/util")
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff
                   (* x higher-terms)))
              0
              coefficient-sequence))


;;;
(load "test-manager/load")

(define-each-test
  (assert-equals 1 (horner-eval 0 (list 1 3 0 5 0 1)))
  (assert-equals 10 (horner-eval 1 (list 1 3 0 5 0 1)))
  (assert-equals 79 (horner-eval 2 (list 1 3 0 5 0 1))))

(run-registered-tests)
