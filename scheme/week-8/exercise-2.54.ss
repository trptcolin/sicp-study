(define (my-equal? a b)
  (cond ((eq? a b) #t)
        ((and (pair? a) (pair? b))
         (and (my-equal? (car a) (car b))
              (my-equal? (cdr a) (cdr b))))
        (else #f)))

(load "test-manager/load")

(define-each-test
  (assert-equals #t (my-equal? '(this is a list) '(this is a list)))
  (assert-equals #f (my-equal? '(this is a list) '(this (is a) list))))
(run-registered-tests)
