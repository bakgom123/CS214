;;;; root.clj computes the roots of the quadratic equation. (ax^2+bx+c).
;;;;
;;;; Input: a,b,c, double.
;;;; Output: The roots of the quadratic equation. (ax^2+bx+c).
;;;;
;;;; Completed by: David Yoo (gy24)
;;;; Date: 03/07/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns root) ; name the program


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -rootFunction computes the roots of the quadratic equation. (ax^2+bx+c).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn rootFunction [a, b, c]
  (if (not (zero? a))
    (let
      [arg (- (Math/pow b 2) (* 4 a c))]
      (if (>= arg 0)
        (let 
        [root1 (/ (+ (- b) (Math/sqrt arg)) (* 2 a))
        root2 (/ (- (- b) (Math/sqrt arg)) (* 2 a))]
          (vector true root1 root2)
        )
        (
          do
          (println "b^2 - 4ac is negative!")
          (vector false 0 0)
        )
      )
    )
    (
      do
      (println "a is zero!")
      (vector false 0 0)
    )
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: a,b,c - double
;;; Output: the roots of the quadratic equation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "Enter a: ") (flush)
  (let [a (read)]
    (print "Enter b: ") (flush)
    (let [b (read)]
      (print "Enter c: ") (flush)
      (let [c (read)
            roots (rootFunction a b c)]
        (if (get roots 0)
          (printf "%f, %f\n" (get roots 1), (get roots 2))
        )
      )
    )
  )
)