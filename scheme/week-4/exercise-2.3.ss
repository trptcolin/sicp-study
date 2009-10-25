(load "../test-manager/load.scm")

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

;; assuming starting point is at bottom left
(define (make-rectangle x length width)
  (cons x (cons length width)))

(define (length rectangle)
  (cadr rectangle))
(define (width rectangle)
  (cddr rectangle))

;; constructor matching make-rectangle in effect
;;   The "hard" part is getting the bottom-left point.
;;   We don't actually need it for this exercise, but it might
;;   be misleading to give a point that isn't the bottom left.
(define (make-rectangle2 point1 point2)
  (let ((length (abs (- (x-point point1)
                        (x-point point2))))
        (width (abs (- (y-point point1)
                       (y-point point2)))))
    (cons (make-point (min (x-point point1)
                           (x-point point2))
                      (min (y-point point1)
                           (y-point point2)))
          (cons length width))))

(define (area rectangle)
  (* (length rectangle) (width rectangle)))
(define (perimeter rectangle)
  (+ (* 2 (length rectangle))
     (* 2 (width rectangle))))


(define-each-test
  (assert-equals 20 (area (make-rectangle (make-point 0 0) 5 4)))
  (assert-equals 18 (perimeter (make-rectangle (make-point 0 0) 5 4)))
  (assert-equals 20 (area (make-rectangle2 (make-point 0 0) (make-point 4 5))))
  (assert-equals 18 (perimeter (make-rectangle2 (make-point 0 0) (make-point 4 5 )))))


(run-registered-tests)