(define (domain blockstack)
  (:requirements :strips)

  (:predicates
    (clear ?b)
    (holding ?b)
    (on-table ?b)
    (on ?b1 ?b2)
    (handempty)
  )

  (:action pickup
    :parameters (?b)
    :precondition (and (clear ?b) (on-table ?b) (handempty))
    :effect (and (holding ?b) (not (clear ?b)) (not (on-table ?b)) (not (handempty)))
  )

  (:action putdown
    :parameters (?b)
    :precondition (holding ?b)
    :effect (and (on-table ?b) (clear ?b) (handempty) (not (holding ?b)))
  )

  (:action stack
    :parameters (?b1 ?b2)
    :precondition (and (holding ?b1) (clear ?b2))
    :effect (and (on ?b1 ?b2) (clear ?b1) (handempty) (not (holding ?b1)) (not (clear ?b2)))
  )

  (:action unstack
    :parameters (?b1 ?b2)
    :precondition (and (clear ?b1) (on ?b1 ?b2) (handempty))
    :effect (and (holding ?b1) (clear ?b2) (not (on ?b1 ?b2)) (not (clear ?b1)) (not (handempty)))
  )
)