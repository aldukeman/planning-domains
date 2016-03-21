(define (problem p01) (:domain zenotravel)
  (:objects
    nashville - large_city
    huntsville - small_city
    s1 - small_aircraft
    p1 p2 - person
  )

  (:init
    (= (max-passengers s1) 2)
    (= (num-passengers s1) 0)
    (= (fuel-level s1) 0)
    (= (max-fuel-level s1) 30)
    (= (fly-time nashville huntsville) 60)
    (= (fly-fuel-cost nashville huntsville) 25)
    (at p1 nashville)
    (at p2 nashville)
    (at s1 nashville)
  )

  (:goal
    (and
      (at p1 huntsville)
      (at p2 huntsville)
    )
  )

;  (:metric minimize (0))
)
