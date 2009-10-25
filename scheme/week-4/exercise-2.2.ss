(load "../test-manager/load.scm")

(define (average a b)
  (/ (+ a b) 2))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (make-segment starting-point ending-point)
  (cons starting-point ending-point))
(define (starting-point segment)
  (car segment))
(define (ending-point segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-point (average (x-point (starting-point segment))
                       (x-point (ending-point segment)))
              (average (y-point (starting-point segment))
                       (y-point (ending-point segment)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define-each-test
  (assert-equals (cons 1 1) (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2)))))

(run-registered-tests)