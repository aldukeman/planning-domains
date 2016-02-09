(define (problem BLOCKS-17-4-0) (:domain even_odd_blocks)
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
    q - odd_block

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
  	(clear q)
  	(clear l)
  	(clear g)
  	(clear h)
  	(clear p)
  	(ontable m)
  	(ontable k)
  	(ontable o)
  	(ontable n)
  	(ontable p)
  	(on q a)
  	(on a j)
  	(on j i)
  	(on i b)
  	(on b m)
  	(on l f)
  	(on f e)
  	(on e k)
  	(on g d)
  	(on d c)
  	(on c o)
  	(on h n)
  )

  (:goal
  	(and
  		(on q n)
  		(on n l)
  		(on l o)
  		(on o j)
  		(on j h)
  		(on h c)
  		(on c e)
  		(on e m)
  		(on m p)
  		(on p a)
  		(on a g)
  		(on g b)
  		(on b i)
  		(on i k)
  		(on k f)
  		(on f d)
  	)
  )
)
