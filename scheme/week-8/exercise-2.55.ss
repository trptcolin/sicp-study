(car ''abracadabra)
;;; => quote

;;; 'abracadabra is just shorthand for (quote abracadabra)
;;;   This means (car ''abracadabra) is really
;;;   => (car (quote (quote abracadabra)))
;;;   => quote
;;; The evaluator will strip off a quote if it's the first item in a list
;;;   being evaluated (e.g. (quote abracadabra)), but here the quote
;;;   calls are inside the car function call.
