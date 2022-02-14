;;;; grade_codes.clj is a driver for function gradeCode.
;;;;
;;;; Input: score in integer
;;;; Output: the letter grade in string
;;;;
;;;; Usage: clojure -m grade_codes
;;;;
;;;; Created by: David Yoo (gy24)
;;;; Date: 01/26/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns grade_codes)                    ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; gradeCode() returns the letter grade in string.
;;; Receive: score, an integer.
;;; Precondition: score is a non-negative integer, and it's less than or equal to 100
;;; Return: the letter grade in string.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; solution using the case function
(defn gradeCode [score]
  (case (quot score 10)
    (9 10)  "A"
    (8) "B"
    (7) "C"
    (6) "D"
        "F"
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main() test-drives our gradeCode() function.
;;; Input: score in integer
;;; Output: the letter grade in string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
 (print "\nEnter your score: ") (flush)
 (let
    [ score (read) ]                ; read score (an integer)
    (println (gradeCode score) "\n")      ; display the letter grade
 )
)

