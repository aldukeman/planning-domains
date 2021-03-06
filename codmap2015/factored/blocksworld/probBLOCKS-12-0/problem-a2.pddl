(define (problem BLOCKS-4-0) (:domain blocks)
(:objects
	a - block
	c - block
	b - block
	e - block
	d - block
	g - block
	f - block
	i - block
	h - block
	k - block
	j - block
	l - block

	(:private
		a2 - agent
	)
)
(:init
	(handempty a2)
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