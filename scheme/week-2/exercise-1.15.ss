(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)
(p (sine (/ 12.15 3.0)))
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.3499999999999999)))
(p (p (p (sine (/ 1.3499999999999999 3.0)))))
(p (p (p (sine 0.44999999999999996))))
(p (p (p (p (sine (/ 0.44999999999999996 3.0))))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine (/ 0.15 3.0)))))))
(p (p (p (p (p (sine 4.9999999999999996e-2))))))
(p (p (p (p (p 4.9999999999999996e-2)))))


;; part a) p gets applied 5 times

;; part b) O(log n) in both time and space (dividing by 3 each time)