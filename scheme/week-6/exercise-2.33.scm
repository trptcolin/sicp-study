(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate 
    (lambda (x y) (cons (p x) y)) 
    '() 
    sequence))

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (my-length sequence)
  (accumulate
    (lambda (x y) (+ y 1))
    0
    sequence))

(load "test-manager/load")

(define-each-test
  (assert-equals '(1 4 9 16) (my-map square '(1 2 3 4)))
  (assert-equals '(2 3 4 5) (my-map (lambda (x) (+ x 1)) '(1 2 3 4))))

(define-each-test
  (assert-equals '(1 2 3 4) (my-append '(1 2) '(3 4)))
  (assert-equals '(3 4) (my-append '() '(3 4))))

(define-each-test
  (assert-equals 4 (my-length '(0 1 2 3)))
  (assert-equals 7 (my-length '(0 1 2 3 8 43 10000)))
  (assert-equals 0 (my-length '())))

(run-registered-tests)
