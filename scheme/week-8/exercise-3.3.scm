(define (make-account balance password)
  (define (withdraw amount)
    (cond ((>= balance amount)
           (set! balance (- balance amount))
           balance)
          (else "Insufficient funds")))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pw-guess m)
    (cond ((not (eq? pw-guess password))
           (lambda (x) "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)


(load "test-manager/load")

(let ((account (make-account 100 'rumplestiltskin)))
  (define-each-test
    (assert-equals "Incorrect password" ((account 'foobar 'withdraw) 100))
    (assert-equals 80 ((account 'rumplestiltskin 'withdraw) 20))
    (assert-equals "Insufficient funds" ((account 'rumplestiltskin 'withdraw) 100))
    (assert-equals 40 ((account 'rumplestiltskin 'withdraw) 40))
    (assert-equals 55 ((account 'rumplestiltskin 'deposit) 15))))

(run-registered-tests)
