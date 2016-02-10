(define (problem BLOCKS-15-4-1) (:domain even_odd_blocks)
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
    (clear g)
    (clear o)
    (ontable i)
    (ontable m)
    (on g l)
    (on l f)
    (on f c)
    (on c n)
    (on n e)
    (on e h)
    (on h d)
    (on d a)
    (on a k)
    (on k b)
    (on b j)
    (on j i)
    (on o m)
  )

  (:goal
    (and
      (on d g)
      (on g f)
      (on f k)
      (on k j)
      (on j e)
      (on e m)
      (on m a)
      (on a b)
      (on b c)
      (on c n)
      (on n o)
      (on o i)
      (on i l)
      (on l h)
    )
  )
)
