(load "../test-manager/load.scm")

(define (fast-multiply a b)
  (define (double x) (* x 2))
  (define (halve x) (/ x 2))

  (define (iter a b acc)
    (cond ((< b 1) acc)
          ((even? b) (iter (double a) (halve b) acc))
          (else (iter a (- b 1) (+ a acc)))))

  (iter a b 0))

(define-each-test
  (assert-equals 0 (fast-multiply 0 4))
  (assert-equals 0 (fast-multiply 4 0))
  (assert-equals 5 (fast-multiply 5 1))
  (assert-equals 5 (fast-multiply 1 5))
  (assert-equals 64 (fast-multiply 16 4))
  (assert-equals 64 (fast-multiply 4 16))
  )

(run-registered-tests)