(load "week-6/util")

;;; Benchmarks for 1-7 queens w/ the better version (Exercise 2.42):
;;;
;;;   real	0m0.378s
;;;   user	0m0.315s
;;;   sys	0m0.046s
;;;
;;; Benchmarks for 1-7 queens w/ this slower version (Exercise 2.43):
;;;
;;;   real	0m48.275s
;;;   user	0m48.012s
;;;   sys	  0m0.118s
;;;
;;;
;;; Yikes! Over 100 times slower.  The problem is that we're iterating over
;;;   all the rest of the queens every time through the map inside the flatmap.
;;;   That's going to grow a lot faster than the new rows tree-recursively, I
;;;   think.
;;;

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
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
  (assert-equals 40 (length (queens 7))))

(run-registered-tests)
