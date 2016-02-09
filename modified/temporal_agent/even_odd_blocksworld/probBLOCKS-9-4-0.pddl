(define (problem BLOCKS-9-4-0) (:domain even_odd_blocks)
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
  
  	(:private a1
  		a1 - odd_agent
  	)
  
  	(:private a2
  		a2 - even_agent
  	)
  
  	(:private a3
  		a3 - odd_agent
  	)
  
  	(:private a4
  		a4 - even_agent
  	)
  )

  (:init
  	(handempty a1)
  	(handempty a2)
  	(handempty a3)
  	(handempty a4)
  	(clear c)
  	(clear f)
  	(ontable c)
  	(ontable b)
  	(on f g)
  	(on g e)
  	(on e a)
  	(on a i)
  	(on i d)
  	(on d h)
  	(on h b)
  )

  (:goal
  	(and
  		(on g d)
  		(on d b)
  		(on b c)
  		(on c a)
  		(on a i)
  		(on i f)
  		(on f e)
  		(on e h)
  	)
  )
)