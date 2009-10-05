(load "../test-manager/load.scm")

(define (pascals-triangle level index)
  (if (or (= 1 index) (= level index))
      1
      (+ (pascals-triangle (- level 1) (- index 1)) (pascals-triangle (- level 1) index))))

(define-each-test
  (assert-equals 1 (pascals-triangle 1 1))
  (assert-equals 1 (pascals-triangle 2 1))
  (assert-equals 1 (pascals-triangle 2 2))
  (assert-equals 2 (pascals-triangle 3 2))
  (assert-equals 3 (pascals-triangle 4 2))
  (assert-equals 4 (pascals-triangle 5 2))
  (assert-equals 6 (pascals-triangle 5 3))
  (assert-equals 4 (pascals-triangle 5 4))
  )

(run-registered-tests)