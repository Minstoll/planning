(define (domain block-world)
  (:predicates
    (clear ?x)
    (on-table ?x)
    (holding ?x)
    (hand-empty)
    (on ?x ?y)
  )

  (:action pick-up
    :parameters (?b)
    :precondition (and (clear ?b) (on-table ?b) (hand-empty))
    :effect (and (holding ?b)
                 (not (on-table ?b))
                 (not (clear ?b))
                 (not (hand-empty)))
  )

  (:action put-down
    :parameters (?b)
    :precondition (holding ?b)
    :effect (and (on-table ?b)
                 (clear ?b)
                 (hand-empty)
                 (not (holding ?b)))
  )

  (:action stack
    :parameters (?b ?under)
    :precondition (and (holding ?b) (clear ?under))
    :effect (and (on ?b ?under)
                 (clear ?b)
                 (hand-empty)
                 (not (holding ?b))
                 (not (clear ?under)))
  )

  (:action unstack
    :parameters (?b ?under)
    :precondition (and (clear ?b) (on ?b ?under) (hand-empty))
    :effect (and (holding ?b)
                 (clear ?under)
                 (not (on ?b ?under))
                 (not (hand-empty)))
  )
)