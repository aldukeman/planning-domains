(define (problem BLOCKS-9-4-1) (:domain even_odd_blocks)
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
    (ontable a)
    (on f e)
    (on e b)
    (on b d)
    (on d c)
    (on c i)
    (on i g)
    (on g h)
    (on h a)
  )

  (:goal
    (and
      (on d i)
      (on i a)
      (on a b)
      (on b h)
      (on h g)
      (on g f)
      (on f e)
      (on e c)
    )
  )
)
