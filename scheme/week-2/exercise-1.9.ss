;;; Exercise 1.9

; #1
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; #2
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; results of (+ 4 5) using #1 shows that #1 generates a recursive process (expanding space):
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6))) ; assuming inc means increment by 1 - my mit-scheme doesn't have that
(inc (inc (7)))
(inc 8)
9

; results of (+ 4 5) using #2 shows that it generates an iterative process (constant space):
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9