(define (problem BLOCKS-16-4-1) (:domain even_odd_blocks)
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
    (clear e)
    (clear l)
    (ontable j)
    (ontable o)
    (on e f)
    (on f h)
    (on h b)
    (on b c)
    (on c m)
    (on m d)
    (on d a)
    (on a p)
    (on p n)
    (on n g)
    (on g i)
    (on i k)
    (on k j)
    (on l o)
  )

  (:goal
    (and
      (on i d)
      (on d h)
      (on h f)
      (on f b)
      (on b k)
      (on k j)
      (on j g)
      (on g e)
      (on e c)
      (on c l)
      (on l m)
      (on m n)
      (on n a)
      (on a p)
      (on p o)
    )
  )
)
