(load "week-6/util")

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x))
              '()
              sequence))

(load "test-manager/load")

(define-each-test
  (assert-equals '(4 3 2 1) (reverse-right '(1 2 3 4)))
  (assert-equals '(4 3 2 1) (reverse-left '(1 2 3 4))))

(run-registered-tests)
