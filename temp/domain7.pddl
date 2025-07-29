(define (domain block-stacking)
  (:predicates
    (empty ?hand)
    (clear ?block)
    (on-table ?block)
    (on ?block1 ?block2)
    (holding ?block)
  )

  (:action pick-up
    :parameters (?block)
    :precondition (and (clear ?block) (on-table ?block) (empty hand))
    :effect (and (not (clear ?block))
                 (not (on-table ?block))
                 (not (empty hand))
                 (holding ?block))
  )

  (:action put-down
    :parameters (?block)
    :precondition (holding ?block)
    :effect (and (clear ?block)
                 (on-table ?block)
                 (not (holding ?block))
                 (empty hand))
  )

  (:action unstack
    :parameters (?block1 ?block2)
    :precondition (and (on ?block1 ?block2) (clear ?block1) (empty hand))
    :effect (and (clear ?block2)
                 (not (on ?block1 ?block2))
                 (not (empty hand))
                 (holding ?block1))
  )

  (:action stack
    :parameters (?block1 ?block2)
    :precondition (and (holding ?block1) (clear ?block2))
    :effect (and (on ?block1 ?block2)
                 (not (holding ?block1))
                 (not (clear ?block2))
                 (empty hand))
  )
)