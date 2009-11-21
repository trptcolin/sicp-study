(load "week-8/deriv.ss")

(define (exponentiation? x)
  (and (pair? x) (eq? '** (car x))))

(define (base x) (cadr x))
(define (exponent x) (caddr x))
(define (make-exponentiation u n)
  (cond ((=number? n 0) 1)
        ((=number? n 1) u)
        (else (list '** u n))))

(load "test-manager/load")
(define-each-test
  (assert-equals '(* y (* 10 (** x 9))) (deriv '(* y (** x 10)) 'x))
  (assert-equals '(* 5 (** x 4)) (deriv '(** x 5) 'x)))

(run-registered-tests)
