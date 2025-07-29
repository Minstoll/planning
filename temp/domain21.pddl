(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (clear ?b - block)
    (ontable ?b - block)
    (on ?b1 - block ?b2 - block)
    (holding ?b - block)
    (handempty)
  )
  
  (:action pickup
    :parameters (?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty))
    :effect (and (holding ?b)
                 (not (clear ?b))
                 (not (ontable ?b))
                 (not (handempty)))
  )

  (:action putdown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (ontable ?b)
                 (clear ?b)
                 (handempty)
                 (not (holding ?b)))
  )

  (:action stack
    :parameters (?b - block ?b2 - block)
    :precondition (and (holding ?b) (clear ?b2))
    :effect (and (on ?b ?b2)
                 (clear ?b)
                 (handempty)
                 (not (holding ?b))
                 (not (clear ?b2)))
  )

  (:action unstack
    :parameters (?b - block ?b2 - block)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty))
    :effect (and (holding ?b)
                 (clear ?b2)
                 (not (on ?b ?b2))
                 (not (handempty)))
  )
)