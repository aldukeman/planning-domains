(define (problem BLOCKS-13-4-0) (:domain even_odd_blocks)
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
  	(clear b)
  	(clear i)
  	(clear m)
  	(ontable k)
  	(ontable g)
  	(ontable m)
  	(on b f)
  	(on f d)
  	(on d c)
  	(on c j)
  	(on j a)
  	(on a e)
  	(on e h)
  	(on h l)
  	(on l k)
  	(on i g)
  )

  (:goal
  	(and
  		(on g i)
  		(on i c)
  		(on c d)
  		(on d f)
  		(on f a)
  		(on a m)
  		(on m h)
  		(on h e)
  		(on e l)
  		(on l j)
  		(on j b)
  		(on b k)
  	)
  )
)
