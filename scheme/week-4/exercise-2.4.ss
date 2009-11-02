(define (my-cons x y)
  (lambda (m) (m x y)))

(define (my-car z)
  (z (lambda (p q) p)))

;; (my-car (my-cons x y))
;; (my-car (lambda (m) (m x y)))
;; ((lambda (m) (m x y)) (lambda (p q) p))
;; ((lambda (p q) p) x y)
;; x
;; => my-car works properly!

(define (my-cdr z)
  (z (lambda (p q) q)))
;; (my-cdr (my-cons x y))
;; (my-cdr (lambda (m) (m x y)))
;; ((lambda (m) (m x y)) (lambda (p q) q))
;; ((lambda (p q) q) x y)
;; y
;; => my-cdr works properly