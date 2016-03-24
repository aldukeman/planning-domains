(define (problem p01) (:domain zenotravel)
  (:objects
    nashville memphis st_louis louisville atlanta charlotte columbia jacksonville birmingham new_orleans - large_city
    huntsville evansville knoxville chattanooga raleigh augusta mobile little_rock - small_city
    s0 s1 s2 - small_aircraft ; based on Cessna 172
    l0 l1 l2 - large_aircraft ; based on Learjet 85
    p0 p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 - person
  )

  (:init
    (= fuel_cost 0)

    (= small_speed 2.33)
    (= large_speed 8.58)
    (= small_efficiency 14.29)
    (= large_efficiency 2.5)
    (= small_consumption 0.163)
    (= large_consumption 3.432)
    (= zoom_speed_const 1.1)
    (= zoom_consumption_const 1.3)
    (= refuel_rate_const 20)

    (at s0 atlanta)
    (= (num_passengers s0) 0)
    (= (max_passengers s0) 3)
    (= (fuel_level s0) 0)
    (= (max_fuel_level s0) 40)
    (= (speed s0) 2.33)
    (= (fuel_efficiency s0) 14.29)
    (= (zoom_speed s0) 1.1)
    (= (zoom_consumption s0) 1.3)
    (= (refuel_rate s0) 20)

    (at s1 charlotte)
    (= (num_passengers s1) 0)
    (= (max_passengers s1) 3)
    (= (fuel_level s1) 0)
    (= (max_fuel_level s1) 40)
    (= (speed s1) 2.33)
    (= (fuel_efficiency s1) 14.29)
    (= (zoom_speed s1) 1.1)
    (= (zoom_consumption s1) 1.3)
    (= (refuel_rate s1) 20)

    (at s2 new_orleans)
    (= (num_passengers s2) 0)
    (= (max_passengers s2) 3)
    (= (fuel_level s2) 0)
    (= (max_fuel_level s2) 40)
    (= (speed s2) 2.33)
    (= (fuel_efficiency s2) 14.29)
    (= (zoom_speed s2) 1.1)
    (= (zoom_consumption s2) 1.3)
    (= (refuel_rate s2) 20)

    (at l0 nashville)
    (= (num_passengers l0) 0)
    (= (max_passengers l0) 8)
    (= (fuel_level l0) 0)
    (= (max_fuel_level l0) 1200)
    (= (speed l0) 8.58)
    (= (fuel_efficiency l0) 2.5)
    (= (zoom_speed l0) 1.1)
    (= (zoom_consumption l0) 1.3)
    (= (refuel_rate l0) 20)

    (at l1 louisville)
    (= (num_passengers l1) 0)
    (= (max_passengers l1) 8)
    (= (fuel_level l1) 0)
    (= (max_fuel_level l1) 1200)
    (= (speed l1) 8.58)
    (= (fuel_efficiency l1) 2.5)
    (= (zoom_speed l1) 1.1)
    (= (zoom_consumption l1) 1.3)
    (= (refuel_rate l1) 20)

    (at l2 memphis)
    (= (num_passengers l2) 0)
    (= (max_passengers l2) 8)
    (= (fuel_level l2) 0)
    (= (max_fuel_level l2) 1200)
    (= (speed l2) 8.58)
    (= (fuel_efficiency l2) 2.5)
    (= (zoom_speed l2) 1.1)
    (= (zoom_consumption l2) 1.3)
    (= (refuel_rate l2) 20)

    (at p0 huntsville)
    (at p1 huntsville)
    (at p2 huntsville)
    (at p3 huntsville)
    (at p4 nashville)
    (at p5 nashville)
    (at p6 nashville)
    (at p7 nashville)
    (at p8 nashville)
    (at p9 nashville)
    (at p10 augusta)
    (at p11 augusta)
    (at p12 augusta)
    (at p13 augusta)
    (at p14 augusta)
    (at p15 columbia)
    (at p16 columbia)
    (at p17 columbia)
    (at p18 columbia)
    (at p19 columbia)

    (= (fly_dist nashville memphis) 197)
    (= (fly_dist memphis nashville) 197)

    (= (fly_dist nashville st_louis) 254)
    (= (fly_dist st_louis nashville) 254)

    (= (fly_dist nashville louisville) 155)
    (= (fly_dist louisville nashville) 155)

    (= (fly_dist nashville atlanta) 248)
    (= (fly_dist atlanta nashville) 248)

    (= (fly_dist nashville charlotte) 340)
    (= (fly_dist charlotte nashville) 340)

    (= (fly_dist nashville columbia) 358)
    (= (fly_dist columbia nashville) 358)

    (= (fly_dist nashville jacksonville) 500)
    (= (fly_dist jacksonville nashville) 500)

    (= (fly_dist nashville birmingham) 182)
    (= (fly_dist birmingham nashville) 182)

    (= (fly_dist nashville new_orleans) 470)
    (= (fly_dist new_orleans nashville) 470)

    (= (fly_dist nashville huntsville) 100)
    (= (fly_dist huntsville nashville) 100)

    (= (fly_dist nashville evansville) 132)
    (= (fly_dist evansville nashville) 132)

    (= (fly_dist nashville knoxville) 161)
    (= (fly_dist knoxville nashville) 161)

    (= (fly_dist nashville chattanooga) 113)
    (= (fly_dist chattanooga nashville) 113)

    (= (fly_dist memphis st_louis) 241)
    (= (fly_dist st_louis memphis) 241)

    (= (fly_dist memphis louisville) 320)
    (= (fly_dist louisville memphis) 320)

    (= (fly_dist memphis atlanta) 337)
    (= (fly_dist atlanta memphis) 337)

    (= (fly_dist memphis charlotte) 520)
    (= (fly_dist charlotte memphis) 520)

    (= (fly_dist memphis columbia) 519)
    (= (fly_dist columbia memphis) 519)

    (= (fly_dist memphis jacksonville) 591)
    (= (fly_dist jacksonville memphis) 591)

    (= (fly_dist memphis birmingham) 217)
    (= (fly_dist birmingham memphis) 217)

    (= (fly_dist memphis new_orleans) 360)
    (= (fly_dist new_orleans memphis) 360)

    (= (fly_dist memphis little_rock) 130)
    (= (fly_dist little_rock memphis) 360)

    (= (fly_dist st_louis louisville) 242)
    (= (fly_dist louisville st_louis) 242)

    (= (fly_dist st_louis atlanta) 468)
    (= (fly_dist atlanta st_louis) 468)

    (= (fly_dist st_louis charlotte) 568)
    (= (fly_dist charlotte st_louis) 568)

    (= (fly_dist st_louis columbia) 602)
    (= (fly_dist columbia st_louis) 602)

    (= (fly_dist st_louis jacksonville) 752)
    (= (fly_dist jacksonville st_louis) 752)

    (= (fly_dist st_louis birmingham) 401)
    (= (fly_dist birmingham st_louis) 401)

    (= (fly_dist st_louis new_orleans) 600)
    (= (fly_dist new_orleans st_louis) 600)

    (= (fly_dist st_louis evansville) 150)
    (= (fly_dist evansville st_louis) 150)

    (= (fly_dist louisville atlanta) 321)
    (= (fly_dist atlanta louisville) 321)

    (= (fly_dist louisville charlotte) 343)
    (= (fly_dist charlotte louisville) 343)

    (= (fly_dist louisville columbia) 395)
    (= (fly_dist columbia louisville) 395)

    (= (fly_dist louisville jacksonville) 596)
    (= (fly_dist jacksonville louisville) 596)

    (= (fly_dist louisville birmingham) 333)
    (= (fly_dist birmingham louisville) 333)

    (= (fly_dist louisville new_orleans) 625)
    (= (fly_dist new_orleans louisville) 625)

    (= (fly_dist louisville evansville) 101)
    (= (fly_dist evansville louisville) 101)

    (= (fly_dist atlanta charlotte) 226)
    (= (fly_dist charlotte atlanta) 226)

    (= (fly_dist atlanta columbia) 193)
    (= (fly_dist columbia atlanta) 193)

    (= (fly_dist atlanta jacksonville) 286)
    (= (fly_dist jacksonville atlanta) 286)

    (= (fly_dist atlanta birmingham) 140)
    (= (fly_dist birmingham atlanta) 140)

    (= (fly_dist atlanta new_orleans) 425)
    (= (fly_dist new_orleans atlanta) 425)

    (= (fly_dist atlanta huntsville) 143)
    (= (fly_dist huntsville atlanta) 143)

    (= (fly_dist atlanta chattanooga) 104)
    (= (fly_dist chattanooga atlanta) 104)

    (= (fly_dist atlanta augusta) 138)
    (= (fly_dist augusta atlanta) 138)

    (= (fly_dist charlotte columbia) 85)
    (= (fly_dist columbia charlotte) 85)

    (= (fly_dist charlotte jacksonville) 342)
    (= (fly_dist jacksonville charlotte) 342)

    (= (fly_dist charlotte birmingham) 360)
    (= (fly_dist birmingham charlotte) 360)

    (= (fly_dist charlotte new_orleans) 650)
    (= (fly_dist new_orleans charlotte) 650)

    (= (fly_dist charlotte raleigh) 130)
    (= (fly_dist raleigh charlotte) 130)

    (= (fly_dist charlotte augusta) 138)
    (= (fly_dist augusta charlotte) 138)

    (= (fly_dist columbia jacksonville) 256)
    (= (fly_dist jacksonville columbia) 256)

    (= (fly_dist columbia birmingham) 333)
    (= (fly_dist birmingham columbia) 333)

    (= (fly_dist columbia new_orleans) 599)
    (= (fly_dist new_orleans columbia) 599)

    (= (fly_dist columbia augusta) 599)
    (= (fly_dist augusta columbia) 599)

    (= (fly_dist jacksonville birmingham) 374)
    (= (fly_dist birmingham jacksonville) 374)

    (= (fly_dist jacksonville new_orleans) 504)
    (= (fly_dist new_orleans jacksonville) 504)

    (= (fly_dist birmingham new_orleans) 313)
    (= (fly_dist new_orleans birmingham) 313)

    (= (fly_dist birmingham huntsville) 85)
    (= (fly_dist huntsville birmingham) 85)

    (= (fly_dist birmingham chattanooga) 136)
    (= (fly_dist chattanooga birmingham) 136)

    (= (fly_dist birmingham mobile) 208)
    (= (fly_dist mobile birmingham) 208)
  )

  (:goal
    (and
      (at p0 st_louis)
      (at p1 st_louis)
      (at p2 st_louis)
      (at p3 st_louis)
      (at p4 jacksonville)
      (at p5 jacksonville)
      (at p6 jacksonville)
      (at p7 jacksonville)
      (at p8 jacksonville)
      (at p9 jacksonville)
      (at p10 charlotte)
      (at p11 charlotte)
      (at p12 charlotte)
      (at p13 charlotte)
      (at p14 charlotte)
      (at p15 new_orleans)
      (at p16 new_orleans)
      (at p17 new_orleans)
      (at p18 new_orleans)
      (at p19 new_orleans)
    )
  )

  (:metric minimize (+ total-time (* fuel_cost 10)))
)
