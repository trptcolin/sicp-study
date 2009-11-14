#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))

(define (identity painter) painter)

(define (split op1 op2)
  (define (splitter painter n)
    (if (= n 0)
        painter
        (let ((smaller (splitter painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  splitter)

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 2))
(paint (up-split einstein 2))