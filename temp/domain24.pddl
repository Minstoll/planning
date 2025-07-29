(define (domain block-arrangement)
  (:predicates 
    (on-table ?block)
    (on ?block1 ?block2)
    (clear ?block)
    (holding ?block)
    (hand-empty)
  )

  (:action pick-up
    :parameters (?block)
    :precondition (and (clear ?block) (on-table ?block) (hand-empty))
    :effect (and (holding ?block) (not (clear ?block)) (not (on-table ?block)) (not (hand-empty)))
  )

  (:action put-down
    :parameters (?block)
    :precondition (holding ?block)
    :effect (and (on-table ?block) (clear ?block) (hand-empty) (not (holding ?block)))
  )

  (:action stack
    :parameters (?block1 ?block2)
    :precondition (and (holding ?block1) (clear ?block2))
    :effect (and (on ?block1 ?block2) (clear ?block1) (hand-empty) (not (holding ?block1)) (not (clear ?block2)))
  )

  (:action unstack
    :parameters (?block1 ?block2)
    :precondition (and (on ?block1 ?block2) (clear ?block1) (hand-empty))
    :effect (and (holding ?block1) (clear ?block2) (not (on ?block1 ?block2)) (not (clear ?block1)) (not (hand-empty)))
  )
)