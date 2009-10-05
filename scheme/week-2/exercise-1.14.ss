; Draw the tree illustrating the process for the count-change procedure. What
; are the orders of growth of the space and number of steps used by this process
; as the amount to be changed increases?

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 11)
(cc 11 5)
(+ (cc 11 4) (cc (- 11 50) 5))
(+ (+ (cc 11 3) (cc (- 11 25) 4)) (cc -39 5))
(+ (+ (+ (cc 11 2) (cc (- 11 10) 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (cc 11 1) (cc (- 11 5) 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ (cc 11 0) (cc (- 11 1) 1)) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ (cc 11 0) (cc 10 1)) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (cc 10 1)) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ (cc 10 0) (cc (- 10 1) 1))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (cc 9 1))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ (cc 9 0) (cc (- 9 1) 1)))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (cc 8 1)))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ (cc 8 0) (cc (- 8 1) 1))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (cc 7 1))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 7 0) (cc (- 7 1) 1)))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 6 1)))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 6 0) (cc (- 6 1) 1))))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (cc 5 1))))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
(+ (+ (+ (+ (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ 0 (+ (cc 5 0) (cc (- 5 1) 1)))))))) (cc 6 2)) (cc 1 3)) (cc -14 4)) (cc -39 5))
;; etc...

; so (cc n 1) generates 2*n steps, with n space taken up
;    O(n) in both time and space
; (cc n 2) generates a (cc n 1) process and a (cc (-n 1) 2) process, which means
;    looks recursive, right? so for every increase of the number of coins, we're
;    going to have a new branch of O(n) to worry about, so it's O(n^5) in time and space