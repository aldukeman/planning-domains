(define (domain zenotravel)
  (:requirements :fluents :durative-actions :typing :duration-inequalities)
  
  (:types locatable city - object
          aircraft loaded - locatable
          person cargo - loaded
          small_aircraft large_aircraft - aircraft
          small_city large_city - city)
  
  (:predicates  (at ?l - locatable ?c - city)
                (in ?p - loaded ?a - aircraft)
                (fuel-level ?a - aircraft ?n - fuel-amount)
                (next ?n1 ?n2 - fuel-amount))
  
  (:functions   (total-cost) - number
                (fuel-level ?a - aircraft) - number
                (max-fuel-level ?a - aircraft) - number
                (fly-time ?c1 - city ?c2 - city) - number
                (fly-fuel-cost ?c1 - city ?c2 - city) - number
                (zoom-time ?c1 - city ?c2 - city) - number
                (zoom-fuel-cost ?c1 - city ?c2 - city) - number
                (num-cargo ?a - aircraft) - number
                (max-cargo ?a - aircraft) - number
                (num-passengers ?a - aircraft) -number
                (max-passengers ?a - aircraft) - number)
                
  (:durative-action board
    :parameters (?p - person ?a - aircraft ?c - city)
    :duration   (= ?duration 1)
    :condition  (and  (at start (at ?p ?c))
                      (over all (at ?a ?c))
                      (at start (< (num-passengers ?a) (max-passengers ?a))))
    :effect     (and  (at start (not (at ?p ?c)))
                      (at end (in ?p ?a))
                      (at start (increase (num-passengers ?a) 1)))
  )

  (:durative-action refuel
    :parameters (?a - aircraft ?c - city)
    :duration   (>= ?duration 0)
    :condition  (and  (over all (at ?a ?c))
                      (over all (<= (fuel-level ?a) (max-fuel-level ?a))))
    :effect     (and  (increase (fuel-level ?a) #t))
  )

  (:durative-action debark
    :parameters (?p - person ?a - aircraft ?c - city)
    :duration   (= ?duration 1)
    :condition  (and  (at start (in ?p ?a))
                      (over all (at ?a ?c)))
    :effect     (and  (at start (not (in ?p ?a)))
                      (at end (at ?p ?c))
                      (at end (decrease (num-passengers ?a) 1)))
  )
  
  (:durative-action fly 
    :parameters (?a - aircraft ?c1 ?c2 - city)
    :duration   (= ?duration (fly-time ?c1 ?c2))
    :condition  (and  (at start (at ?a ?c1))
                      (over all (> (fuel-level ?a) (fly-fuel-cost ?c1 ?c2))))
    :effect     (and  (at start (not (at ?a ?c1)))
                      (at end (at ?a ?c2))
                      (at end (decrease (fuel-level ?a) (fly-fuel-cost ?c1 ?c2))))
                      ;(decrease (fuel-level ?a) (* #t (/ (fly-fuel-cost ?c1 ?c2) (fly-time ?c1 ?c2)))))
  )
  
;  (:durative-action zoom
;           :parameters (?a - aircraft ?c1 ?c2 - city ?n1 ?n2 ?n3 - fuel-amount)
;           :duration (= ?duration 1)
;           :condition (and (at start (at ?a ?c1))
;                              (at start (fuel-level ?a ?n3))
;                              (at start (next ?n1 ?n2))
;                              (at start (next ?n2 ?n3)))
;           :effect (and (at start (not (at ?a ?c1)))
;                        (at end (at ?a ?c2))
;                        (at start (not (fuel-level ?a ?n3)))
;                        (at end (fuel-level ?a ?n1))
;                        (at end (increase (total-cost) (zoom-cost ?c1 ?c2))))
;  )
;  
;  (:durative-action refuel
;           :parameters (?a - aircraft ?c - city ?n1 ?n2 - fuel-amount)
;           :duration (= ?duration 1)
;           :condition (and (at start (fuel-level ?a ?n1))
;                              (at start (next ?n1 ?n2))
;                              (over all (at ?a ?c)))
;           :effect (and (at start (not (fuel-level ?a ?n1)))
;                        (at end (fuel-level ?a ?n2))
;                        (at end (increase (total-cost) 50)))
;  )
)
