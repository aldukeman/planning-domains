(define (problem BLOCKS-13-4-1) (:domain even_odd_blocks)
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
    m - odd_block
  
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
  	(clear b)
  	(ontable f)
  	(ontable k)
  	(on j e)
  	(on e d)
  	(on d c)
  	(on c a)
  	(on a l)
  	(on l h)
  	(on h g)
  	(on g m)
  	(on m i)
  	(on i f)
  	(on b k)
  )

  (:goal
  	(and
  		(on d a)
  		(on a e)
  		(on e l)
  		(on l m)
  		(on m c)
  		(on c j)
  		(on j f)
  		(on f k)
  		(on k g)
  		(on g h)
  		(on h i)
  		(on i b)
  	)
  )
)
