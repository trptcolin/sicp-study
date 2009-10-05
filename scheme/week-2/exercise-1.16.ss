(load "../test-manager/load.scm")

(define (fast-expt base n)
  (define (iter base n acc)
    (cond ((= n 0) acc)
          ((even? n) (iter (square base) (/ n 2) acc))
          (else (iter base (- n 1) (* base acc)))))
  (iter base n 1))

(define-each-test
  (assert-equals 1 (fast-expt 5 0))
  (assert-equals 1 (fast-expt 1 34))
  (assert-equals 4 (fast-expt 2 2))
  (assert-equals 32 (fast-expt 2 5))
  (assert-equals 19683 (fast-expt 3 9)))

(run-registered-tests)