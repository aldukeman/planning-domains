(define (problem BLOCKS-12-4-1) (:domain even_odd_blocks)
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
  	(clear k)
  	(ontable j)
  	(ontable d)
  	(on c g)
  	(on g h)
  	(on h i)
  	(on i f)
  	(on f b)
  	(on b a)
  	(on a l)
  	(on l e)
  	(on e j)
  	(on k d)
  )

  (:goal
  	(and
  		(on j c)
  		(on c e)
  		(on e k)
  		(on k h)
  		(on h a)
  		(on a f)
  		(on f l)
  		(on l g)
  		(on g b)
  		(on b i)
  		(on i d)
  	)
  )
)
