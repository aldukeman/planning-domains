(define (problem BLOCKS-12-4-0) (:domain even_odd_blocks)
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
    l - even_block
  
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
  	(clear h)
  	(clear l)
  	(clear j)
  	(ontable c)
  	(ontable f)
  	(ontable j)
  	(on h a)
  	(on a g)
  	(on g k)
  	(on k e)
  	(on e b)
  	(on b d)
  	(on d i)
  	(on i c)
  	(on l f)
  )

  (:goal
  	(and
  		(on i c)
  		(on c b)
  		(on b l)
  		(on l d)
  		(on d j)
  		(on j e)
  		(on e k)
  		(on k f)
  		(on f a)
  		(on a h)
  		(on h g)
  	)
  )
)
