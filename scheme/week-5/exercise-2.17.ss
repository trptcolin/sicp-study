(load "../test-manager/load.scm")

(define (last-pair ls)
  (if (eq? '() (cdr ls))
      ls
      (last-pair (cdr ls))))
      

(define-each-test
  (assert-equals '(34) (last-pair (list 23 72 149 34))))

(run-registered-tests)