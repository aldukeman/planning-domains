(define (problem BLOCKS-16-4-0) (:domain even_odd_blocks)
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
    p - even_block

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
  	(clear f)
  	(clear h)
  	(clear o)
  	(ontable a)
  	(ontable e)
  	(ontable g)
  	(on f l)
  	(on l m)
  	(on m j)
  	(on j p)
  	(on p n)
  	(on n i)
  	(on i b)
  	(on b d)
  	(on d c)
  	(on c k)
  	(on k a)
  	(on h e)
  	(on o g)
  )

  (:goal
  	(and
  		(on d b)
  		(on b p)
  		(on p f)
  		(on f g)
  		(on g k)
  		(on k i)
  		(on i l)
  		(on l j)
  		(on j h)
  		(on h a)
  		(on a n)
  		(on n e)
  		(on e m)
  		(on m c)
  		(on c o)
  	)
  )
)
