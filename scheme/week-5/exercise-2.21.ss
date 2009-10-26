;; i guess nil was primitive in mit-scheme at the time, but not now, so:
(define nil '())

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

;; yeah, this is going to be a lot better...
(define (square-list2 items)
  (map square items))

(load "../test-manager/load.scm")
(define-each-test
  (assert-equals '(1 4 9 16) (square-list '(1 2 3 4)))
  (assert-equals '(1 4 9 16) (square-list2 '(1 2 3 4))))
(run-registered-tests)