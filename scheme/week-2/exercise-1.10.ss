;;; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 1 10) => 1024
(A 1 10)
(A (- 1 1)
   (A 1 (- 10 1)))
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 (A (- 1 1)
        (A 1 (- 9 1))))
(* 2 (A 0 (A 1 8)))
(* 2 (* 2 (A 1 8)))
;; etcetera => as y decreases by one, we multiply by two, until y reaches 1:
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1))))))))))
(* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
; => 1024 (2 ^ 10, confirmed by execution)


; (A 2 4)
(A 2 4)
(A (- 2 1)
   (A 2 (- 4 1)))
(A 1 (A 2 3))

; assuming that this pattern holds:
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
; we know from the above what (A 1 y) means: 2 ^ y
;   let's pretend we have a function (power x y) such that (power 2 y) is 2 ^ y
(A 1 (A 1 (power 2 2)))
(A 1 (A 1 4))
(A 1 (power 2 4))
(A 1 16)
(power 2 16)
; => 65536 ((2 ^ (2 ^ (2 ^ 2)), confirmed by execution)


; (A 3 3)
(A 3 3)
(A (- 3 1)
   (A 3 (- 3 1)))
(A 2 (A 3 2))
(A 2 (A (- 3 1)
        (A 3 (- 2 1))))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A (- 2 1)
        (A 2 (- 2 1))))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 (A (- 1 1)
        (A 1 (- 2 1))))
(A 2 (A 0 (A 1 1)))
(A 2 (A 0 2))
(A 2 (* 2 2))
(A 2 4)
; well, we already computed this value above
; => 65536

(define (f n) (A 0 n))
; computes 2n

(define (g n) (A 1 n))
; for positive n, computes 2 ^ n (2 raised to the nth power)

(define (h n) (A 2 n))
; for positive n, computes 2 ^ (2 ^ (2 ^ ... 2)), such that 2 occurs n times
;   (is there a simpler way to express this?)


                   