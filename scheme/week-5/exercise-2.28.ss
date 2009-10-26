(define x (list (list 1 2) (list 3 4)))

(define (fringe ls)
  (cond ((null? ls) '())
        ((list? (car ls))
         (append (fringe (car ls)) (fringe (cdr ls))))
        (else
         (cons (car ls) (fringe (cdr ls))))))

(load "../test-manager/load.scm")
(define-each-test
  (assert-equals '(1 2 3 4) (fringe x))
  (assert-equals '(1 2 3 4 1 2 3 4) (fringe (list x x))))
(run-registered-tests)