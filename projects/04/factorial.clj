;;;; factorial.clj computes the factorial of an integer.
;;;;
;;;; Input: n, an integer.
;;;; Output: The factorial of the integer n.
;;;;
;;;; Completed by: David Yoo (gy24)
;;;; Date: 02/02/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns factorial) ; name the program


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -facRecursive calculates the factorial recursively.
;;; Input: n - an integer
;;; res: the result that will be shown to the user
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn facRecursive [n, i, res]
  (if (<= i n)
    (facRecursive n (+ i 1) (* res i))
    res
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -fac_calc computes the factorial.
;;; Input: n - an integer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn fac_calc [n]
  (facRecursive n 2 1.0)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: an integer
;;; Output: the factorial of an integer that the user inputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "To calculate the factorial, enter an integer: ") (flush)
  (let [n (read)]
    (printf "The factorial of %d is " n)
    (printf "%f\n" (fac_calc n))
  )
)