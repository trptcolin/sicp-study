#lang scheme

(define (make-frame-1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame-1 frame)
  (car frame))
(define (edge1-frame-1 frame)
  (cadr frame))
(define (edge2-frame-1 frame)
  (caddr frame))

(define (make-frame-2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-2 frame)
  (car frame))
(define (edge1-frame-2 frame)
  (caadr frame))
(define (edge2-frame-2 frame)
  (cddr frame))

(write (edge2-frame-1 (make-frame-1 4 5 6)))
(newline)
(write (edge2-frame-2 (make-frame-2 4 5 6)))