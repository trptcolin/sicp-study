(load "week-6/util")

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (filter (lambda (x) (prime? (caddr x)))
          (map (lambda (x) (list (car x) (cadr x) (apply + x)))
               (unique-pairs n))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(load "test-manager/load")

(define-each-test
  (assert-equals '((1 2)) (unique-pairs 2))
  (assert-equals '((1 2) (1 3) (2 3)) (unique-pairs 3))
  (assert-equals '((1 2) (1 3) (2 3) (1 4) (2 4) (3 4)) (unique-pairs 4))
  (assert-equals '((1 2) (1 3) (2 3) (1 4) (2 4) (3 4) (1 5) (2 5) (3 5) (4 5))
                 (unique-pairs 5)))

(define-each-test
  (assert-equals '((1 2 3) (2 3 5) (1 4 5) (3 4 7) (2 5 7) (1 6 7) (5 6 11))
                 (prime-sum-pairs 6)))
(run-registered-tests)
