(load "week-6/util")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v))
       m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
        (map (lambda (x) (matrix-*-vector cols x))
             m)))


(load "test-manager/load")

(define-each-test
  (assert-equals '(1 -3) (matrix-*-vector '((1 -1 2) (0 -3 1)) '(2 1 0))))

(define-each-test
  (assert-equals '((1 0) (-1 -3) (2 1)) (transpose '((1 -1 2) (0 -3 1)))))

(define-each-test
  (assert-equals '((0 -10) (-3 -1)) (matrix-*-matrix '((0 4 -2) (-4 -3 0)) '((0 1) (1 -1) (2 3)))))

(run-registered-tests)
