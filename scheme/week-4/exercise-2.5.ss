;; this works since 2 and 3 are primes. we'll be able to divide by
;;   2 and 3 from the product 2^a * 3^b until we reach one.

(load "../test-manager/load.scm")

(define (exp-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (exp-car c)
  (define (iter x acc)
    (if (= 0 (modulo x 2))
        (iter (/ x 2) (1+ acc))
        acc))
  (iter c 0))

(define (exp-cdr c)
  (define (iter x acc)
    (if (= 0 (modulo x 3))
        (iter (/ x 3) (1+ acc))
        acc))
  (iter c 0))
    
(define-each-test
  (assert-equals 3 (exp-car (exp-cons 3 5)))
  (assert-equals 5 (exp-cdr (exp-cons 3 5))))

(run-registered-tests)