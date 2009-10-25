(load "./exercise-2.7.ss")

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;; let's make a couple of intervals: a -> b and c -> d and get the width of the sum.
;;   hopefully it can be expressed in terms of the widths of the parts
;; widths of parts:
;;   (width (make-interval a b))
;;   (/ (- b a) 2)
;;   (width (make-interval c d))
;;   (/ (- d c) 2)

;; (width (add-interval (make-interval a b) (make-interval c d)))
;; (width (make-interval (+ a c) (+ b d)))
;; (/ (- (+ b d) (+ a c)) 2)
;; (/ (+ b d -a -c) 2)
;; (/ (+ (- b a) (- d c)) 2)
;; (+ (/ (- b a) 2) (/ (- d c) 2))
;; (+ (width (make-interval a b)) (width (make-interval c d)))

;; !!! so, in fact, the width of the sum is the sum of the widths.

;; Let's just do a counterexample as proof that it's not true for multiplication:
;;  If z is the product of intervals a and b, then we assume that there is a function
;;  f that maps (width a) and (width b) to (width z).
;;  Therefore, (f x y) => (width z) for any x = (width a) and y = (width b)


(width (make-interval 1 3))
;; => 1
(width (make-interval 4 10))
;; => 3
(width (mul-interval (make-interval 1 3) (make-interval 4 10)))
;; => 13
(width (make-interval 6 12))
;; => 3
(width (mul-interval (make-interval 1 3) (make-interval 6 12)))
;; => 15

;; But this last result is a contradiction, since we have two equal widths mapping to
;;   different values (13 and 15) under the assumed function f. Our assumption was that
;;   f exists, which must have been incorrect, since we have this contradiction.
;; Therefore, the width of the product of intervals is not a function only of the widths
;;   of the intervals