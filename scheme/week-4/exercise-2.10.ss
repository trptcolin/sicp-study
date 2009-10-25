(load "./exercise-2.7.ss")

(define (div-interval x y)
  (define (error-condition)
    (write "error: divide-over-zero")
    (newline)
    -1)
  (if (or (and (< (lower-bound y) 0)
               (> (upper-bound y) 0))
          (= (lower-bound y) 0)
          (= (upper-bound y) 0))
      (error-condition)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

;
