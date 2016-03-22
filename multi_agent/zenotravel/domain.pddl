(define (domain zenotravel)
  (:requirements :fluents :durative-actions :typing :duration-inequalities)
  
  (:types locatable city - object
          aircraft loaded - locatable
          person cargo - loaded
          small_aircraft large_aircraft - aircraft
          small_city large_city - city)

  (:predicates  (at ?l - locatable ?c - city)
                (in ?p - loaded ?a - aircraft)
                (fuel_level ?a - aircraft ?n - fuel-amount)
                (next ?n1 ?n2 - fuel-amount))
  
  (:functions   (zoom_time_factor) - number
                (zoom_fuel_factor) - number
                (fuel_cost) - number
                (fuel_level ?a - aircraft) - number
                (max_fuel_level ?a - aircraft) - number
                (fly_time ?c1 - city ?c2 - city) - number
                (fly_fuel_cost ?c1 - city ?c2 - city) - number
                (zoom_time ?c1 - city ?c2 - city) - number
                (zoom_fuel_cost ?c1 - city ?c2 - city) - number
                (num_cargo ?a - aircraft) - number
                (max_cargo ?a - aircraft) - number
                (num_passengers ?a - aircraft) - number
                (max_passengers ?a - aircraft) - number)

  (:durative-action board
    :parameters (?p - person ?a - aircraft ?c - city)
    :duration   (= ?duration 0.5)
    :condition  (and  (at start (at ?p ?c))
                      (over all (at ?a ?c))
                      (at start (< (num_passengers ?a) (max_passengers ?a))))
    :effect     (and  (at start (not (at ?p ?c)))
                      (at end (in ?p ?a))
                      (at start (increase (num_passengers ?a) 1)))
  )

  (:durative-action debark
    :parameters (?p - person ?a - aircraft ?c - city)
    :duration   (= ?duration 0.5)
    :condition  (and  (at start (in ?p ?a))
                      (over all (at ?a ?c)))
    :effect     (and  (at start (not (in ?p ?a)))
                      (at end (at ?p ?c))
                      (at end (decrease (num_passengers ?a) 1)))
  )

  (:durative-action refuel
    :parameters (?a - aircraft ?c - city)
    :duration   (= ?duration (- (max_fuel_level ?a) (fuel_level ?a)))
    :condition  (over all (at ?a ?c))
    :effect     (at end (assign (fuel_level ?a) (max_fuel_level ?a)))
  )

  (:durative-action refuel_for_fly
    :parameters (?a - aircraft ?src - city ?dst - city)
    :duration   (= ?duration (fly_fuel_cost ?src ?dst))
    :condition  (and  (over all (at ?a ?src))
                      (at start (<= (fuel_level ?a) (- (max_fuel_level ?a) (fly_fuel_cost ?src ?dst)))))
    :effect     (at end (increase (fuel_level ?a) (fly_fuel_cost ?src ?dst)))
  )

  (:durative-action refuel_for_zoom
    :parameters (?a - aircraft ?src - city ?dst - city)
    :duration   (= ?duration (* (fly_fuel_cost ?src ?dst) zoom_fuel_cost))
    :condition  (and  (over all (at ?a ?src))
                      (at end (<= (fuel_level ?a) (max_fuel_level ?a))))
    :effect     (at end (increase (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_cost)))
  )

  (:durative-action fly_small
    :parameters (?a - small_aircraft ?src - city ?dst - city)
    :duration   (= ?duration (fly_time ?src ?dst))
    :condition  (and  
                      (at start (>= (fuel_level ?a) (fly_fuel_cost ?src ?dst)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (at end (decrease (fuel_level ?a) (fly_fuel_cost ?src ?dst)))
                      (at end (increase fuel_cost (fly_fuel_cost ?src ?dst))))
  )

  (:durative-action zoom_small
    :parameters (?a - small_aircraft ?src - city ?dst - city)
    :duration   (= ?duration (/ (fly_time ?src ?dst) zoom_time_factor))
    :condition  (and  
                      (at start (>= (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (at end (decrease (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
                      (at end (increase fuel_cost (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor))))
  )

  (:durative-action fly_large
    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
    :duration   (= ?duration (fly_time ?src ?dst))
    :condition  (and  
                      (at start (>= (fuel_level ?a) (fly_fuel_cost ?src ?dst)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (at end (decrease (fuel_level ?a) (fly_fuel_cost ?src ?dst)))
                      (at end (increase fuel_cost (fly_fuel_cost ?src ?dst))))
  )

  (:durative-action zoom_large
    :parameters (?a - large_aircraft ?src - large_city ?dst - large_city)
    :duration   (= ?duration (/ (fly_time ?src ?dst) zoom_time_factor))
    :condition  (and  
                      (at start (>= (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
                      (at start (at ?a ?src)))
    :effect     (and  (at start (not (at ?a ?src)))
                      (at end (at ?a ?dst))
                      (at end (decrease (fuel_level ?a) (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor)))
                      (at end (increase fuel_cost (* (fly_fuel_cost ?src ?dst) zoom_fuel_factor))))
  )
)
