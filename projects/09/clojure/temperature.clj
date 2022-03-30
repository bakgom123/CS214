;; functions for temperature conversion
;; Author: David Yoo (gy24)
;; Date: 03/22/2022

(require '[clojure.string :as str])

(defrecord Temperature [degree scale])

;; defining the constant: https://stackoverflow.com/questions/9162558/how-does-clojure-const-work
(def ^:const celsius \C)
(def ^:const fahrenheit \F)
(def ^:const kelvin \K)

;; change to uppercase
;; https://clojuredocs.org/clojure.string/upper-case
(defn toUpper [chr]
  (nth (char-array (clojure.string/upper-case chr)) 0)
)

;; check if the scale is valid
(defn is-scale-valid? [scale]
  (let [upper (toUpper scale)]
    (or (= upper celsius) (= upper kelvin) (= upper fahrenheit))
    )
)

;; check if a string is numeric
(defn isNumeric [str]
  (try
     (do
       (Float/parseFloat str)
       true)
     (catch NumberFormatException e false))
)

;; temperature with a degree and scale
(defn initial [degree scale]
  (if (is-scale-valid? scale)
    (->Temperature degree (toUpper scale))
    (println "Invalid scale provided to initial."))
)

;; get the degrees of the temperature
(defn getTemp [^Temperature temp]
  (:degree temp)
)

;; get the scale
(defn getScale [^Temperature temp]
  (:scale temp)
)

;; convert a temperature to Celsius
(defn toC [^Temperature temp]
  (if (= kelvin (getScale temp))
    (initial (- (getTemp temp) 273.15) celsius)
    (if (= fahrenheit (getScale temp))
      (initial (* (/ 5.0 9.0) (- (getTemp temp) 32)) celsius)
      temp))
)

;; convert a temperature to Fahrenheit
(defn toF [^Temperature temp]
  (if (= kelvin (getScale temp))
    (initial (+ 32 (* (/ 9.0 5.0) (- (getTemp temp) 273.15))) fahrenheit)
    (if (= celsius (getScale temp))
      (initial (+ 32 (* (/ 9.0 5.0) (getTemp temp))) fahrenheit)
      temp))
)

;; convert a temperature to Kelvin
(defn toK [^Temperature temp]
  (if (= celsius (getScale temp))
    (initial (+ (getTemp temp) 273.15) kelvin)
    (if (= fahrenheit (getScale temp))
      (initial (+ (* (/ 5.0 9.0) (- (getTemp temp) 32.0)) 273.15) kelvin)
      temp))
)

;; convert temperature into another scale
(defn convert-temp [temp scale]
  (if (= scale (getScale temp))
    temp
    (if (= scale celsius)
      (toC temp)
      (if (= scale kelvin)
        (toK temp)
        (if (= scale fahrenheit)
          (toF temp)
          ()))))
)

;; An input operation that lets a Temperature be conveniently input as a single entity (e.g., 98.6 F).
(defn read-temperature []
  (let [line (read-line)
        parts (str/split line #" ")]
    (if (= 2 (count parts))
      (let [value-in-string (nth parts 0)
            scale-in-string (nth parts 1)
            scale-char (nth (char-array scale-in-string) 0)]
        (if (= (count scale-in-string) 1)
          (if (is-scale-valid? scale-char)
            (if (isNumeric value-in-string)
              [(initial (Float/parseFloat value-in-string) scale-char) false]
              [nil true])
            [nil true])
          [nil true]))
      [nil true]))
)

;; returns the temperature in a string
(defn to-string [^Temperature temp]
  (str (format "%.3f" (getTemp temp)) " " (getScale temp))
)

;; given a Temperature and real degrees, returns a Temperature that is degrees higher than the Temperature received.
(defn raise [temp amount]
  (initial (+ amount (getTemp temp)) (getScale temp))
)

;; given a Temperature and a real degrees, returns a Temperature that is degrees lower than the Temperature received. 
(defn lower [temp amount]
  (initial (- (getTemp temp) amount) (getScale temp))
)

;; given two Temperature operands, returns true if and only if the left operand is equal to the right operand.
(defn equals? [temp1 temp2]
 (= (getTemp temp1) (getTemp (convert-temp temp2 (getScale temp1))))
)

;; given two Temperature operands, returns true if and only if the left operand is less-than the right operand. 
(defn less-than? [temp1 temp2]
 (< (getTemp temp1) (getTemp (convert-temp temp2 (getScale temp1))))
)

