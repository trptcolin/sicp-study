(load "../test-manager/load.scm")

;; This one is pretty mind-bending...  I need to explain the functions
;;   out loud (rubber-ducky style) in order to wrap my head around it.
;;

;; changing variable names for ease of understanding
(define zero (lambda (a) (lambda (b) b)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; ((lambda (f) (lambda (x) (f ((zero f) x)))))
;; ((lambda (f) (lambda (x) (f ((lambda (b) b) x)))))
;; ((lambda (f) (lambda (x) (f x))))

(define one (lambda (c) (lambda (d) (c d))))

;; (add-1 one)
;; ((lambda (f) (lambda (x) (f ((one f) x)))))
;; ((lambda (f) (lambda (x) (f ((lambda (d) (f d)) x)))))
;; ((lambda (f) (lambda (x) (f (f x)))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;; one is 1 application of f on x, two is 2 applications, etc.
;;   adding a & b should apply the argument a + b times.
;;   i.e. we should apply f a times, then b times 
(define (add a b)
  (lambda (f)
    (lambda (x) ((b f) ((a f) x)))))

;; thanks for the test case ideas, @jimweirich!!!!
;;   i had a hard time thinking through how to test these,
;;   even though i was pretty sure i had the right solutions
;;   (since we have to actually apply the functions to compare
;;   the results)

(define-each-test
  (assert-equals 0 ((zero 1+) 0))
  (assert-equals 1 ((one 1+) 0))
  (assert-equals 2 ((two 1+) 0))
  (let ((three (add one two)))
    (assert-equal 3 ((three 1+) 0))))

(run-registered-tests)