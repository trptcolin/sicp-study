(load "../test-manager/load.scm")

(define us-coins (list 50 25 10 5 1))
(define reverse-us-coins (list 1 5 10 25 50))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (no-more? coin-values)
  (eq? '() coin-values))
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))


(define-each-test
  (assert-equals 292 (cc 100 us-coins))
  (assert-equals 292 (cc 100 reverse-us-coins)))

(run-registered-tests)


;; order doesn't seem to matter