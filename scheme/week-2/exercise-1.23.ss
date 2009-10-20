(load "./exercise-1.22.ss")

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (next n)
    (if (= n 2)
        3
        (+ n 2)))
  (define (divides? a b)
    (= (remainder b a) 0))
  (find-divisor n 2))

(define (search-and-time-several-primes)
  (search-for-primes 100000000000 3)
; => 0.49
  (search-for-primes 1000000000000 3)
; => 1.54
)