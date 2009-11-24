(load "week-9/util")

(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)
(stream-ref x 5)


;;; Oh damn!
;;; 1 ]=>
;;; 1
;;; 2
;;; 3
;;; 4
;;; 5
;;; ;Value: 5
;;;
;;; 1 ]=>
;;; 6
;;; 7
;;; ;Value: 7
;;;
;;; 1 ]=>
;;; ;Value: 5
;;; ;;;
;;;
;;; We print every time we call show, which happens only 5 times to get
;;;   The Fifth Element ;)  This is *awesome* since ordinary map would've
;;;   had to call it for every element in the sequence.  And stream-map
;;;   keeps track of the values that have already been calculated, apparently,
;;;   since show doesn't get called for the previously-calculated values.
;;;
;;; This has some pretty cool implications for big data sets. I'm assuming
;;;   there is a memory hit for this kind of ability, though.
