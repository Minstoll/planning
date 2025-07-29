(define (domain blocksworld)

  (:requirements :strips :typing)

  (:types block)

  (:predicates
    (clear ?b - block)
    (on ?x - block ?y - block)
    (ontable ?b - block)
    (holding ?b - block)
    (handempty)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty))
    :effect (and (holding ?b)
                 (not (clear ?b))
                 (not (ontable ?b))
                 (not (handempty))
            )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (ontable ?b)
                 (clear ?b)
                 (handempty)
                 (not (holding ?b))
            )
  )

  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and (on ?b ?x)
                 (clear ?b)
                 (handempty)
                 (not (holding ?b))
                 (not (clear ?x))
            )
  )

  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and (holding ?b)
                 (clear ?x)
                 (not (on ?b ?x))
                 (not (handempty))
            )
  )
)