(define (domain block-stacking)

  (:predicates 
    (clear ?x)
    (on-table ?x)
    (on ?x ?y)
    (holding ?x)
    (hand-empty)
  )

  (:action pickup
    :parameters (?x)
    :precondition (and (hand-empty) (clear ?x) (on-table ?x))
    :effect (and (holding ?x) (not (hand-empty)) (not (clear ?x)) (not (on-table ?x)))
  )

  (:action putdown
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (hand-empty) (clear ?x) (on-table ?x) (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y))
    :effect (and (holding ?x) (hand-empty) (clear ?y) (not (on ?x ?y)) (not (clear ?x)))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and (hand-empty) (on ?x ?y) (clear ?x) (not (clear ?y)) (not (holding ?x)))
  )
)