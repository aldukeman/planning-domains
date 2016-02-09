(define (problem BLOCKS-14-4-0) (:domain even_odd_blocks)
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
  	(clear a)
  	(clear g)
  	(clear f)
  	(ontable e)
  	(ontable n)
  	(ontable f)
  	(on a j)
  	(on j h)
  	(on h m)
  	(on m k)
  	(on k c)
  	(on c l)
  	(on l b)
  	(on b e)
  	(on g d)
  	(on d i)
  	(on i n)
  )

  (:goal
  	(and
  		(on e l)
  		(on l f)
  		(on f b)
  		(on b j)
  		(on j i)
  		(on i n)
  		(on n c)
  		(on c k)
  		(on k g)
  		(on g d)
  		(on d m)
  		(on m a)
  		(on a h)
  	)
  )
)
