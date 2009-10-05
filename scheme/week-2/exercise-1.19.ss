(load "../test-manager/load.scm")

; It took a bit of algebra to arrive at p' and q' (easier with pencil & paper)

(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))
                     (+ (* 2 p q) (* q q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))
  
  (fib-iter 1 0 0 1 n))



(define-each-test
  (assert-equals 0 (fib 0))
  (assert-equals 1 (fib 1))
  (assert-equals 1 (fib 2))
  (assert-equals 2 (fib 3))
  (assert-equals 3 (fib 4))
  (assert-equals 5 (fib 5))
  (assert-equals 8 (fib 6))
  (assert-equals 13 (fib 7))
  (assert-equals 21 (fib 8))
  (assert-equals 34 (fib 9))
  (assert-equals 55 (fib 10))
  (assert-equals 89 (fib 11))
  (assert-equals 144 (fib 12))
  )

(run-registered-tests)