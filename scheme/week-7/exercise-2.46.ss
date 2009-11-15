#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

(define (my-make-vect x y)
  (cons x y))

(define (my-xcor-vect v)
  (car v))
(define (my-ycor-vect v)
  (cons v))

(define (my-add-vect v1 v2)
  (cons (+ (my-xcor-vect v1) (my-xcor-vect v2))
        (+ (my-ycor-vect v1) (my-ycor-vect v2))))

(define (my-sub-vect v1 v2)
  (cons (- (my-xcor-vect v1) (my-xcor-vect v2))
        (- (my-ycor-vect v1) (my-ycor-vect v2))))

(define (my-scale-vect v n)
  (cons (* n (my-xcor-vect v))
        (* n (my-ycor-vect v))))