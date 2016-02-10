(define (problem BLOCKS-10-4-2) (:domain even_odd_blocks)
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
    (clear c)
    (ontable a)
    (ontable c)
    (on j i)
    (on i h)
    (on h f)
    (on f d)
    (on d e)
    (on e g)
    (on g b)
    (on b a)
  )

  (:goal
    (and
      (on b e)
      (on e i)
      (on i g)
      (on g h)
      (on h c)
      (on c a)
      (on a f)
      (on f j)
      (on j d)
    )
  )
)
