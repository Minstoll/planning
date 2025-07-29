(define (domain block-stacking)
  (:predicates
    (clear ?x)
    (on-table ?x)
    (holding ?x)
    (hand-empty)
    (on ?x ?y)
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (on-table ?x) (hand-empty))
    :effect (and (holding ?x) (not (clear ?x)) (not (on-table ?x)) (not (hand-empty)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (on-table ?x) (clear ?x) (hand-empty) (not (holding ?x)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (on ?x ?y) (clear ?x) (hand-empty) (not (holding ?x)) (not (clear ?y)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (hand-empty))
    :effect (and (holding ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (hand-empty)))
  )
)