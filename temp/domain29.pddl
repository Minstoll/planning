(define (domain blocksworld)
  (:predicates
    (clear ?x)
    (on-table ?x)
    (holding ?x)
    (on ?x ?y)
    (hand-empty)
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (hand-empty) (on-table ?x))
    :effect (and (holding ?x)
                 (not (hand-empty))
                 (not (clear ?x))
                 (not (on-table ?x)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (hand-empty)
                 (clear ?x)
                 (on-table ?x)
                 (not (holding ?x)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y)
                 (hand-empty)
                 (clear ?x)
                 (not (clear ?y))
                 (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (holding ?x)
                 (clear ?y)
                 (not (on ?x ?y))
                 (not (hand-empty))
                 (not (clear ?x)))
  )
)