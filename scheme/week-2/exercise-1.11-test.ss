(load "../test-manager/load.scm")
(load "./exercise-1.11.ss")

(define-each-test "recursive"
  (assert-equal 1 (f-recursive 1))
  (assert-equal 2 (f-recursive 2))
  (assert-equal 4 (f-recursive 3))
  (assert-equal 11 (f-recursive 4))
  (assert-equal 25 (f-recursive 5))
  (assert-equal 59 (f-recursive 6)))

(define-each-test "iterative"
  (assert-equal 1 (f-iterative 1))
  (assert-equal 2 (f-iterative 2))
  (assert-equal 4 (f-iterative 3))
  (assert-equal 11 (f-iterative 4))
  (assert-equal 25 (f-iterative 5))
  (assert-equal 59 (f-iterative 6)))

(run-registered-tests)

