(load "week-6/util")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (empty-board)
  '(()))

(define (adjoin-position new-row col rest-of-queens)
  (cons (make-position new-row col)
        rest-of-queens))

(define (make-position row col)
  (cons row col))

(define (position-row position)
  (car position))

(define (position-col position)
  (cdr position))

(define (safe? k positions)
  (let ((queen (get-queen-at-col k positions)))
    (and (safe-in-row? queen positions)
         (safe-in-diagonal? queen positions))))

(define (get-queen-at-col k positions)
  (cond ((null? positions) (error "positions should not be null"))
        ((= k (position-col (car positions)))
         (car positions))
        (else (get-queen-at-col (cdr positions)))))

(define (safe-in-row? queen positions)
  (= 1
     (length (filter (lambda (x) (= (position-row queen) (position-row x)))
                     positions))))

(define (safe-in-diagonal? queen positions)
  (= 1
     (length (filter (lambda (x) (= (abs (- (position-row queen) (position-row x)))
                                    (abs (- (position-col queen) (position-col x)))))
                     positions))))

(load "test-manager/load.scm")

(define-each-test
  (assert-equals 1 (length (queens 1)))
  (assert-equals 0 (length (queens 2)))
  (assert-equals 0 (length (queens 3)))
  (assert-equals 2 (length (queens 4)))
  (assert-equals 10 (length (queens 5)))
  (assert-equals 4 (length (queens 6)))
  (assert-equals 40 (length (queens 7)))
  (assert-equals 92 (length (queens 8))))

(run-registered-tests)
