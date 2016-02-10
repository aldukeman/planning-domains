(define (problem BLOCKS-11-4-0) (:domain even_odd_blocks)
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
    (clear b)
    (clear j)
    (clear c)
    (ontable i)
    (ontable d)
    (ontable e)
    (on b g)
    (on g h)
    (on h k)
    (on k a)
    (on a f)
    (on f i)
    (on j d)
    (on c e)
  )

  (:goal
    (and
      (on a j)
      (on j d)
      (on d b)
      (on b h)
      (on h k)
      (on k i)
      (on i f)
      (on f e)
      (on e g)
      (on g c)
    )
  )
)
