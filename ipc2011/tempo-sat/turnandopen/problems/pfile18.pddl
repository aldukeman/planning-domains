


(define (problem turnandopen-4-12-46)
(:domain turnandopen-strips)
(:objects robot1 robot2 robot3 robot4 - robot
rgripper1 lgripper1 rgripper2 lgripper2 rgripper3 lgripper3 rgripper4 lgripper4 - gripper
room1 room2 room3 room4 room5 room6 room7 room8 room9 room10 room11 room12 - room
door1 door2 door3 door4 door5 door6 door7 door8 door9 door10 door11 - door
ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 ball9 ball10 ball11 ball12 ball13 ball14 ball15 ball16 ball17 ball18 ball19 ball20 ball21 ball22 ball23 ball24 ball25 ball26 ball27 ball28 ball29 ball30 ball31 ball32 ball33 ball34 ball35 ball36 ball37 ball38 ball39 ball40 ball41 ball42 ball43 ball44 ball45 ball46 - object)
(:init
(closed door1)
(closed door2)
(closed door3)
(closed door4)
(closed door5)
(closed door6)
(closed door7)
(closed door8)
(closed door9)
(closed door10)
(closed door11)
(connected room1 room2 door1)
(connected room2 room1 door1)
(connected room2 room3 door2)
(connected room3 room2 door2)
(connected room3 room4 door3)
(connected room4 room3 door3)
(connected room4 room5 door4)
(connected room5 room4 door4)
(connected room5 room6 door5)
(connected room6 room5 door5)
(connected room6 room7 door6)
(connected room7 room6 door6)
(connected room7 room8 door7)
(connected room8 room7 door7)
(connected room8 room9 door8)
(connected room9 room8 door8)
(connected room9 room10 door9)
(connected room10 room9 door9)
(connected room10 room11 door10)
(connected room11 room10 door10)
(connected room11 room12 door11)
(connected room12 room11 door11)
(at-robby robot1 room1)
(free robot1 rgripper1)
(free robot1 lgripper1)
(at-robby robot2 room10)
(free robot2 rgripper2)
(free robot2 lgripper2)
(at-robby robot3 room8)
(free robot3 rgripper3)
(free robot3 lgripper3)
(at-robby robot4 room9)
(free robot4 rgripper4)
(free robot4 lgripper4)
(at ball1 room2)
(at ball2 room3)
(at ball3 room9)
(at ball4 room10)
(at ball5 room12)
(at ball6 room3)
(at ball7 room6)
(at ball8 room4)
(at ball9 room10)
(at ball10 room5)
(at ball11 room8)
(at ball12 room5)
(at ball13 room10)
(at ball14 room4)
(at ball15 room9)
(at ball16 room3)
(at ball17 room11)
(at ball18 room3)
(at ball19 room4)
(at ball20 room8)
(at ball21 room10)
(at ball22 room11)
(at ball23 room2)
(at ball24 room3)
(at ball25 room9)
(at ball26 room3)
(at ball27 room9)
(at ball28 room10)
(at ball29 room1)
(at ball30 room5)
(at ball31 room7)
(at ball32 room2)
(at ball33 room7)
(at ball34 room4)
(at ball35 room11)
(at ball36 room7)
(at ball37 room6)
(at ball38 room5)
(at ball39 room10)
(at ball40 room4)
(at ball41 room9)
(at ball42 room6)
(at ball43 room8)
(at ball44 room7)
(at ball45 room9)
(at ball46 room4)
)
(:goal
(and
(at ball1 room10)
(at ball2 room8)
(at ball3 room7)
(at ball4 room1)
(at ball5 room4)
(at ball6 room4)
(at ball7 room11)
(at ball8 room5)
(at ball9 room6)
(at ball10 room8)
(at ball11 room8)
(at ball12 room3)
(at ball13 room5)
(at ball14 room8)
(at ball15 room7)
(at ball16 room12)
(at ball17 room9)
(at ball18 room2)
(at ball19 room3)
(at ball20 room8)
(at ball21 room8)
(at ball22 room9)
(at ball23 room1)
(at ball24 room6)
(at ball25 room12)
(at ball26 room9)
(at ball27 room11)
(at ball28 room8)
(at ball29 room4)
(at ball30 room8)
(at ball31 room12)
(at ball32 room1)
(at ball33 room4)
(at ball34 room6)
(at ball35 room1)
(at ball36 room7)
(at ball37 room9)
(at ball38 room12)
(at ball39 room11)
(at ball40 room3)
(at ball41 room7)
(at ball42 room7)
(at ball43 room6)
(at ball44 room12)
(at ball45 room2)
(at ball46 room12)
)
)
(:metric minimize (total-time))

)


