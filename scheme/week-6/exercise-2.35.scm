(load "week-6/util")

(define (my-count-leaves seq)
  (accumulate + 
              0
              (map (lambda (x)
                     (if (pair? x)
                         (my-count-leaves x)
                         1))
                   seq)))

(load "test-manager/load")

(define-each-test
  (assert-equals 1 (my-count-leaves (list 1)))
  (assert-equals 5 (my-count-leaves (list (list 1 2) (list (list 3 4) 5))))
  (assert-equals 3 (my-count-leaves (list (list 1 2) 3))))

(run-registered-tests)
