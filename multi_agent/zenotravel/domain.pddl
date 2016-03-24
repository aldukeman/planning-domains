(define (domain zenotravel)
  (:requirements :fluents :durative-actions :typing :duration-inequalities)
  
  (:types locatable city - object
          aircraft loaded - locatable
          person cargo - loaded
          small_aircraft large_aircraft - aircraft
          small_city large_city - city)

  (:predicates  (at ?l - locatable ?c - city)
                (in ?p - loaded ?a - aircraft))
  
  (:functions   (small_speed) - number            ; miles / minute
                (large_speed) - number            ; miles / minute
                (small_efficiency) - number       ; miles / gallon
                (large_efficiency) - number       ; miles / gallon
                (small_consumption) - number      ; gallons / minute
                (large_consumption) - number      ; gallons / minute
                (zoom_speed_const) - number       ; speed multiplier
                (zoom_consumption_const) - number ; consumption multiplier
                (refuel_rate_const) - number      ; gallons / minute

                (fuel_cost) - number

                (fly_dist ?c1 - city ?c2 - city) - number

                (fuel_level ?a - aircraft) - number
                (max_fuel_level ?a - aircraft) - number
                (num_cargo ?a - aircraft) - number
                (max_cargo ?a - aircraft) - number
                (num_passengers ?a - aircraft) - number
                (max_passengers ?a - aircraft) - number
                (speed ?a - aircraft) - number
                (fuel_efficiency ?a - aircraft) - number
                (zoom_speed ?a - aircraft) - number
                (zoom_consumption ?a - aircraft) - number
                (refuel_rate ?a - aircraft) - number)

  (:durative-action board
    :parameters (?a - aircraft ?p - person ?c - city)
    :duration   (= ?duration 0.25)
    :condition  (and  (at start (at ?p ?c))
                      (over all (at ?a ?c))
                      (at start (< (num_passengers ?a) (max_passengers ?a))))
    :effect     (and  (at start (not (at ?p ?c)))
                      (at end (in ?p ?a))
                      (at start (increase (num_passengers ?a) 1)))
  )

  (:durative-action debark
    :parameters (?a - aircraft ?p - person ?c - city)
    :duration   (= ?duration 0.25)
    :condition  (and  (at start (in ?p ?a))
                      (over all (at ?a ?c)))
    :effect     (and  (at start (not (in ?p ?a)))
                      (at end (at ?p ?c))
                      (at end (decrease (num_passengers ?a) 1)))
  )

;  (:durative-action refuel
;    :parameters (?a - aircraft ?c - city)
;    :duration   (= ?duration (/ (- (max_fuel_level ?a) (fuel_level ?a)) (refuel_rate ?a)))
;    :condition  (over all (at ?a ?c))
;    :effect     (at end (assign (fuel_level ?a) (max_fuel_level ?a)))
;  )

  (:durative-action refuel
    :parameters (?a - aircraft ?c - city)
    :duration   (= ?duration (/ (- (max_fuel_level ?a) (fuel_level ?a)) (refuel_rate ?a)))
    :condition  (over all (at ?a ?c))
    :effect     (increase (fuel_level ?a) (* #t (refuel_rate ?a)))
  )

;  (:durative-action refuel
;    :parameters (?a - aircraft ?c - city)
;    :duration   (and  (<= ?duration (/ (- (max_fuel_level ?a) (fuel_level ?a)) (refuel_rate ?a)))
;                      (>= ?duration 0.01))
;    :condition  (over all (at ?a ?c))
;    :effect     (increase (fuel_level ?a) (* #t (refuel_rate ?a)))
;  )

;  (:durative-action refuel
;    :parameters (?a - aircraft ?c - city)
;    :duration   (>= ?duration 0)
;    :condition  (and  (over all (at ?a ?c))
;                      (at end (<= (fuel_level ?a) (max_fuel_level ?a))))
;    :effect     (increase (fuel_level ?a) (* #t (refuel_rate ?a)))
;  )

;  (:durative-action fly_small
;    :parameters (?a - small_aircraft ?src - city ?dst - city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_efficiency ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_effi?a))))
;                      (at end (increase fuel_cost (/ (fly_dist ?src ?dst) (fuel_consumption ?a)))))
;  )

;  (:durative-action fly_small
;    :parameters (?a - small_aircraft ?src - city ?dst - city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (decrease (fuel_level ?a) (* #t (fuel_consumption ?a)))
;                      (at end (increase fuel_cost (/ (fly_dist ?src ?dst) (fuel_consumption ?a)))))
;  )

;  (:durative-action fly_small
;    :parameters (?a - small_aircraft ?src - city ?dst - city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (increase fuel_cost (* #t (fuel_consumption ?a))))
;  )

  (:durative-action fly_small
    :parameters (?a - small_aircraft ?src - city ?dst - city)
    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) small_efficiency)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (decrease (fuel_level ?a) (* #t small_consumption))
                      (increase fuel_cost (* #t small_consumption)))
  )

;  (:durative-action fly_small
;    :parameters (?a - small_aircraft ?src - city ?dst - city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at end (>= (fuel_level ?a) 0))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (decrease (fuel_level ?a) (* #t (fuel_consumption ?a)))
;                      (increase fuel_cost (* #t (fuel_consumption ?a))))
;  )

;  (:durative-action zoom_small
;    :parameters (?a - small_aircraft ?src - city ?dst - city)
;    :duration   (= ?duration (/ (fly_time ?src ?dst) zoom_time_factor))
;    :condition  (and  
;                      (at start (>= (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
;                      (at end (increase fuel_cost (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor))))
;  )

; waits for all
;  (:durative-action fly_large
;    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at end (increase fuel_cost (/ (fly_dist ?src ?dst) (fuel_consumption ?a)))))
;  )

; waits for all
;  (:durative-action fly_large
;    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (decrease (fuel_level ?a) (* #t (fuel_consumption ?a)))
;                      (at end (increase fuel_cost (/ (fly_dist ?src ?dst) (fuel_consumption ?a)))))
;  )

; waits for all
;  (:durative-action fly_large
;    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (/ (fly_dist ?src ?dst) (fuel_consumption ?a))))
;                      (increase fuel_cost (* #t (fuel_consumption ?a))))
;  )

  (:durative-action fly_large
    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
    :condition  (and  (at start (>= (fuel_level ?a) (/ (fly_dist ?src ?dst) large_efficiency)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (decrease (fuel_level ?a) (* #t large_consumption))
                      (increase fuel_cost (* #t large_consumption)))
  )

;  (:durative-action fly_large
;    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
;    :duration   (= ?duration (/ (fly_dist ?src ?dst) (speed ?a)))
;    :condition  (and  (at end (>= (fuel_level ?a) 0))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (decrease (fuel_level ?a) (* #t (fuel_consumption ?a)))
;                      (increase fuel_cost (* #t (fuel_consumption ?a))))
;  )

;  (:durative-action zoom_large
;    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
;    :duration   (= ?duration (/ (fly_time ?src ?dst) zoom_time_factor))
;    :condition  (and  
;                      (at start (>= (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
;                      (at start (at ?a ?src)))
;    :effect     (and  (at start (not (at ?a ?src)))
;                      (at end (at ?a ?dst))
;                      (at end (decrease (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
;                      (at end (increase fuel_cost (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor))))
;  )
)
