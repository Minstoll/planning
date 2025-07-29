(define (domain blockworld)
  (:predicates
    (clear ?x)
    (ontable ?x)
    (on ?x ?y)
    (holding ?x)
    (handempty)
  )

  (:action pick-up
    :parameters (?x)
    :precondition (and (clear ?x) (ontable ?x) (handempty))
    :effect 
    (and (not (ontable ?x))
         (not (clear ?x))
         (holding ?x)
         (not (handempty)))
  )

  (:action put-down
    :parameters (?x)
    :precondition (holding ?x)
    :effect 
    (and (ontable ?x)
         (clear ?x)
         (not (holding ?x))
         (handempty))
  )

  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect 
    (and (on ?x ?y)
         (clear ?x)
         (not (clear ?y))
         (not (holding ?x))
         (handempty))
  )

  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect 
    (and (holding ?x)
         (clear ?y)
         (not (on ?x ?y))
         (not (clear ?x))
         (not (handempty)))
  )
)