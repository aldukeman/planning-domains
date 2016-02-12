(define (domain sokoban-temporal)
  (:requirements
    :typing
  )
  (:types
    stone agent location direction - object
    player - agent
  )
  (:predicates
    (clear ?l - location)
    (stone-at ?s - stone ?l - location)
    (player-at ?p - player ?l - location)
    (at-goal ?s - stone)
    (IS-GOAL ?l - location)
    (IS-NONGOAL ?l - location)
    (MOVE-DIR ?from - location ?to - location ?dir - direction)
  )

  (:action move
   :parameters (?p - player ?from - location ?to - location ?dir - direction)
   :duration 1
   :precondition (and (player-at ?p ?from)
                   (clear ?to)
                   (MOVE-DIR ?from ?to ?dir)
                   )
   :effect    (and (not (player-at ?p ?from))
                   (not (clear ?to))
                   (player-at ?p ?to)
                   (clear ?from)
                   )
   )

  (:action push-to-nongoal
   :parameters (?p - player ?s - stone
                ?ppos - location ?from - location ?to - location
                ?dir - direction)
   :duration 1
   :precondition (and (player-at ?p ?ppos)
                   (stone-at ?s ?from)
                   (clear ?to)
                   (MOVE-DIR ?ppos ?from ?dir)
                   (MOVE-DIR ?from ?to ?dir)
                   (IS-NONGOAL ?to)
                   )
   :effect    (and (not (player-at ?p ?ppos))
                   (not (stone-at ?s ?from))
                   (not (clear ?to))
                   (player-at ?p ?from)
                   (stone-at ?s ?to)
                   (clear ?ppos)
                   (not (at-goal ?s))
                   )
   )

  (:action push-to-goal
   :parameters (?p - player ?s - stone
                ?ppos - location ?from - location ?to - location
                ?dir - direction)
   :duration 1
   :precondition (and (player-at ?p ?ppos)
                   (stone-at ?s ?from)
                   (clear ?to)
                   (MOVE-DIR ?ppos ?from ?dir)
                   (MOVE-DIR ?from ?to ?dir)
                   (IS-GOAL ?to)
                   )
   :effect    (and (not (player-at ?p ?ppos))
                   (not (stone-at ?s ?from))
                   (not (clear ?to))
                   (player-at ?p ?from)
                   (stone-at ?s ?to)
                   (clear ?ppos)
                   (at-goal ?s)
                   )
   )
)
