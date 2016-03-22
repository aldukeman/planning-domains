(define (problem p01) (:domain zenotravel)
  (:objects
    chicago nashville atlanta - large_city
    huntsville - small_city
    s1 - small_aircraft
    l1 - large_aircraft
    p1 p2 p3 p4 p5 - person
  )

  (:init
    (= zoom_fuel_factor 2)
    (= zoom_time_factor 1.25)

    (at s1 huntsville)
    (= (num_passengers s1) 0)
    (= (max_passengers s1) 4)
    (= (fuel_level s1) 0)
    (= (max_fuel_level s1) 40)

    (at l1 nashville)
    (= (num_passengers l1) 0)
    (= (max_passengers l1) 8)
    (= (fuel_level l1) 0)
    (= (max_fuel_level l1) 100)

    (at p1 atlanta)
    (at p2 huntsville)
    (at p3 chicago)
    (at p4 chicago)
    (at p5 nashville)

    (= (fly_time nashville huntsville) 60)
    (= (fly_time huntsville nashville) 60)
    (= (fly_fuel_cost nashville huntsville) 25)
    (= (fly_fuel_cost huntsville nashville) 25)

    (= (fly_time nashville atlanta) 80)
    (= (fly_time atlanta nashville) 80)
    (= (fly_fuel_cost nashville atlanta) 30)
    (= (fly_fuel_cost atlanta nashville) 30)

    (= (fly_time nashville chicago) 120)
    (= (fly_time chicago nashville) 120)
    (= (fly_fuel_cost nashville chicago) 45)
    (= (fly_fuel_cost chicago nashville) 45)
  )

  (:goal
    (and
      (at p1 chicago)
      (at p2 atlanta)
      (at p3 atlanta)
      (at p4 nashville)
      (at p5 chicago)
    )
  )

  (:metric minimize (total-time))
)
