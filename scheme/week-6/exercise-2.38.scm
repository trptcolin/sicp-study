(load "week-6/util")

(define (fold-right op initial sequence)
  (accumulate op initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))


(fold-right / 1 (list 1 2 3))
; 3/2

(fold-left / 1 (list 1 2 3))
; 1/6

(fold-right list '() (list 1 2 3))
; (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
; (((() 1) 2) 3)

;;; In order for fold-right and fold-left to produce the same values for a
;;; given sequence, op should be symmetric.  That is, (op a b) should be equal
;;; to (op b a) for any particular values a and b.

