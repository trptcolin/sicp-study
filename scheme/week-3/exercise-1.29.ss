(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))


(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (simpson-integral f a b n)
  (define (y k)
    (let (h (/ (- b a) n))
      (f (+ a (* k h)))))
  (define (simpson-term k)
    (* (y k)
       (cond ((or (= 0 k) (= k n)) 1)
             ((= 0 (remainder k 2)) 2)
             (else 4))))
  (* (/ h 3) (sum simpson-term a inc n)))


;; it seems pretty good: perfect for as low as n = 2!