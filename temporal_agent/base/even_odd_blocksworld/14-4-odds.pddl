(define (problem BLOCKS-14-4-1) (:domain even_odd_blocks)
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
  
      a3 - odd_agent
  
  )

  (:init
    (handempty a1)
    (handempty a2)
    (handempty a3)
    (handempty a4)
        (clear   a)
        (ontable a)
        (clear   b)
        (ontable b)
        (clear   c)
        (ontable c)
        (clear   d)
        (ontable d)
        (clear   e)
        (ontable e)
        (clear   f)
        (ontable f)
        (clear   g)
        (ontable g)
        (clear   h)
        (ontable h)
        (clear   i)
        (ontable i)
        (clear   j)
        (ontable j)
        (clear   k)
        (ontable k)
        (clear   l)
        (ontable l)
        (clear   m)
        (ontable m)
        (clear   n)
        (ontable n)
  )

  (:goal
    (and
                (on a c)
                (on c e)
                (on e g)
                (on g i)
                (on i k)
                (on k m)
    )
  )
)
