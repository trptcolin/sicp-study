#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

;;; The syntax is different for PLT Scheme's transform-painter:
;;;   there it returns a function that needs to be applied to a painter
;;;   in order to get the transformed painter.

;;; This seems better more modular (better?) to me, but I can't really
;;;   put my finger on a case where you couldn't achieve the same result
;;;   in the SICP way...

(define (my-flip-horiz painter)
  ((transform-painter (make-vect 0.99 0)
                      (make-vect 0 0)
                      (make-vect 0.99 0.99))
  painter))

(define (rotate-180 painter)
  ((transform-painter (make-vect 0.99 0.99)
                      (make-vect 0 0.99)
                      (make-vect 0.99 0))
   painter))

(define (rotate-90 painter)
  ((transform-painter (make-vect 0 0.99)
                      (make-vect 0 0)
                      (make-vect 0.99 0.99))
   painter))

(define (rotate-270 painter)
  ((transform-painter (make-vect 0.99 0)
                      (make-vect 0.99 0.99)
                      (make-vect 0 0))
   painter))


(paint (my-flip-horiz einstein))
(paint einstein)
(paint (rotate-90 einstein))
(paint (rotate-180 einstein))
(paint (rotate-270 einstein))