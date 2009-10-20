(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; Moving from the square call to explicit multiplication means that we have to
;;   make 2 recursive calls each time we divide exp by 2. This negates the gains
;;   we earn by dividing the problem in half for a given call of expmod, since
;;   as we divide the problem in half, we double the work, giving us a Theta(n)
;;   process.