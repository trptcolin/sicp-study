(load "week-9/util")

(define (my-stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(load "test-manager/load")

(define-each-test
  (assert-equals 9 (stream-car (my-stream-map (lambda (x y) (+ x (* 2 y)))
                                              (stream-enumerate-interval 1 3)
                                              (stream-enumerate-interval 4 6)))))
(run-registered-tests)
