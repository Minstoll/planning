(define (domain block-stacking)
  (:predicates
    (clear ?b)
    (on-table ?b)
    (holding ?b)
    (on ?b ?b2)
    (handempty)
  )

  (:action pick-up
    :parameters (?b)
    :precondition (and (clear ?b) (on-table ?b) (handempty))
    :effect (and (holding ?b)
                 (not (clear ?b))
                 (not (on-table ?b))
                 (not (handempty))
          )
  )

  (:action put-down
    :parameters (?b)
    :precondition (holding ?b)
    :effect (and (clear ?b)
                 (on-table ?b)
                 (handempty)
                 (not (holding ?b))
    )
  )

  (:action stack
    :parameters (?b ?b2)
    :precondition (and (holding ?b) (clear ?b2))
    :effect (and (on ?b ?b2)
                 (clear ?b)
                 (not (clear ?b2))
                 (handempty)
                 (not (holding ?b))
    )
  )

  (:action unstack
    :parameters (?b ?b2)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty))
    :effect (and (holding ?b)
                 (clear ?b2)
                 (not (on ?b ?b2))
                 (not (clear ?b))
                 (not (handempty))
    )
  )
)