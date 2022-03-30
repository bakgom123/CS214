;; Test the temperature.clj, and it contains the main function of tmeperature.clj
;; Author: David Yoo (gy24)
;; Date: 03/22/2022


(ns temperature_tester)

(load-file "temperature.clj")

;; read the temperature from the user
(defn readTemp [message]
  (do
    (println message)
    (let [[temp error] (read-temperature)]
      (if error
        (readTemp "Invalid input, please enter a valid input: ") 
        temp
      )
    )
  )
)

;; read a number from the user
(defn readNum [message]
  (do
    (println message)
    (let [line (read-line)]
      (if (isNumeric line)
        (Float/parseFloat line)
        (readNum "Invalid input, please enter a valid input: ")
      )
    )
  )
)

;; table of temperatures
;; format: https://livebook.manning.com/book/clojure-the-essential-reference/chapter-18/v-30/
(defn tempTable [current stop step steps start-is-lower]
  (let [f (format "%-20s" (to-string (toF current)))
        c (format "%-20s" (to-string (toC current)))
        k (format "%-20s" (to-string (toK current)))]
    (if (or (= start-is-lower (less-than? current stop)) (equals? current stop))
      (do
        (println (str f c k))
        (tempTable (steps current step) stop step steps start-is-lower))
    )
  )
)

;; main function
(defn -main []
  (do
    (println """Temperature examples:
    20.5 C
    10 K
    35.1 F""")
    (let [startTemp (readTemp "Please enter a start temperature: ")
          stopTemp (readTemp "Please enter a stop temperature: ")
          step (readNum "Please enter a step amount of degrees: ")]
      (if (equals? startTemp stopTemp)
        (println "Start and stop temperatures are equal.")
        (let [start-is-lower (less-than? startTemp stopTemp)]
          (if start-is-lower
            (tempTable startTemp stopTemp step raise start-is-lower)
            (tempTable startTemp stopTemp step lower start-is-lower)
          )
        )
      )
    )
  )         
)