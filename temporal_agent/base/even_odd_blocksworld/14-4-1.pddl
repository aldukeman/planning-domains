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
    (clear c)
    (clear i)
    (clear h)
    (clear n)
    (ontable j)
    (ontable e)
    (ontable m)
    (ontable b)
    (ontable n)
    (on g j)
    (on c e)
    (on i d)
    (on d l)
    (on l m)
    (on h f)
    (on f a)
    (on a k)
    (on k b)
  )

  (:goal
    (and
      (on j d)
      (on d b)
      (on b h)
      (on h m)
      (on m k)
      (on k f)
      (on f g)
      (on g a)
      (on a i)
      (on i e)
      (on e l)
      (on l n)
      (on n c)
    )
  )
)
