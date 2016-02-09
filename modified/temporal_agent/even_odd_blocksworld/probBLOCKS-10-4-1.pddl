(define (problem BLOCKS-10-4-1) (:domain even_odd_blocks)
  (:objects
  	a - odd_block
  	b - even_block
  	c - odd_block
  	d - even_block
  	e - odd_block
  	f - even_block
  	g - odd_block
  	h - even_block
  	i - odd_block
  	j - even_block
  
  		a1 - odd_agent
  
  		a2 - even_agent
  
  		a3 - odd_agent
  
  		a4 - even_agent
  )

  (:init
  	(handempty a1)
  	(handempty a2)
  	(handempty a3)
  	(handempty a4)
  	(clear c)
  	(clear f)
  	(ontable b)
  	(ontable h)
  	(on c g)
  	(on g e)
  	(on e i)
  	(on i j)
  	(on j a)
  	(on a b)
  	(on f d)
  	(on d h)
  )

  (:goal
  	(and
  		(on c b)
  		(on b d)
  		(on d f)
  		(on f i)
  		(on i a)
  		(on a e)
  		(on e h)
  		(on h g)
  		(on g j)
  	)
  )
)
