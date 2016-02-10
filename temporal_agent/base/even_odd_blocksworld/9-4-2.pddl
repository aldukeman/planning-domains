(define (problem BLOCKS-9-4-2) (:domain even_odd_blocks)
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
    (clear h)
    (clear f)
    (ontable g)
    (ontable f)
    (on h a)
    (on a d)
    (on d e)
    (on e c)
    (on c i)
    (on i b)
    (on b g)
  )

  (:goal
    (and
      (on f g)
      (on g h)
      (on h d)
      (on d i)
      (on i e)
      (on e b)
      (on b c)
      (on c a)
    )
  )
)
