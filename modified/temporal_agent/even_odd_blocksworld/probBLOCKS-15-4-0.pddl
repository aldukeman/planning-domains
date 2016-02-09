(define (problem BLOCKS-15-4-0) (:domain even_odd_blocks)
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
    n - even_block
    o - odd_block
  
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
  	(clear e)
  	(clear m)
  	(clear b)
  	(clear f)
  	(clear i)
  	(ontable g)
  	(ontable n)
  	(ontable o)
  	(ontable k)
  	(ontable h)
  	(on e j)
  	(on j d)
  	(on d l)
  	(on l c)
  	(on c g)
  	(on m n)
  	(on b a)
  	(on a o)
  	(on f k)
  	(on i h)
  )

  (:goal
  	(and
  		(on g o)
  		(on o h)
  		(on h k)
  		(on k m)
  		(on m f)
  		(on f e)
  		(on e a)
  		(on a b)
  		(on b l)
  		(on l j)
  		(on j d)
  		(on d n)
  		(on n i)
  		(on i c)
  	)
  )
)
