(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal order:
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
    40
     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
 ; remainder evaluations = 1
(if (= 6 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
 ; remainder evaluations = 2
(if (= (remainder 40 6) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
 ; remainder evaluations = 3
(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
 ; remainder evaluations = 5
(if (= (remainder 6 (remainder 40 6)) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
 ; remainder evaluations = 6
(if (= (remainder 6 4) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
 ; remainder evaluations = 7
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

 ; remainder evaluated: 10
(if (= (remainder (remainder 40 6)
                  (remainder 6 (remainder 40 6)))
       0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
 ; remainder evaluated: 12
(if (= (remainder 4 (remainder 6 4)) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
 ; remainder evaluated: 13
(if (= (remainder 4 2) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
 ; remainder evaluated: 14
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 ; remainder evaluated: 16
(remainder 6 (remainder 40 6))
 ; remainder evaluated: 17
(remainder 6 4)
 ; remainder evaluated: 18
2

;;; WHEW! Normal order took 18 applications of (remainder a b)


; Applicative:

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
(if #f 206 (gcd 40 (remainder 206 40)))
; 1 remainder
(gcd 40 (remainder 206 40))
(gcd 40 6)
(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))
(if #f 40 (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))
; 2 remainder
(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))

(if #f 6 (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))
; 3 remainder
(gcd 4 2)
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))
(if #f 4 (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))
; 4 remainder
(gcd 2 0)
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))
(if #t 2 (gcd 0 (remainder 2 0)))
2

;;; That was easier: applicative order takes 4 applications of (remainder a b)