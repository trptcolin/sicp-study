;; we need to use cond here rather than if,
;;   since if doesn't wrap up statements like cond does

(define (for-each fn items)
  (cond ((null? items) #t)
        (else
         (fn (car items))
         (for-each fn (cdr items)))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))