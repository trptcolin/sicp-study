; Exercise 1.1

10
  ;; => 10
(+ 5 3 4)
  ;; => 12
(- 9 1)
  ;; => 8
(/ 6 2)
  ;; => 3
(+ (* 2 4) (- 4 6))
  ;; => 6
(define a 3)
  ;; => a
(define b (+ a 1))
  ;; => b
(+ a b (* a b))
  ;; => 19
(= a b)
  ;; => #f
(if (and (> b a) (< b (* a b)))
    b
    a)
  ;; => 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
  ;; => 16

(+ 2 (if (> b a) b a))
  ;; => 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
  ;; => 16



; Exercise 1.2
(/ (+ 5 4 (- 2
             (- 3
                (+ 6
                   (/ 4.0 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))



; Exercise 1.3

(define (sum-of-squares-of-two-largest a b c)
  (define (square x) (* x x))
  (define (sum-of-squares x y) (+ (square x) (square y)))
  (apply sum-of-squares
         (take (sort (list a b c) >) 2)))


; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

  ;; either the + or - operation is applied on a and b,
  ;;   depending on the result of the > test on b and 0



; Exercise 1.5

(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

  ;; Applicative order => infinite recursion (no stack overflow,
  ;;   presumably because of tail recursion optimization)
  ;; Normal order => evaluates to 0
  ;; Applicative order evaluates all arguments first, so
  ;;   since (p) is defined recursively, the call (test 0 (p)) will
  ;;   never complete (it tries to evaluate to primitives only).
  ;; Normal order evaluates arguments only when they are needed in
  ;;   execution, so since the test (= x 0) evaluates to #t where x = 0,
  ;;   y never needs to be evaluated to the bogus (p) application.



; Exercise 1.6

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (root x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

  ;; Aborting!: maximum recursion depth exceeded
  ;; new-if won't work on sqrt-iter, because procedures in Scheme
  ;;   use something like applicative order evaluation, and so even if an
  ;;   iteration will pass (good-enough? guess x), the final two arguments
  ;;   to new-if get evaluated anyway!  This means that sqrt-iter becomes
  ;;   another infinite recursion.
  ;; lucky for us "if" itself is a special form that somehow actually uses
  ;;   something like normal order.



; Exercise 1.7

  ;; example of bogus small number: (square 0.0002) => 0.00000004, but
  ;;   (root 0.00000004) => .03125042624884061  (obviously not close)
  ;;   the problem here is this:
  ;;     (square .03125042624884061) =>  9.765891407342263e-4
  ;;   which is easily within 0.001 (on the zero side) of the actual value,
  ;;     0.0002

  ;; example of bogus big number:
  ;;   (root 1e50) => recurses forever!
  ;;   this is because we have to actually square the guess to see if it's good
  ;;   enough, and so maybe we have overflow?

  ;; alternative good-enough?:
(define (root x)
  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess last-guess)
    (if (good-enough? guess last-guess)
        guess
        (sqrt-iter (improve guess)
                   guess)))

  (define (good-enough? guess last-guess)
    (< (/ (abs (- guess last-guess)) guess) 0.00001))
  
  (sqrt-iter 1.0 0.0))

  ;; this does work much better for small numbers:
  ;;    (root 0.00000004) => 2.0000000000164927e-4
  ;; and even smaller:
  ;;    (root 4e-100) => 2.000000000000401e-50
  ;; it also is better for large numbers
  ;;    (root 1e50) => 1.0000000000000725e25
  ;; and even bigger:
  ;;    (root 1e308) => 1e154



; Exercise 1.8

(define (cube-root x)
  (define (square x) (* x x))
  (define (cube x) (* x x x))
  (define (average x y)
    (/ (+ x y) 2))

  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) 0.001))

  (define (cube-root-iter guess)
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve guess))))

  (cube-root-iter 1.0))
