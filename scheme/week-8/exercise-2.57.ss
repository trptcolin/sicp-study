(load "week-8/deriv.ss")

;;; Implementations are cumulative, in deriv.ss

(load "test-manager/load")
(define-each-test
  (assert-equals '(+ (* x y) (* y (+ x 3))) (deriv '(* (* x y) (+ x 3)) 'x))
  (assert-equals '(+ (* x y) (* y (+ x 3))) (deriv '(* x y (+ x 3)) 'x))
  (assert-equals '(+ (* x y) (* y (+ x 3))) (deriv '(* x (* y (+ x 3))) 'x)))

(run-registered-tests)
