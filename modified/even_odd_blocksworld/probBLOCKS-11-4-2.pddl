(define (problem BLOCKS-11-4-2) (:domain even_odd_blocks)
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
    k - odd_block
  
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
  	(clear b)
  	(clear i)
  	(ontable a)
  	(ontable g)
  	(on b h)
  	(on h k)
  	(on k f)
  	(on f c)
  	(on c d)
  	(on d j)
  	(on j a)
  	(on i e)
  	(on e g)
  )

  (:goal
  	(and
  		(on i g)
  		(on g c)
  		(on c d)
  		(on d e)
  		(on e j)
  		(on j b)
  		(on b h)
  		(on h a)
  		(on a f)
  		(on f k)
  	)
  )
)
