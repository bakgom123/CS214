;;;; factorial.clj computes the factorial of an integer.
;;;;
;;;; Input: n, an integer.
;;;; Output: The factorial of the integer n.
;;;;
;;;; Created by: David Yoo (gy24)
;;;; Date: 02/14/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns functions) ; name the program


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -facRecursive calculates the factorial recursively.
;;; Input: n - an integer
;;; res: the result that will be shown to the user
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defn facRecursive [n, i, res]
;;   (if (<= i n)
;;     (facRecursive n (+ i 1) (* res i))
;;     res
;;   )
;; )

(defn my-reverse [coll]
    (if (empty? coll)
        []
        (conj (my-reverse (rest coll)) (first coll) )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -fac_calc computes the factorial.
;;; Input: n - an integer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defn fac_calc [n]
;;   (facRecursive n 2 1.0)
;; )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: characters, integers
;;; Output: the reverse order of the list of character, boolean value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "To reverse elements, please enter a list of characters: ") (flush)
  (let [n (read)]
    (printf "%f\n" (my-reverse n))
    ;; (printf "&f\n" (super-reverse n))
  )
  ;; (print "To check if the element is in the vector or not, please enter a sequence of numbers: ") (flush)
  ;; (let [n (read)]
  ;;   (printf "%f\n" (members? n))
  ;;   (printf "&f\n" (subsequence n))
  ;; )
)