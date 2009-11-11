(load "week-6/util")

(define (sum-triples sum n)
  (filter (lambda (triple) (= sum (apply + triple)))
          (unique-triples n)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (j) (append i (list j)))
                  (enumerate-interval (+ 1 (last i)) n)))
           (unique-pairs (- n 1))))


(load "test-manager/load")
(define-each-test
  (assert-equals '((1 2 3)) (sum-triples 6 3))
  (assert-equals '((1 2 3)) (sum-triples 6 4))
  (assert-equals '((1 2 4)) (sum-triples 7 4))
  (assert-equals '((1 2 4)) (sum-triples 7 4))
  (assert-equals '((2 3 5) (1 4 5)) (sum-triples 10 5))
  (assert-equals '((1 2 9) (1 3 8) (2 3 7) (1 4 7) (2 4 6) (3 4 5) (1 5 6))
                 (sum-triples 12 10)))

(run-registered-tests)
