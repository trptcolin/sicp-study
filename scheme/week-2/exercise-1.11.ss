;;; Exercise 1.11

; recursive solution:
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

; iterative solution:
(define (f-iterative n)
  (define (iter i f-1 f-2 f-3)
    (if (= i n)
        f-1
        (iter (+ 1 i)
              (+ f-1 (* 2 f-2) (* 3 f-3))
              f-1
              f-2)))
  (if (< n 3)
      n
      (iter 3 4 2 1)))