(define (domain blocksworld)

  (:predicates
    (clear ?x)
    (on-table ?x)
    (holding ?x)
    (empty-hand)
    (on ?x ?y)
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (on-table ?x) (empty-hand))
    :effect (and (holding ?x)
                 (not (clear ?x))
                 (not (on-table ?x))
                 (not (empty-hand)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (on-table ?x)
                 (clear ?x)
                 (empty-hand)
                 (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (empty-hand))
    :effect (and (holding ?x)
                 (clear ?y)
                 (not (on ?x ?y))
                 (not (empty-hand)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y)
                 (empty-hand)
                 (not (clear ?y))
                 (not (holding ?x)))
  )
)