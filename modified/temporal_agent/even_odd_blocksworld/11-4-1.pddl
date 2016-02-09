(define (problem BLOCKS-11-4-1) (:domain even_odd_blocks)
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
  	(clear j)
  	(clear f)
  	(clear d)
  	(clear g)
  	(ontable i)
  	(ontable k)
  	(ontable h)
  	(ontable a)
  	(on j i)
  	(on f e)
  	(on e k)
  	(on d c)
  	(on c h)
  	(on g b)
  	(on b a)
  )

  (:goal
  	(and
  		(on b d)
  		(on d j)
  		(on j k)
  		(on k h)
  		(on h a)
  		(on a c)
  		(on c f)
  		(on f g)
  		(on g i)
  		(on i e)
  	)
  )
)
