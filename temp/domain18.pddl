(define (domain block-stacking)
  (:predicates
    (clear ?b)
    (ontable ?b)
    (holding ?b)
    (on ?b ?b2)
    (handempty)
  )
  
  (:action pick-up
    :parameters (?b)
    :precondition (and (clear ?b) (ontable ?b) (handempty))
    :effect (and (holding ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty)))
  )
  
  (:action put-down
    :parameters (?b)
    :precondition (holding ?b)
    :effect (and (ontable ?b) (not (holding ?b)) (clear ?b) (handempty))
  )
  
  (:action stack
    :parameters (?b ?b2)
    :precondition (and (holding ?b) (clear ?b2))
    :effect (and (on ?b ?b2) (not (holding ?b)) (not (clear ?b2)) (handempty) (clear ?b))
  )
  
  (:action unstack
    :parameters (?b ?b2)
    :precondition (and (on ?b ?b2) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?b2) (not (on ?b ?b2)) (not (handempty)))
  )
)