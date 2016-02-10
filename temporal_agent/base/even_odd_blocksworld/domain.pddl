(define (domain even_odd_blocks)
  (:requirements :typing)

  (:types
    agent block - object
    even_agent odd_agent - agent
    even_block odd_block - block
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
  )

  (:action pick-up-even
    :duration 1
    :parameters (?a - even_agent ?x - even_block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (handempty ?a)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
    )
  )
  
  (:action pick-up-odd
    :duration 1
    :parameters (?a - odd_agent ?x - odd_block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (handempty ?a)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
      (holding ?a ?x)
    )
  )
  
  (:action put-down
    :duration 1
    :parameters (?a - agent ?x - block)
    :precondition  (and
      (holding ?a ?x)
    )
    :effect (and
      (not (holding ?a ?x))
      (clear ?x)
      (handempty ?a)
      (ontable ?x)
    )
  )
  
  (:action stack
    :duration 1
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and
      (holding ?a ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding ?a ?x))
      (not (clear ?y))
      (clear ?x)
      (handempty ?a)
      (on ?x ?y)
    )
  )
  
  (:action unstack-even
    :duration 1
    :parameters (?a - even_agent ?x - even_block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
    )
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
      (not (on ?x ?y))
    )
  )
  
  (:action unstack-odd
    :duration 1
    :parameters (?a - odd_agent ?x - odd_block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
    )
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?a))
      (not (on ?x ?y))
    )
  )
)
