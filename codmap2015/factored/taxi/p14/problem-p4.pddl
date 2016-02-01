(define (problem taxi-14) (:domain taxi)
(:objects
	g1 - location
	g2 - location
	g3 - location
	c - location
	d - location
	h1 - location
	h2 - location
	h3 - location
)
(:init
	(directly-connected g1 c)
	(directly-connected g1 d)
	(directly-connected g2 c)
	(directly-connected g2 d)
	(directly-connected g3 c)
	(directly-connected g3 d)
	(directly-connected c g1)
	(directly-connected c g2)
	(directly-connected c g3)
	(directly-connected c d)
	(directly-connected c h1)
	(directly-connected c h2)
	(directly-connected c h3)
	(directly-connected d g1)
	(directly-connected d g2)
	(directly-connected d g3)
	(directly-connected d c)
	(directly-connected d h1)
	(directly-connected d h2)
	(directly-connected d h3)
	(directly-connected h1 c)
	(directly-connected h1 d)
	(directly-connected h1 h2)
	(directly-connected h2 c)
	(directly-connected h2 d)
	(directly-connected h2 h1)
	(directly-connected h2 h3)
	(directly-connected h3 c)
	(directly-connected h3 d)
	(directly-connected h3 h2)
	(at t1 g1)
	(at t2 g2)
	(at t3 g3)
	(empty t1)
	(empty t2)
	(empty t3)
	(at p1 h1)
	(at p2 h2)
	(at p3 h3)
	(at p4 d)
	(at p5 g3)
	(free h1)
	(free h2)
	(free h3)
	(free c)
	(free d)
	
	
	
	(goal-of p4 c)
	
)
(:goal
	(and
		(at t1 g1)
		(at t2 g2)
		(at t3 g3)
		(at p1 c)
		(at p2 c)
		(at p3 c)
		(at p4 c)
		(at p5 c)
	)
)
)