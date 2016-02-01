(define (problem BLOCKS-10-4-0) (:domain even_odd_blocks)
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
  	(ontable i)
  	(ontable f)
  	(on c e)
  	(on e j)
  	(on j b)
  	(on b g)
  	(on g h)
  	(on h a)
  	(on a d)
  	(on d i)
  )

  (:goal
  	(and
  		(on d c)
  		(on c f)
  		(on f j)
  		(on j e)
  		(on e h)
  		(on h b)
  		(on b a)
  		(on a g)
  		(on g i)
  	)
  )
)
