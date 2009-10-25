(load "../test-manager/load.scm")

(define (xor a b)
  (and (or a b) (not (and a b))))

(define (make-rat n d)
  (define (normalized-numerator a b)
    (if (xor (< 0 a) (< 0 b))
        (- 0 (abs a))
        (abs a)))
  (let ((g (gcd n d))
        (normal-n (normalized-numerator n d)))
    (cons (/ normal-n g) (/ (abs d) g))))

(define-each-test
  (assert-equals (cons 1 2) (make-rat 1 2))
  (assert-equals (cons 1 2) (make-rat -1 -2))
  (assert-equals (cons -1 2) (make-rat -1 2))
  (assert-equals (cons -1 2) (make-rat 1 -2))
  (assert-equals (cons 2 1) (make-rat -4 -2)))

(run-registered-tests)