(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; (car (cons x y))
;; (car (lambda (m) (m x y)))
;; ((lambda (m) (m x y)) (lambda (p q) p))
;; ((lambda (p q) p) x y)
;; x
;; => car works properly!

(define (cdr z)
  (z (lambda (p q) q)))
;; (cdr (cons x y))
;; (cdr (lambda (m) (m x y)))
;; ((lambda (m) (m x y)) (lambda (p q) q))
;; ((lambda (p q) q) x y)
;; y
;; => cdr works properly