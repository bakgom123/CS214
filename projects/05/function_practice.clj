;;;; function_practice.clj comtains four functions - two reversing functions and two Misc. functions
;;;;
;;;; Input: none
;;;; Output: List, boolean expression
;;;;
;;;; Created by: David Yoo (gy24)
;;;; Date: 02/14/2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns function_practice) ; name the program


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function - my-reverse only reverse top-level elements.
;;; res: a list
;;; referenced from https://clojuredocs.org/clojure.core/recur
;;;                 https://clojuredocs.org/clojure.core/pop
;;;                 https://clojuredocs.org/clojure.core/conj
;;;                 https://clojuredocs.org/clojure.core/first
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn my-reverse [lst] 
  (loop [lst_p lst lst_n '()]
    (if (empty? lst_p)
      lst_n
      (recur (pop lst_p) (conj lst_n (first lst_p)))
      )
    )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -super-reverse reverse nested sublists as well as the top-level elements.
;;; res: a list
;;; referenced from https://clojuredocs.org/clojure.core/last
;;;                 https://clojuredocs.org/clojure.core/butlast
;;;                 https://clojuredocs.org/clojure.core/conj
;;;                 https://clojuredocs.org/clojure.core/cons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn super-reverse [lst]
  ;; check if the list is empty or not, if it's empty then return empty list
  (if (empty? lst)
    lst
    ;; check if the last part of the list is a list or not
      (if (list? (last lst))
        ;; reverse the "big part" of the list first
        (cons (super-reverse (last lst)) (super-reverse (butlast lst)))
        ;; and then reverse the "small part" of the list
        (cons (last lst) (butlast lst))
      )
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -member? this behaves like the built-in function contains?()
;;; res: true / false
;;; How it works: if the given set of numbers is empty then return false, if not continue, 
;;;               and use the rest function to eliminate those which are not target
;;; referenced from https://clojuredocs.org/clojure.core/rest
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn member? [target, lst]
  ;; check if the list is valid
  (if (list? lst)
    ; check if the list is empty
    (if (empty? lst)
      false
      ;; start to check if the target is in the list or not
      (if (= target (first lst))
        true
      (recur target (rest lst))
      )
    )
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -subsequence returns the part of the input list starting at position i counting for n elements
;;; res: list
;;; referenced from https://clojuredocs.org/clojure.core/not-empty
;;;                 https://clojuredocs.org/clojure.core/loop
;;;                 https://clojuredocs.org/clojure.core/conj
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn subsequence [list i n]
  ;; if there is any issue with the parameters
  (if (empty? list)
    (if (< i 0)
      (if (< n i)
    nil)
    )
  )
  ;; with the valid parameters
  (loop [list list i i n n subseq '()]
    ;; make sure the list is not empty
    ;; (if (not-empty list)
      ;; check if the list is a valid list
      (if (list? list)
        ;; if the starting point is the 0th item, and if the count is 0, then just return an empty list
        (if (= i 0)
          (if(= n 0)
            ;; use my-reverse function to append items to the result
            (my-reverse subseq)
            ;; if the count is not 0, then add items to the result, and decrement count by 1 every time until it reaches 0
            (recur (rest list) i (- n 1) (conj subseq (first list)))
          )
          ;; if the starting position is in somewhere middle of the list, then ignore the previous items and keep executing
          (recur (rest list) (- i 1) n subseq)
        )
      )
    )
  
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins, it tests functions that were implemented above
;;; Output: the reverse order of the list of character, boolean value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  ;; my-reverse()
  (println "\n<my-reverse()>")
  (println (my-reverse '()))
  (println (my-reverse '(a b c d e f g)))
  (println (my-reverse '(a b (c d) (e (f g)))))
  ;; super-reverse()
  (println "\n<super-reverse()>")
  (println (super-reverse '()))
  (println (my-reverse '(a b c d e f g)))
  (println (super-reverse '(a b (c d) (e (f g)))))
  ;; member?()
  (println "\n<member?()>")
  (println (member? '(1 2) '((1 2) 3 (4 (5 6)))))
  (println (member? 3 '((1 2) 3 (4 (5 6)))))
  (println (member? '(4 (5 6)) '((1 2) 3 (4 (5 6)))))
  (println (member? 1 '((1 2) 3 (4 (5 6)))))
  (println (member? 2 '((1 2) 3 (4 (5 6)))))
  (println (member? 4 '((1 2) 3 (4 (5 6)))))
  ;; subsequence()
  (println "\n<subsequence()>")
  (println (subsequence '() 0 1))
  (println (subsequence '(1 2 (3 4) (5 (6 7))) 0 0))
  (println (subsequence '(1 2 (3 4) (5 (6 7))) 0 3))
  (println (subsequence '(1 2 (3 4) (5 (6 7))) 1 2))
  (println (subsequence '(1 2 3 4 5 6 7) 2 4))


)