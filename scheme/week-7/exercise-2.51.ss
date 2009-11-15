#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

(define (below-a painter-1 painter-2)
  (let ((paint-bottom
         ((transform-painter (make-vect 0.0 0.0)
                             (make-vect 0.99 0.0)
                             (make-vect 0.0 0.5))
          painter-1))
        (paint-top
         ((transform-painter (make-vect 0.0 0.5)
                             (make-vect 0.99 0.5)
                             (make-vect 0.0 0.99))
          painter-2)))
    (lambda (frame)
      (paint-top frame)
      (paint-bottom frame))))

(define (below-b painter-1 painter-2)
  (rotate90 (beside 
             (rotate270 painter-1)
             (rotate270 painter-2))))

(paint (below einstein einstein))
(paint (below-a einstein einstein))
(paint (below-b einstein einstein))