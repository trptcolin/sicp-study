;; Skipping explanatory exercises.
;;  These responses are under the scheme directory.

; Exercise 1.3

(defn sum-of-squares-of-two-largest [a b c]
  (defn square [x] (* x x))
  (defn sum-of-squares [x y] (+ (square x) (square y)))
  (apply sum-of-squares
	 (drop 1 (sort (list a b c)))))


; Exercise 1.7

(defn sqrt [x]
  (defn abs [x] (if (< x 0) (- x) x))
  (defn average [a b] (/ (+ a b) 2))

  (defn good-enough? [guess last-guess]
    (< (/ (abs (- guess last-guess)) guess) 0.0000000001))

  (defn improve [guess]
    (average guess (/ x guess)))

  (defn sqrt-iter [guess last-guess]
    (if (good-enough? guess last-guess)
      guess
      (sqrt-iter (improve guess)
		 guess)))

  (sqrt-iter 1.0 0.0))


; Exercise 1.8


(defn cube-root [x]
  (defn square [x] (* x x))
  (defn cube [x] (* x x x))
  (defn abs [x] (if (< x 0) (- x) x))
  (defn average [x y] (/ (+ x y) 2))

  (defn improve [guess]
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

  (defn good-enough? [guess]
    (< (abs (- (cube guess) x)) 0.0000000001))

  (defn cube-root-iter [guess]
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve guess))))

  (cube-root-iter 1.0))
