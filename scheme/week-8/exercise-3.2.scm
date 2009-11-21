(define (make-monitored f)
  (let ((calls 0))
    (lambda (x)
      (cond ((eq? 'how-many-calls? x)
             calls)
            ((eq? 'reset-count x)
             (set! calls 0)
             calls)
            (else
             (set! calls (1+ calls))
             (f x))))))

(load "test-manager/load")

(let ((s (make-monitored square)))
  (define-each-test
    (assert-equals 0 (s 'how-many-calls?))
    (assert-equals 1 (s 1))
    (assert-equals 1 (s 'how-many-calls?))
    (assert-equals 4 (s 2))
    (assert-equals 2 (s 'how-many-calls?))
    (assert-equals 0 (s 'reset-count))))

(run-registered-tests)
