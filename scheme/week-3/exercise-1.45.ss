(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (fourth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y)))))
               1.0))

;; => fourth root needs the lambda to be average damped twice, as does fifth & sixth:

(define (fifth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y)))))
               1.0))

(define (sixth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y)))))
               1.0))

(define (seventh-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y)))))
               1.0))

(define (square x)
  (* x x))

(define (8th-root x)
  (let ((n 8))
    (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (expt y (- n 1)))))))
                 1.0)))

;; at the 8th root, we need another average-damp!


;;  Hypothesis: each time we multiply n by 2, we need to average-damp again.

;; let's use repeated from 1.43:

(load "./exercise-1.43.ss")

(define (lg-int x)
  (cond ((<= x 1) 0)
        ((even? x) (+ 1 (lg-int (/ x 2))))
        (else (lg-int (- x 1)))))


(define (nth-root x n)
  (fixed-point ((repeated average-damp (lg-int n)) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))


;; this seems to work for 8th roots and even 32 (and stuff in between, too):

(nth-root 256 8)
;; 2.000000000003967
(nth-root 4096 12)
;; 1.999997691470309
(nth-root 65536 16)
;; 2.0000000000769576
(nth-root 4294967296 32)
;; 2.000000000000006



;; 16th roots are not working, though!!!


