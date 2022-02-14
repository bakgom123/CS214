;;;; rectangle_area.clj calculates the area of a rectangle.
;;;;
;;;; Input: The width and height of a rectangle.
;;;; Output: The area of that rectangle.
;;;;
;;;; Usage: clojure -m rectangle_area
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: David Yoo (gy24)
;;;; Date: 1/14/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns rectangle_area) ; namespace function names the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function rectangleArea() computes the area of a rectangle.
;;; Receive: itsWidth, itsHeight, a number.
;;; Precondition: itsWidth >= 0.0, itsHeight >= 0.0.
;;; Return: the area of the corresponding rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn rectangleArea [itsWidth, itsHeight]
  (* itsWidth itsHeight )  ; return width * height
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: the width and height of a rectangle.
;;; Output: the area of that rectangle.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main [] 
   
    (def width)
    (def height)
    (println "\nTo compute the area of a rectangle,")
    (print " enter its width: ") (flush) 
    

    (let [width (read)] 
    (assert (> width 0) "-main: width must be positive")
            
        (print "\n enter its height: " ) (flush)

        (let [height (read)]
        (assert (> height 0) "-main: height must be positive")

        (print "\nThe area is ")
        (print (rectangleArea width height))
        (print "\n\n")

        )
    )
)