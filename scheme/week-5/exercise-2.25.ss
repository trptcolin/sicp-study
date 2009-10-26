(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))
;; => 7
;; better:
(car (cdaddr '(1 3 (5 7) 9)))
;; => 7

(car (car '((7))))
;; => 7
;; better:
(caar '((7)))
;; => 7

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))
;; => 7
;; better:
(cadadr (cadadr (cadadr '(1 (2 (3 (4 (5 (6 7)))))))))
;; => 7