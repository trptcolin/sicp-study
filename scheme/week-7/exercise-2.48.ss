#lang scheme

(define (my-make-segment v1 v2)
  (cons v1 v2))

(define (my-start-segment segment)
  (car segment))
(define (my-end-segment segment)
  (cdr segment))