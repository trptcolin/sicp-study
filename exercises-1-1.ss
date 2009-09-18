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

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))


(define (sum-of-squares-of-two-largest a b c)
  (cond ((and (<= a b) (<= a c))
         (sum-of-squares b c))
        ((<= b c)
         (sum-of-squares a c))
        (else
         (sum-of-squares a b))))


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


; TODO: Exercise 1.7


; TODO: Exercise 1.8

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x (square guess))))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube-root guess x)
  (if (good-enough? guess x)
      guess
      (cube-root (improve guess x) x)))

;; Note: the starting guess MUST be a float.
