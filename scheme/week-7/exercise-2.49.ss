#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

;;; This is really annoying: sometimes the value 1 will not display properly,
;;;   so I'm forced to do some hackery like 0.99 instead...

(define (outline frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 0.99))
                            (make-segment (make-vect 0 0) (make-vect 0.99 0))
                            (make-segment (make-vect 0.99 0) (make-vect 0.99 0.99))
                            (make-segment (make-vect 0 0.99) (make-vect 0.99 0.99))))
   frame))

;;; It may seem a bit strange that I'm using values in the unit square rather than 
;;;   coordinates we could get out of the frame, but segments->painter is responsible
;;;   for that translation from the unit square to the real frame (via frame-coord-map)
;;; To verify, use paint-hi-res or some other, different painting function.


(define (x frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 0.99 0.99))
                            (make-segment (make-vect 0 0.99) (make-vect 0.99 0))))
   frame))

(define (diamond frame)
  ((segments->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
                            (make-segment (make-vect 0.5 0) (make-vect 0.99 0.5))
                            (make-segment (make-vect 0.99 0.5) (make-vect 0.5 0.99))
                            (make-segment (make-vect 0.5 0.99) (make-vect 0 0.5))))
   frame))

(define (wave frame)
  ((segments->painter (list (make-segment (make-vect 0 0.6) (make-vect 0.2 0.4))
                            (make-segment (make-vect 0.2 0.4) (make-vect 0.3 0.55))
                            (make-segment (make-vect 0.3 0.55) (make-vect 0.35 0.45))
                            (make-segment (make-vect 0.35 0.45) (make-vect 0.25 0))
                            (make-segment (make-vect 0.4 0) (make-vect 0.5 0.3))
                            (make-segment (make-vect 0.5 0.3) (make-vect 0.6 0))
                            (make-segment (make-vect 0.75 0) (make-vect 0.6 0.45))
                            (make-segment (make-vect 0.6 0.45) (make-vect 0.99 0.15))
                            (make-segment (make-vect 0 0.8) (make-vect 0.2 0.55))
                            (make-segment (make-vect 0.2 0.55) (make-vect 0.3 0.6))
                            (make-segment (make-vect 0.3 0.6) (make-vect 0.4 0.6))
                            (make-segment (make-vect 0.4 0.6) (make-vect 0.35 0.8))
                            (make-segment (make-vect 0.35 0.8) (make-vect 0.4 0.99))
                            (make-segment (make-vect 0.6 0.99) (make-vect 0.65 0.8))
                            (make-segment (make-vect 0.65 0.8) (make-vect 0.6 0.6))
                            (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.6))
                            (make-segment (make-vect 0.8 0.6) (make-vect 0.99 0.35))))
   frame))

(paint outline)
(paint x)
(paint diamond)
(paint wave)