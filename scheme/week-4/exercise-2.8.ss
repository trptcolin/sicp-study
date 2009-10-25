;; we need the result to be an interval consisting of the min and max values
;;  of the difference between points in the intervals
(load "./exercise-2.7.ss")

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))