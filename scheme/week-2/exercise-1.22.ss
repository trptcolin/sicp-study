(load "./exercise-1.21.ss")

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-time (- (runtime) start-time))))

(define (report-time elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes test-number quantity)
  (cond ((> quantity 0)
         (timed-prime-test test-number)
         (if (prime? test-number)
             (search-for-primes (+ 1 test-number) (- quantity 1))
             (search-for-primes (+ 1 test-number) quantity)))
        (else
         (newline)
         (display "done"))))

(search-for-primes 1000 3)
; => 0
(search-for-primes 10000 3)
; => 0
(search-for-primes 100000 3)
; => 0
;;; etc...
(search-for-primes 1000000000 3)
; => 0.08, 0.07
(search-for-primes 10000000000 3)
; => 0.25, 0.24
(search-for-primes 100000000000 3)
; => 0.8, 0.79
(search-for-primes 1000000000000 3)
; => 2.53, 2.5

;; Yes, looks like the time increases by a factor of (sqrt 10) when the primes
;;   tested grow by a factor of 10.  I can only observe it for really big numbers
;;   on my machine :)