(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp)
           (make-exponentiation (base exp) (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-sum-from-list l)
  (cond ((number? l) l)
        ((null? l) 0)
        (else
          (make-sum (car l) (make-sum-from-list (cdr l))))))


(define (=number? a b)
  (and (number? a) (number? b) (= a b)))

(define (sum? x)
  (and (pair? x) (eq? '+ (car x))))
(define (addend s) (cadr s))
(define (augend s)
  (make-sum-from-list (cddr s)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (make-product-from-list l)
  (cond ((number? l) l)
        ((null? l) 1)
        (else
          (make-product (car l) (make-product-from-list (cdr l))))))

(define (product? x)
  (and (pair? x) (eq? '* (car x))))
(define (multiplier p) (cadr p))
(define (multiplicand p)
  (make-product-from-list (cddr p)))

