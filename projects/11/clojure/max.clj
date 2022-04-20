;; max.clj tests a function to search a list for its maximum value, and finds the index of the value
;;
;; Output: three lists, and 
;;          the results of calling a maxList() function on them.
;;         the index of the value
;;
;; Usage: clojure -m max
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: David Yoo (gy24)
;; Date: Apr 5, 2022
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns max)

(load "listOps")                      ; load module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function -main tests function listMax(). 
;; Output: the results of testing listMax() on various lists.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [ 
      list1 '(99 88 77 66 55)        ; max is first value
      list2 (list 55 66 77 88 99)    ; max is last value
      list3 (list 55 77 99 88 66)    ; max is middle value
      list4 (list 55 77 11 88 66)    
      
      emptyList '()                  ; list is empty
    ]

    (println "listmax1")
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The max value in list1 is: " (listMax list1))
    (println "The max value in list2 is: " (listMax list2))
    (println "The max value in list3 is: " (listMax list3))
    (println)
    (println "The max of an empty list is: " (listMax emptyList))
    (println)

    (println "listMax2")
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The max value in list1 is: " (listMax list1))
    (println "The max value in list2 is: " (listMax list2))
    (println "The max value in list3 is: " (listMax list3))
    (println)
    (println "The max of an empty list is: " (listMax emptyList))
    (println)

    (println "listFind")
    (println "list1: " list1)        ; print list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "list4: " list4)        ;   list3,
    (println "empty: " emptyList)    ;   list3,
    (println)                        ;   and their maxima
    (println "The index of 99 in list1 is: " (listFind list1 99))
    (println "The index of 99 in list2 is: " (listFind list2 99))
    (println "The index of 99 in list3 is: " (listFind list3 99))
    (println "The index of 99 in list4 is: " (listFind list4 99))


  )
)

