(define (domain even_odd_blocks)
  (:requirements :typing :multi-agent :unfactored-privacy)

  (:types
    agent block - object
    even_agent odd_agent - agent
    even_block odd_block - block
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  
    (:private ?agent - agent
      (holding ?agent - agent ?x - block)
      (handempty ?agent - agent)
    )
  )

  (:action pick-up-even
    :agent ?a - even_agent
    :parameters (?x - even_block)
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
    :agent ?a - odd_agent
    :parameters (?x - odd_block)
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
    :agent ?a - agent
    :parameters (?x - block)
    :precondition 
      (holding ?a ?x)
    :effect (and
      (not (holding ?a ?x))
      (clear ?x)
      (handempty ?a)
      (ontable ?x)
    )
  )
  
  (:action stack
    :agent ?a - agent
    :parameters (?x - block ?y - block)
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
    :agent ?a - even_agent
    :parameters (?x - even_block ?y - block)
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
    :agent ?a - odd_agent
    :parameters (?x - odd_block ?y - block)
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
